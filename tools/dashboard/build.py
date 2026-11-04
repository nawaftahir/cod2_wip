#!/usr/bin/env python3
"""Build the progress page (site/index.html + site/meters.json).

Inputs (format in README.md):
  - every <target>/main branch: ledger/meter.json or meter*.json at its root
  - status/*.json on main (finished or not-yet-imported targets)
  - binaries/SHA256SUMS + the anchors themselves (section sizes come from their headers)
"""
import datetime, glob, html, json, os, struct, subprocess, sys

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
BIN = os.path.join(ROOT, "binaries")
# meters written before the "anchor" field existed
DEFAULT_ANCHOR = {"radiant": "radiant/1.0/CoD2Radiant.exe"}
CORE = {"name", "binary", "version", "anchor", "note", "sha_identical", "sections",
        "text_bytes", "matched_bytes", "same_offset_bytes", "file_bytes",
        "matched_functions", "game_functions", "tus_matched", "tus_total",
        "functions_identical", "functions_total", "tus_identical"}


def pct(a, b):
    return 100.0 * a / b if b else 0.0


def git(*args):
    return subprocess.run(["git", "-C", ROOT, *args], capture_output=True, text=True).stdout


def sections(path):
    """[(name, file_size, mem_size)] from a PE or ELF32 header; [] if unreadable."""
    try:
        with open(path, "rb") as fh:
            d = fh.read()
    except OSError:
        return []
    out = []
    if d[:2] == b"MZ":
        pe = struct.unpack_from("<I", d, 0x3C)[0]
        n, opt = struct.unpack_from("<H", d, pe + 6)[0], struct.unpack_from("<H", d, pe + 20)[0]
        for i in range(n):
            o = pe + 24 + opt + 40 * i
            name = d[o:o + 8].rstrip(b"\0").decode("latin1")
            vsize, _, raw = struct.unpack_from("<III", d, o + 8)
            out.append((name, raw, vsize))
    elif d[:4] == b"\x7fELF":
        shoff = struct.unpack_from("<I", d, 0x20)[0]
        entsz, num, stridx = struct.unpack_from("<HHH", d, 0x2E)
        strtab = struct.unpack_from("<I", d, shoff + stridx * entsz + 16)[0]
        for i in range(num):
            nm, typ, flags, _, _, size = struct.unpack_from("<IIIIII", d, shoff + i * entsz)
            if flags & 2:  # SHF_ALLOC: part of the loaded image
                name = d[strtab + nm:d.index(b"\0", strtab + nm)].decode("latin1")
                out.append((name, 0 if typ == 8 else size, size))  # SHT_NOBITS has no file bytes
    return out


def anchors():
    rows = []
    try:
        with open(os.path.join(BIN, "SHA256SUMS")) as fh:
            for line in fh:
                sha, rel = line.split()
                p = os.path.join(BIN, rel)
                rows.append({"anchor": rel, "sha256": sha, "size": os.path.getsize(p) if os.path.exists(p) else 0})
    except OSError:
        pass
    return rows


def branch_meters():
    # remote refs in CI, local ones when previewing without a fetch
    # any depth: radiant/main, client/1.3/main
    def mains(prefix):
        refs = git("for-each-ref", "--format=%(refname:short)", prefix).split()
        return [r for r in refs if r.endswith("/main") and r != "origin/main"]
    refs = mains("refs/remotes/origin/") or mains("refs/heads/")
    for ref in sorted(refs):
        target = ref.removeprefix("origin/").removesuffix("/main")
        files = git("ls-tree", "--name-only", ref, "ledger/meter.json").split() \
            + [f for f in git("ls-tree", "--name-only", ref).split() if f.startswith("meter") and f.endswith(".json")]
        when = git("log", "-1", "--format=%cs %h", ref).strip()
        for f in files:
            m = json.loads(git("show", f"{ref}:{f}"))
            stem = os.path.splitext(os.path.basename(f))[0].removeprefix("meter").lstrip("-")
            m.setdefault("name", f"{target} {stem}".strip())
            m.setdefault("anchor", DEFAULT_ANCHOR.get(target))
            m["_src"], m["_when"] = f"{target}/main:{f}", when
            yield m


def load():
    rows = list(branch_meters())
    for p in sorted(glob.glob(os.path.join(ROOT, "status/*.json"))):
        with open(p) as fh:
            m = json.load(fh)
        m.setdefault("name", os.path.splitext(os.path.basename(p))[0])
        m["_src"], m["_when"] = "main:status/" + os.path.basename(p), ""
        rows.append(m)
    for m in rows:
        a = m.get("anchor")
        m["_sections"] = sections(os.path.join(BIN, a)) if a else []
    return rows


# ---------- rendering ----------

E = html.escape


def num(v):
    return f"{v:,}" if isinstance(v, int) else E(str(v))


def bar(v, cls=""):
    return f'<div class="bar {cls}"><i style="width:{min(v, 100):.2f}%"></i></div>'


def frac(a, b):
    """'a / b  (x%)' or 'not measured'."""
    if a is None or not b:
        return '<span class="mute">not measured</span>'
    return f'{num(a)} / {num(b)} <b>{pct(a, b):.2f}%</b>'


def tile(label, a, b, hint):
    if a is None or not b:
        return f'<div class="tile"><span>{label}</span><strong class="mute">n/a</strong><small>{hint}</small></div>'
    v = pct(a, b)
    return f'<div class="tile"><span>{label}</span><strong>{v:.2f}%</strong>{bar(v)}<small>{num(a)} / {num(b)}</small></div>'



def count_tile(label, value, hint):
    return (f'<div class="tile"><span>{E(label)}</span><strong>{E(str(value))}</strong>'
            f'<small>{E(hint)}</small></div>')


def humanize(k):
    return k.replace("_", " ").capitalize()


def fns(m):  # newer meters: referee match or same bytes in place; older ones: referee only
    if "functions_total" in m: return m["functions_identical"], m["functions_total"]
    return m.get("matched_functions"), m.get("game_functions")


def tus(m):
    return m.get("tus_identical", m.get("tus_matched")), m.get("tus_total")


def card(m):
    secs = m.get("sections") or {}
    text = (m.get("matched_bytes"), m.get("text_bytes"))
    whole = (m.get("same_offset_bytes"), m.get("file_bytes"))
    sha = '<span class="pill ok">SHA-256 identical</span>' if m.get("sha_identical") else '<span class="pill no">not identical yet</span>'
    source = (m.get("game_cpp_bytes"), m.get("game_cpp_total"))
    source_tile = tile("C/C++ inventory coverage (provisional)", *source,
                       "Game code only; assembly excluded. Not whole-binary completion.") if source[0] is not None and source[1] else ""
    tiles = source_tile + "".join([
        tile(".text matched, including libraries", *text, "Relocations normalized; not source-completion progress."),
        tile("Whole file, same offset", *whole, "bytes already in place"),
        (count_tile("Verified game C/C++ bodies", num(m["game_cpp_functions"]),
                    "Assembly-bearing bodies excluded; not a total-function percentage.")
         if "game_cpp_functions" in m else tile("Functions identical (referee or in place)", *fns(m), "not measured")),
        (count_tile("Current source TUs: emitted bodies verified",
                    f'{num(m["current_source_tus_verified"])} / {num(m["current_source_tus_total"])}',
                    "Includes library TUs. Every emitted body passes both referees; historical TU completeness is unknown.")
         if "current_source_tus_verified" in m else tile("TUs fully identical", *tus(m), "not measured")),
    ])
    srows = []
    for name, raw, vsize in m["_sections"]:
        s = secs.get(name, {})
        matched = s.get("matched", text[0] if name == ".text" and text[0] is not None and not secs else None)
        size = raw or vsize
        if m.get("sha_identical") and not s:  # measured section values win
            matched, same = size, size
        else:
            same = s.get("same_offset")
        srows.append(f"<tr><td><code>{E(name)}</code></td><td>{num(raw)}</td><td>{num(vsize)}</td>"
                     f"<td>{frac(matched, size)}</td><td>{frac(same, size)}</td></tr>")
    for name, s in secs.items():  # sections the meter names but the anchor parse missed
        if name not in {x[0] for x in m["_sections"]}:
            srows.append(f"<tr><td><code>{E(name)}</code></td><td colspan=2 class=mute>-</td>"
                         f"<td>{frac(s.get('matched'), s.get('size'))}</td><td>{frac(s.get('same_offset'), s.get('size'))}</td></tr>")
    stable = ("<table><thead><tr><th>Section</th><th>File bytes</th><th>Memory bytes</th><th>Matched</th><th>Same offset</th></tr></thead>"
              f"<tbody>{''.join(srows)}</tbody></table>") if srows else '<p class="mute">No section table: no anchor binary set for this meter.</p>'
    extra = [(k, v) for k, v in m.items() if k not in CORE and not k.startswith("_") and isinstance(v, (int, float, bool))]
    dtable = ("<details><summary>All referee numbers ({})</summary><table><tbody>{}</tbody></table></details>".format(
        len(extra), "".join(f"<tr><td>{E(humanize(k))}</td><td>{num(v)}</td></tr>" for k, v in extra))) if extra else ""
    sub = " &middot; ".join(E(str(m[k])) for k in ("binary", "version") if m.get(k)) or E(m.get("anchor") or "")
    note = f'<p class="note">{E(m["note"])}</p>' if m.get("note") else ""
    src = f'<p class="src">Source <code>{E(m["_src"])}</code>{" &middot; " + E(m["_when"]) if m["_when"] else ""}' \
          f'{" &middot; anchor <code>binaries/" + E(m["anchor"]) + "</code>" if m.get("anchor") else ""}</p>'
    return (f'<section class="card" id="{E(m["name"].replace(" ", "-"))}"><header><h2>{E(m["name"])}</h2>{sha}</header>'
            f'<p class="sub">{sub}</p>{note}<div class="tiles">{tiles}</div><h3>Sections</h3>{stable}{dtable}{src}</section>')


def summary(rows, anchor_rows):
    by_anchor = {m.get("anchor"): m for m in rows if m.get("anchor")}
    trs = []
    for m in rows:
        t, w = pct(m.get("matched_bytes", 0), m.get("text_bytes", 0)), pct(m.get("same_offset_bytes", 0), m.get("file_bytes", 0))
        source = frac(m.get("game_cpp_bytes"), m.get("game_cpp_total"))
        fn = '{} / {}'.format(*map(num, fns(m))) if fns(m)[1] else '<span class="mute">n/a</span>'
        tu = '{} / {}'.format(*map(num, tus(m))) if tus(m)[1] else '<span class="mute">n/a</span>'
        ok = '<span class="ok">yes</span>' if m.get("sha_identical") else "no"
        trs.append(f'<tr><td><a href="#{E(m["name"].replace(" ", "-"))}">{E(m["name"])}</a></td>'
                   f'<td>{source}</td><td>{bar(t, "s")}<b>{t:.2f}%</b></td><td>{bar(w, "s")}<b>{w:.2f}%</b></td><td>{fn}</td><td>{tu}</td><td>{ok}</td></tr>')
    for a in anchor_rows:
        if a["anchor"] not in by_anchor and not any(a["anchor"].endswith(m.get("binary") or "\0") for m in rows):
            trs.append(f'<tr class="idle"><td>{E(a["anchor"])}</td><td colspan=5 class="mute">not started</td><td>no</td></tr>')
    return ("<table class=sum><thead><tr><th>Binary</th><th>C/C++ inventory (provisional)</th><th>.text matched, incl. libraries</th><th>Whole file, same offset</th>"
            f"<th>Functions identical</th><th>TUs fully identical</th><th>SHA identical</th></tr></thead><tbody>{''.join(trs)}</tbody></table>")


def anchor_table(anchor_rows):
    trs = "".join(f"<tr><td><code>{E(a['anchor'])}</code></td><td>{num(a['size'])}</td><td><code class=sha>{E(a['sha256'])}</code></td></tr>"
                  for a in anchor_rows)
    return f"<details><summary>Retail anchors ({len(anchor_rows)})</summary><table><thead><tr><th>File</th><th>Bytes</th><th>SHA-256</th></tr></thead><tbody>{trs}</tbody></table></details>"


LEGEND = """<details class="legend"><summary>What the numbers mean</summary><dl>
<dt>C/C++ inventory coverage (provisional)</dt><dd>Verified game C/C++ bytes divided by the current game-function inventory. Entire assembly-bearing bodies are excluded. The inventory is provisional: this is not whole-binary completion.</dd>
<dt>.text matched, including libraries</dt><dd>Accepted code extents including third-party libraries and runtime code, with relocations normalized. A high value does not mean the game source is almost reconstructed or the linked file is identical.</dd>
<dt>Whole file, same offset</dt><dd>Bytes of the rebuilt file that already sit at the same file offset with the same value as retail. 100% here means the files are identical.</dd>
<dt>Functions identical (referee or in place)</dt><dd>Functions the referee matches, or whose bytes already sit unchanged at the same offset as retail (relocations included).</dd>
<dt>TUs fully identical</dt><dd>Source files (translation units) whose every function is identical; CRT/library objects are counted separately. Older meters: TUs the referee verified.</dd>
<dt>Sections</dt><dd>Sizes come straight from the retail anchor's header. Matched and same-offset columns come from the target's referee; "not measured" means its meter doesn't report that section yet.</dd>
<dt>SHA-256 identical</dt><dd>The rebuilt binary hashes the same as retail: the finish line.</dd></dl></details>"""

CSS = """:root{--bg:#f6f7f9;--card:#fff;--fg:#1b1f24;--mute:#68707c;--line:#e3e6ea;--acc:#2f6fdb;--ok:#1a7f37;--no:#a65300}
@media (prefers-color-scheme:dark){:root{--bg:#0f1115;--card:#171a20;--fg:#e6e8eb;--mute:#8b93a0;--line:#2a2f38;--acc:#5b9bff;--ok:#3fb950;--no:#e3a03a}}
*{box-sizing:border-box}body{margin:0;background:var(--bg);color:var(--fg);font:15px/1.45 system-ui,sans-serif}
main{max-width:1080px;margin:0 auto;padding:24px 16px}h1{margin:0 0 4px;font-size:22px}h2{margin:0;font-size:18px}h3{font-size:14px;margin:18px 0 6px;color:var(--mute);text-transform:uppercase;letter-spacing:.04em}
.meta,.mute,.sub,.src,.note{color:var(--mute)}.meta{margin:0 0 20px}.sub{margin:2px 0 0}.src{font-size:12px;margin:14px 0 0}.note{margin:8px 0 0}
.card{background:var(--card);border:1px solid var(--line);border-radius:10px;padding:18px;margin:16px 0}
header{display:flex;flex-wrap:wrap;align-items:center;gap:10px}.pill{font-size:12px;font-weight:600;padding:2px 8px;border-radius:99px;border:1px solid currentColor}
.ok{color:var(--ok)}.no{color:var(--no)}
.tiles{display:grid;gap:10px;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));margin-top:14px}
.tile{border:1px solid var(--line);border-radius:8px;padding:10px 12px;display:grid;gap:4px}.tile span{font-size:12px;color:var(--mute)}
.tile strong{font-size:24px;font-variant-numeric:tabular-nums}.tile small{color:var(--mute);font-variant-numeric:tabular-nums}
.bar{height:8px;background:var(--line);border-radius:4px;overflow:hidden}.bar i{display:block;height:100%;background:var(--acc)}
.bar.s{display:inline-block;width:80px;height:6px;margin-right:8px;vertical-align:middle}
.scroll{overflow-x:auto}table{border-collapse:collapse;width:100%;font-size:13px;font-variant-numeric:tabular-nums}
th,td{text-align:left;padding:6px 8px;border-bottom:1px solid var(--line);white-space:nowrap}th{color:var(--mute);font-weight:500}
.sum{background:var(--card);border:1px solid var(--line);border-radius:10px}.idle td{color:var(--mute)}
details{margin-top:12px}summary{cursor:pointer;color:var(--acc)}code{font-size:12px}.sha{word-break:break-all;white-space:normal}
.legend dl{display:grid;grid-template-columns:auto 1fr;gap:6px 14px}.legend dt{font-weight:600}.legend dd{margin:0;color:var(--mute)}
a{color:var(--acc)}"""


def render(rows, anchor_rows, commit, when):
    cards = "".join(card(m) for m in rows) or "<p>No meters yet.</p>"
    return f"""<!doctype html><html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1"><title>CoD2 Reconstruction</title><style>{CSS}</style></head>
<body><main><h1>CoD2 reconstruction progress</h1>
<p class="meta">Built from main @ <code>{E(commit)}</code> &middot; {E(when)}</p>
{LEGEND}<div class="scroll">{summary(rows, anchor_rows)}</div>{cards}
<div class="card">{anchor_table(anchor_rows)}</div></main></body></html>"""


def main():
    commit = git("rev-parse", "--short", "HEAD").strip() or "?"
    when = datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%d %H:%M UTC")
    rows, anchor_rows = load(), anchors()
    out = os.path.join(ROOT, "site")
    os.makedirs(out, exist_ok=True)
    with open(os.path.join(out, "index.html"), "w") as fh:
        fh.write(render(rows, anchor_rows, commit, when))
    with open(os.path.join(out, "meters.json"), "w") as fh:
        json.dump({"commit": commit, "built": when, "meters": rows, "anchors": anchor_rows}, fh, indent=1)
    print(f"{len(rows)} meters, {len(anchor_rows)} anchors -> site/")


def selftest():
    assert pct(1, 4) == 25.0 and pct(1, 0) == 0.0
    m = {"name": "x<y", "matched_bytes": 1, "text_bytes": 2, "sha_identical": False, "lib_bytes": 7,
         "sections": {".data": {"matched": 3, "size": 4}}, "_src": "s", "_when": "", "_sections": [(".text", 2, 2)]}
    page = render([m], [], "abc", "now")
    assert "50.00%" in page and "x&lt;y" in page and "75.00%" in page and "Lib bytes" in page
    renderer = dict(m, game_cpp_bytes=118475, game_cpp_total=253580,
                    matched_bytes=771254, text_bytes=1093632)
    page = render([renderer], [], "abc", "now")
    assert "46.72%" in page and "70.52%" in page
    rendered_card = card(renderer)
    assert rendered_card.index("46.72%") < rendered_card.index("70.52%")
    assert "C/C++ inventory (provisional)" in page
    assert "including libraries" in page and "not whole-binary completion" in page
    counted = card(dict(renderer, game_cpp_functions=729,
                        current_source_tus_verified=43, current_source_tus_total=112))
    assert "729" in counted and "43 / 112" in counted
    assert "historical TU completeness is unknown" in counted
    assert "TUs fully identical" not in counted
    missing = card(m)
    assert "C/C++ inventory coverage (provisional)" not in missing
    assert "C/C++ inventory coverage (provisional)" not in card(dict(m, game_cpp_total=253580))
    # PE and ELF section parsing against real anchors when present
    for rel, want in (("windows/1.0/CoD2MP_s.exe", ".text"), ("linux/cod2_lnxded_1_0a", ".text")):
        p = os.path.join(BIN, rel)
        if os.path.exists(p):
            assert want in [s[0] for s in sections(p)], rel
    p = os.path.join(BIN, "linux/cod2_lnxded_1_0a")
    if os.path.exists(p):
        assert dict((n, r) for n, r, _ in sections(p))[".text"] == 980640  # checksums.yml
    print("ok")


if __name__ == "__main__":
    selftest() if sys.argv[1:] == ["--test"] else main()
