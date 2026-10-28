# CoD2Radiant Reconstruction — Gemini Progress Log

## Starting Baseline
- **Date**: 2026-10-28
- **Starting Git Commit**: `cb05b444a1d4e68225843b11db5a76f6ac56e3d5` ("Handoff for Codex")
- **Starting Branch**: `main`
- **Compiler / Toolchain**: MSVC 7.10.3077 (VS.NET 2003) via Docker image `cod2-radiant-msvc71`
- **Referee**: `tools/verify.py` (checks linked executable bytes with relocation normalization)

### Baseline Meters (at commit `cb05b44`):
| Metric | Baseline Value |
|---|---|
| Linked matches | 304 / 304 (0 failures) |
| Game functions matched | 304 / 3579 (8.49%) |
| Game code bytes matched | 40,711 / 699,591 bytes (5.82%) |
| Known source file placements | 3509 / 3579 |
| Unverified functions in `src/` | 50 |
| Emit-order warnings | 1 |

---

## Strategy & Operating Rules
1. **Referee is the sole authority**: No function is marked matched without a verified 100% `MATCH` output from `tools/verify.py` inside the linked exe.
2. **Strict try limit**: Max 8 tries per function. If not matching after 8 tries, log reason in `ledger/defer.tsv` and move to next.
3. **Auditability**: Every step, source change, and matched address is documented here with commit hashes for senior peer review.
4. **Current Target**: `src/universal/com_files.cpp` (97 functions total mapped in `data/tu_map.tsv`).

---

## Progress Log

### Step 1: Environment & Baseline Check
- Confirmed referee and link pipeline (`make verify` = 304/304 matches, 0 failures).
- Cleaned Docker permissions to ensure normal workspace ownership.
- Initialized `radiant/gemini/PROGRESS.md` tracking document at commit `cb05b44`.

### Step 2: Target File — `src/universal/com_files.cpp`
- **Total functions in range**: 97 functions (addresses `0x0047da80` - `0x00483860`).
- **Already matched in ledger**: 1 function (`0x0047f2b0`, `FUN_0047f2b0`, 37 bytes).
- **Source origin**: CoD2 Linux server 1.0/1.3 source (`cod2engine/archive/lnxded-1.0/src/universal/com_files.cpp`) + Mac STABS decompilation (`refrences/cod2-mp-macho/PC/universal/com_files.c`).

#### Batch 1: Functions 0x0047da80 – 0x0047db10 (Matched: 6/6)
- **Commit**: `ed0e17ee47108cf1768c74455b26713a7440aa16` ("com_files: match 6 functions (0x47da80-0x47db10)")
All verified 100% byte-match inside linked executable (`make try` & `make verify`):
| Address | Size | Symbol | Function Name | Status | Evidence / Notes |
|---|---|---|---|---|---|
| `0x0047da80` | 14 B | `?FS_Initialized@@YAHXZ` | `FS_Initialized` | **MATCH** | STABS line 319; tests `fs_searchpaths != NULL` |
| `0x0047da90` | 25 B | `?FS_CheckFileSystemStarted@@YAXXZ` | `FS_CheckFileSystemStarted` | **MATCH** | STABS line 336; calls `Com_Error(ERR_FATAL, "Filesystem call made without initialization\n")` |
| `0x0047dab0` | 6 B | `?FS_LoadStack@@YAHXZ` | `FS_LoadStack` | **MATCH** | STABS line 398; returns `fs_loadStack` |
| `0x0047dac0` | 29 B | `?FS_UseSearchPath@@YAHPBUsearchpath_t@@@Z` | `FS_UseSearchPath` | **MATCH** | STABS line 415; `searchpath_t` localized check + `fs_ignoreLocalized` |
| `0x0047dae0` | 43 B | `?FS_LanguageHasAssets@@YAHH@Z` | `FS_LanguageHasAssets` | **MATCH** | STABS line 436; traverses `fs_searchpaths` matching language |
| `0x0047db10` | 89 B | `?FS_HashFileName@@YAJPBDH@Z` | `FS_HashFileName` | **MATCH** | Hash loop with `i + 119`, shift XOR mixing |

#### Current Status Post-Batch 1:
- **Total Matched Rows**: **310 / 310** (0 failures).
- **Game functions matched**: 310 / 3579 (8.66%) (+6 functions).
- **Game code bytes matched**: 40,917 / 699,591 bytes (+206 bytes).
- **Unverified functions in `src/`**: 50 (unchanged).
