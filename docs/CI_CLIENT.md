# Client CI (CoD2MP_s.exe 1.0 and 1.3)

Measured 2026-11-04, probe run 41882687781 (branch `ci/client-probe`, since deleted).

## Result
| Target | Source | CI matched-fn bytes | Local clean | Same-offset | Gate wall time |
|---|---|---|---|---|---|
| 1.3 | `client/1.3/main` fd9e4c65 | 1,503,407 | 1,503,407 | 205,586 | 1m11s |
| 1.0 | `client/1.0/main` 3a4d25d3 | 1,336,591 | 1,336,591 | 1,699,171 / 1,699,840 = 99.961% | 1m24s |

Both builds are clean builds (fresh checkout, no `build/`), and both runs printed `RATCHET OK` with no function lost.
A whole job takes about 2m10s: image pull 9-11s, apt plus pip 22-43s, then the gate.
Cache: nothing is cached and none is needed at this speed. If builds grow, cache `build/obj` keyed on
`hashFiles('src/**','Makefile')` plus the image digest, and never reuse it for an accept (clean builds only).

## Image
- `ghcr.io/nawaftahir/cod2-client@sha256:3f75bedb96942f296a00d2aca43dc8727f4600d41e92d08e85cb682cd1c42b67`
  (tag `:1`, private, about 156 MB compressed, linux/386 config).
  - It is local `cod2-msvc71-vs2003-ft` (VS .NET 2003 cl 13.10.3077 under wine, plus libfaketime)
    with `/opt/client-sdk/` added (5.5 MB):
    - `Lib/d3d9.lib` and `Lib/dsound.lib` from DXSDK Summer 2004
    - `vc70/`: VS .NET 2002 cl/lib, needed for `mss32.lib`
  - CI therefore needs no local files; the anchor comes from `binaries/` on main.
- Auth: `GITHUB_TOKEN` with `packages: read`. The package grants Read to `nawaftahir/cod2_wip`
  (package settings > Manage Actions access). Any new package needs the same grant, or the pull gets 403.
- `cod2-client-msvc71` and `cod2-client-ci` are older copies; CI does not use them.

## Pitfalls hit
- **Wine needs the 386 platform.** Without `--platform linux/386` on `docker run`, wine fails with
  `wineserver: socket: Function not implemented` on every cl/rc call. Use the radiant setup: `ubuntu-22.04`
  plus `--platform linux/386`.
- **Pin the image by digest.** The pushed index labels the manifest `linux/amd64` even though its config
  is 386. Running `--platform linux/386` against a tag or a retag then fails with "no matching manifest".
  A digest ref works, as it does for radiant.
- **The Makefile hardcodes `IMAGE :=`.** CI overrides it with `MAKEFLAGS="IMAGE=$IMAGE"`, because the
  ratchet scripts call `make` themselves.
- **Needed change on `client/1.x/main`** (each Makefile, not done yet). The probe used:
  ```make
  IMAGE  := cod2-msvc71-vs2003-ft
  # CI passes --platform linux/386 (wineserver needs it on the runner)
  DOCKER_FLAGS ?=
  ...
  docker run --rm $(DOCKER_FLAGS) -v ...     # both docker run lines (all/release)
  ```
- Host needs `gcc-multilib` for `guidpin.so`, plus `pefile` and `capstone`.

## Workflow template (`.github/workflows/client.yml` on each `client/1.x/main`)
The gate fails on any non-tie lost function or a matched-fn drop, because the ratchet exits 1.
On `client/*/main` it also runs `accept` and requires the committed meter's numbers to equal the measured
ones. CI never commits; the worker commits the meter from a local accept. The page workflow
(`workflows: [client]`) then rebuilds.

```yaml
name: client

on:
  push:
    branches: ['client/**']
  workflow_dispatch:

permissions:
  contents: read
  packages: read

concurrency:
  group: client-${{ github.ref }}
  cancel-in-progress: true

env:
  IMAGE: ghcr.io/nawaftahir/cod2-client@sha256:3f75bedb96942f296a00d2aca43dc8727f4600d41e92d08e85cb682cd1c42b67

jobs:
  gate:
    runs-on: ubuntu-22.04
    timeout-minutes: 30
    steps:
      - uses: actions/checkout@11d5960a326750d5838078e36cf38b85af677262
      - name: Version from branch
        run: |
          case "$GITHUB_REF_NAME" in
            client/1.0/*) v=1.0 ;;
            client/1.3/*) v=1.3 ;;
            *) echo "unknown client branch"; exit 1 ;;
          esac
          printf 'VER=%s\nGATE=tools/ratchet%s.sh\n' $v ${v/./} >> "$GITHUB_ENV"
      - name: Anchors from main (gates default to ../binaries)
        run: |
          git fetch --depth=1 origin main
          git archive origin/main binaries | tar -x -C ..
          cd ../binaries && sha256sum -c SHA256SUMS --ignore-missing
      - name: Pull private toolchain
        env:
          GH_TOKEN: ${{ github.token }}
        run: |
          printf '%s' "$GH_TOKEN" | docker login ghcr.io -u "$GITHUB_ACTOR" --password-stdin
          docker pull "$IMAGE"
      - name: Host deps and SDK
        run: |
          sudo apt-get update -qq && sudo apt-get install -y -qq gcc-multilib >/dev/null
          pip install -q pefile capstone
          c=$(docker create "$IMAGE"); docker cp "$c:/opt/client-sdk" ../sdk; docker rm "$c"
          cp -r ../sdk/vc70 toolchain/vc70
      - name: Clean build + referee
        run: |
          MAKEFLAGS="IMAGE=$IMAGE" DOCKER_FLAGS='--platform linux/386' DXSDK=$PWD/../sdk \
            $GATE "ci $GITHUB_SHA" 2>&1 | tee build-gate.log
          test "${PIPESTATUS[0]}" = 0
      - name: Meter matches the referee (main only)
        if: endsWith(github.ref_name, '/main')
        run: |
          cp meter-$VER.json /tmp/committed.json
          $GATE accept
          python3 - "$VER" <<'P'
          import json, sys
          v = sys.argv[1]
          a, b = json.load(open('/tmp/committed.json')), json.load(open('meter-%s.json' % v))
          keys = [k for k in b if isinstance(b[k], (int, float, bool))]
          bad = [k for k in keys if a.get(k) != b[k]]
          print('meter fields checked:', len(keys))
          sys.exit('committed meter differs from CI: %s' % bad if bad else 0)
          P
      - uses: actions/upload-artifact@ea165f8d65b6e75b540449e92b4886f43607fa02
        if: always()
        with:
          name: client-gate-${{ github.sha }}
          retention-days: 7
          path: |
            build-gate.log
            build/sha.txt
            build/cmp13.sum
            meter-*.json
```
Upload only logs and meters, never the built exe or retail bytes.
Not run as written yet: the anchor step (the probe kept `binaries/` in the same checkout, with sources one
level down) and the meter comparison, which assumes `meter.py` writes the same numbers on a rerun.
Check both on the first real `client` run.
