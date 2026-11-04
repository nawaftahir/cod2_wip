#!/usr/bin/env python3
"""Build the progress page (site/index.html) from each target's committed meter.

A meter is JSON with radiant's ledger/meter.json field names. Only these are read:
  text_bytes, matched_bytes, same_offset_bytes, file_bytes,
  matched_functions, game_functions, sha_identical
plus optional: name, binary, version, note.
Found at targets/*/ledger/meter.json, targets/*/meter*.json and status/*.json.
"""
import glob, html, json, os, subprocess, sys, datetime

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


def pct(a, b):
    return 100.0 * a / b if b else 0.0


def load():
    rows = []
    pats = ["targets/*/ledger/meter.json", "targets/*/meter*.json", "status/*.json"]
    for p in sorted({f for pat in pats for f in glob.glob(os.path.join(ROOT, pat))}):
        with open(p) as fh:
            m = json.load(fh)
        rel = os.path.relpath(p, ROOT)
        m.setdefault("name", rel.split(os.sep)[1] if rel.startswith("targets") else os.path.splitext(os.path.basename(p))[0])
        m["_src"] = rel.replace(os.sep, "/")
        rows.append(m)
    return rows


def bar(v):
    return f'<div class="bar"><i style="width:{min(v, 100):.2f}%"></i></div><b>{v:.2f}%</b>'


def render(rows, commit, when):
    cards = []
    for m in rows:
        text = pct(m.get("matched_bytes", 0), m.get("text_bytes", 0))
        whole = pct(m.get("same_offset_bytes", 0), m.get("file_bytes", 0))
        fns = f'{m["matched_functions"]:,} / {m["game_functions"]:,}' if "game_functions" in m else "n/a"
        sha = '<span class="ok">SHA identical</span>' if m.get("sha_identical") else '<span class="no">not identical</span>'
        title = html.escape(m["name"])
        sub = html.escape(" ".join(str(m[k]) for k in ("binary", "version") if m.get(k)))
        note = f'<p class="note">{html.escape(m["note"])}</p>' if m.get("note") else ""
        cards.append(f"""<section class="card">
<header><h2>{title}</h2><span class="sub">{sub}</span>{sha}</header>
<div class="row"><span>.text matched</span>{bar(text)}</div>
<div class="row"><span>whole file, same offset</span>{bar(whole)}</div>
<dl><dt>functions</dt><dd>{fns}</dd><dt>.text bytes</dt><dd>{m.get("matched_bytes", 0):,} / {m.get("text_bytes", 0):,}</dd>
<dt>file bytes</dt><dd>{m.get("same_offset_bytes", 0):,} / {m.get("file_bytes", 0):,}</dd><dt>source</dt><dd><code>{html.escape(m["_src"])}</code></dd></dl>{note}
</section>""")
    return f"""<!doctype html><html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1"><title>CoD2 Reconstruction</title>
<style>
:root{{--bg:#f6f7f9;--card:#fff;--fg:#1b1f24;--mute:#667;--line:#e3e6ea;--acc:#2f6fdb;--ok:#1a7f37;--no:#b35900}}
@media (prefers-color-scheme:dark){{:root{{--bg:#0f1115;--card:#171a20;--fg:#e6e8eb;--mute:#8b93a0;--line:#2a2f38;--acc:#5b9bff;--ok:#3fb950;--no:#e3a03a}}}}
*{{box-sizing:border-box}}body{{margin:0;background:var(--bg);color:var(--fg);font:15px/1.45 system-ui,sans-serif}}
main{{max-width:980px;margin:0 auto;padding:24px 16px}}h1{{margin:0 0 4px;font-size:22px}}.meta{{color:var(--mute);margin:0 0 20px}}
.grid{{display:grid;gap:16px;grid-template-columns:repeat(auto-fill,minmax(300px,1fr))}}
.card{{background:var(--card);border:1px solid var(--line);border-radius:10px;padding:16px}}
header{{display:flex;flex-wrap:wrap;align-items:baseline;gap:8px;margin-bottom:12px}}h2{{margin:0;font-size:17px}}
.sub{{color:var(--mute);flex:1}}.ok{{color:var(--ok);font-weight:600}}.no{{color:var(--no);font-weight:600}}
.row{{display:grid;grid-template-columns:1fr;gap:4px;margin:10px 0}}.row span{{color:var(--mute);font-size:13px}}
.row b{{font-variant-numeric:tabular-nums}}.bar{{height:8px;background:var(--line);border-radius:4px;overflow:hidden}}
.bar i{{display:block;height:100%;background:var(--acc)}}
dl{{display:grid;grid-template-columns:auto 1fr;gap:2px 12px;margin:12px 0 0;font-size:13px}}dt{{color:var(--mute)}}dd{{margin:0;font-variant-numeric:tabular-nums}}
code{{font-size:12px}}.note{{color:var(--mute);font-size:13px;margin:8px 0 0}}
</style></head><body><main>
<h1>CoD2 reconstruction progress</h1>
<p class="meta">main @ <code>{html.escape(commit)}</code> &middot; {html.escape(when)}</p>
<div class="grid">{"".join(cards) or "<p>No meters yet.</p>"}</div>
</main></body></html>"""


def main():
    commit = subprocess.run(["git", "-C", ROOT, "rev-parse", "--short", "HEAD"], capture_output=True, text=True).stdout.strip() or "?"
    when = datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%d %H:%M UTC")
    out = os.path.join(ROOT, "site")
    os.makedirs(out, exist_ok=True)
    rows = load()
    with open(os.path.join(out, "index.html"), "w") as fh:
        fh.write(render(rows, commit, when))
    with open(os.path.join(out, "meters.json"), "w") as fh:
        json.dump(rows, fh, indent=1)
    print(f"{len(rows)} meters -> site/")


if __name__ == "__main__":
    if sys.argv[1:] == ["--test"]:
        assert pct(1, 4) == 25.0 and pct(1, 0) == 0.0
        page = render([{"name": "x<y", "matched_bytes": 1, "text_bytes": 2, "sha_identical": True, "_src": "s"}], "abc", "now")
        assert "50.00%" in page and "x&lt;y" in page and "SHA identical" in page
        print("ok")
    else:
        main()
