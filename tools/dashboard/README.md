# Progress page

`build.py` writes `site/index.html` and `site/meters.json`. CI (`.github/workflows/pages.yml`)
runs it after main changes or after a target's CI passes on `<target>/main`.

## Meter format
One JSON file per binary, written by the target's referee, committed on `<target>/main` as
`ledger/meter.json` or `meter*.json` at the root. All fields optional; emit what you measure.

```json
{
  "name": "client 1.0",
  "binary": "CoD2MP_s.exe", "version": "1.0",
  "anchor": "windows/1.0/CoD2MP_s.exe",
  "sha_identical": false,
  "text_bytes": 1204750, "matched_bytes": 68749,
  "file_bytes": 1794048, "same_offset_bytes": 26574,
  "game_functions": 3578, "matched_functions": 569,
  "tus_total": 155, "tus_matched": 40,
  "sections": {
    ".text":  {"matched": 68749, "same_offset": 20000},
    ".rdata": {"matched": 1000,  "same_offset": 900},
    ".data":  {"matched": 500,   "same_offset": 400},
    ".rsrc":  {"matched": 0,     "same_offset": 0}
  },
  "note": "one line shown under the title"
}
```

- `anchor` is a path under `binaries/`. Section names and sizes come from that file's header, so a
  meter never has to send sizes. A section the anchor doesn't have needs `"size"` in its entry.
- Any other number or true/false field (e.g. radiant's `lib_bytes`, `failed_rows`) is listed
  under "All referee numbers".
- `sha_identical: true` marks every section as done.

Finished or not-yet-imported targets: same format in `status/<name>.json` on main.
Self-check: `python3 tools/dashboard/build.py --test`.
