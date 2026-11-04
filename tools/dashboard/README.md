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
- Functions/TUs tiles: `functions_identical` / `functions_total` ("Functions identical (referee or in
  place)": referee match, or same bytes at the same offset as retail) and `tus_identical` / `tus_total`
  ("TUs fully identical": every function identical; CRT/lib objs go in `lib_objs_identical` /
  `lib_objs_total`). Without them the page falls back to the referee's `matched_functions` /
  `game_functions` and `tus_matched`. `text_same_offset_bytes` = `.text` bytes in place.
  A TU with no code counts when all its data symbols are identical in place (`tus_data_only`,
  `tus_data_only_identical`); `tus_empty` = TUs with no symbol in the image (never counted identical).
  `tus_identical_with_data` = TUs whose functions and every data symbol are identical in place.
- Functions/TUs tiles: `functions_identical` / `functions_total` ("Functions identical (referee or in
  place)": referee match, or same bytes at the same offset as retail) and `tus_identical` / `tus_total`
  ("TUs fully identical": every function identical; CRT/lib objs go in `lib_objs_identical` /
  `lib_objs_total`). Without them the page falls back to the referee's `matched_functions` /
  `game_functions` and `tus_matched`. `text_same_offset_bytes` = `.text` bytes in place.
  A TU with no code counts when all its data symbols are identical in place (`tus_data_only`,
  `tus_data_only_identical`); `tus_empty` = TUs with no symbol in the image (never counted identical).
  `tus_identical_with_data` = TUs whose functions and every data symbol are identical in place.

Not-yet-imported targets: same format in `status/<name>.json` on main. Linux servers: `meter-lnxded-*.json` on `servers/main`, written by the `servers` workflow (clean cod2engine build vs anchor).
Self-check: `python3 tools/dashboard/build.py --test`.

Renderer presentation: `game_cpp_bytes / game_cpp_total` is shown first as
provisional C/C++ inventory coverage, excluding assembly-bearing bodies. It is
not whole-binary completion. `.text` matching includes libraries and normalized
relocations and remains a separate diagnostic. No percentage is inferred when
a source-coverage numerator or denominator is absent. CI meters remain the
only source of numbers; successful target CI automatically rebuilds the page.

`current_source_tus_verified / current_source_tus_total` counts current source
objects whose every emitted body passes byte and binding checks, including
library TUs. Ambiguous object basenames are excluded from the verified count
and reported separately. This does not prove complete historical file recovery.
`game_cpp_functions` is a verified body count, not a completion percentage.
