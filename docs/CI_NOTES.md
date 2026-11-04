# What a client 1.3 CI build needs

Not a workflow; input for whoever writes `.github/workflows/client.yml`.

- **Image:** `cod2-msvc71-vs2003-ft` (local; VS .NET 2003 cl 13.10.3077 under wine, plus libfaketime).
  Recipe: `toolchain/Dockerfile` + `toolchain/build.sh` (payloads from `dev/sdk/`, see `toolchain/README.md`),
  `toolchain/ft.Dockerfile` adds faketime. The old repo's CI used the private
  `ghcr.io/nawaftahir/cod2-client-ci:1` (compiler + `/opt/ci/lib/{d3d9,dsound}.lib` + `/opt/ci/anchor/CoD2MP_s.exe`);
  it has no `toolchain/vc70` and no 1.3 anchor, so it needs a rebuild for this layout.
- **Not in git, must be provided:**
  - `toolchain/vc70/` = VS .NET 2002 (7.00.9466) `cl.exe c1.dll c1xx.dll c2.dll lib.exe link.exe mspdb70.dll`
    (builds `mss32.lib` like retail). Local copy: `dev/claude_client13/target/vc70/`.
  - `DXSDK` = DirectX SDK Summer 2004 (`$(DXSDK)/Lib/d3d9.lib`, `$(DXSDK)/Lib/dsound.lib`; Oct 2004 dsound is
    identical, Dec 2004 is not). Default `../../sdk/sum2004`; pass `DXSDK=...` in CI.
  - Anchor `../binaries/windows/1.3/CoD2MP_s.exe` (cod2_wip main, `binaries/`); pass `ANCHOR=...` if the
    checkout has no main worktree next to it. The icon (`tools/rsrc.py`) is cut from it at build time.
- **Host tools:** docker, python3 with `pefile capstone`, `gcc -m32` (builds `build/guidpin.so`, pins the PDB GUID).
- **Env:** none besides `ANCHOR`/`DXSDK`; the release link sets `FAKETIME` and `GUIDPIN` itself.
- **Gate:** `tools/ratchet13.sh` from the target root (one `make release`, then shameter + `tools/cmp13`).
  On green + accept: `meter-1.3.json`.
- **Wall time (clean build, 8 threads, WSL2):** ~7 min clean `make release` (8 threads, WSL2); gate rerun with warm objs ~1.5 min
