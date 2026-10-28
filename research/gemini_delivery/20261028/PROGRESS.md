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
- **Commit**: `e864f81` ("com_files: match 6 functions (0x47da80-0x47db10)")
All verified 100% byte-match inside linked executable (`make try` & `make verify`):
| Address | Size | Symbol | Function Name | Status | Evidence / Notes |
|---|---|---|---|---|---|
| `0x0047da80` | 14 B | `?FS_Initialized@@YAHXZ` | `FS_Initialized` | **MATCH** | STABS line 319; tests `fs_searchpaths != NULL` |
| `0x0047da90` | 25 B | `?FS_CheckFileSystemStarted@@YAXXZ` | `FS_CheckFileSystemStarted` | **MATCH** | STABS line 336; calls `Com_Error(ERR_FATAL, "Filesystem call made without initialization\n")` |
| `0x0047dab0` | 6 B | `?FS_LoadStack@@YAHXZ` | `FS_LoadStack` | **MATCH** | STABS line 398; returns `fs_loadStack` |
| `0x0047dac0` | 29 B | `?FS_UseSearchPath@@YAHPBUsearchpath_t@@@Z` | `FS_UseSearchPath` | **MATCH** | STABS line 415; `searchpath_t` localized check + `fs_ignoreLocalized` |
| `0x0047dae0` | 43 B | `?FS_LanguageHasAssets@@YAHH@Z` | `FS_LanguageHasAssets` | **MATCH** | STABS line 436; traverses `fs_searchpaths` matching language |
| `0x0047db10` | 89 B | `?FS_HashFileName@@YAJPBDH@Z` | `FS_HashFileName` | **MATCH** | Hash loop with `i + 119`, shift XOR mixing |

#### Batch 2: Functions 0x0047db70 – 0x0047e170 (Matched: 10/10)
All verified 100% byte-match inside linked executable (`make try` & `make verify`):
| Address | Size | Symbol | Function Name | Status | Evidence / Notes |
|---|---|---|---|---|---|
| `0x0047db70` | 196 B | `?FS_HandleForFile@@YAHW4FsThread@@@Z` | `FS_HandleForFile` | **MATCH** | Assert line 526 (`!streamThread`); handle pool allocation |
| `0x0047dc40` | 247 B | `?FS_FileForHandle@@YAPAU_iobuf@@H@Z` | `FS_FileForHandle` | **MATCH** | Asserts lines 544, 545, 546; bounds check & FILE extraction |
| `0x0047dd40` | 174 B | `?FS_filelength@@YAHH@Z` | `FS_filelength` | **MATCH** | Assert line 585 (`f`); zip uncompressed size or ftell/fseek |
| `0x0047ddf0` | 57 B | `?FS_ReplaceSeparators@@YAXPAD@Z` | `FS_ReplaceSeparators` | **MATCH** | Windows path separator normalization (`/` -> `\\`) |
| `0x0047de30` | 418 B | `?FS_BuildOSPath_Internal@@YAXPBD00PADW4FsThread@@@Z` | `FS_BuildOSPath_Internal` | **MATCH** | Asserts lines 662, 663, 664 (`base`, `qpath`, `ospath`); length check |
| `0x0047dfe0` | 22 B | `?FS_BuildOSPath@@YAXPBD00PAD@Z` | `FS_BuildOSPath` | **MATCH** | Wrapper calling `FS_BuildOSPath_Internal(..., FS_THREAD_MAIN)` |
| `0x0047e000` | 100 B | `?FS_CreatePath@@YAHPAD@Z` | `FS_CreatePath` | **MATCH** | Relative path security checks (`..`, `::`) & recursive `_mkdir` |
| `0x0047e070` | 235 B | `?FS_CopyFile@@YAXPAD0@Z` | `FS_CopyFile` | **MATCH** | Buffered file copy with `malloc`, `fread`, `fwrite` |
| `0x0047e160` | 8 B | `?FS_Remove@@YAXPBD@Z` | `FS_Remove` | **MATCH** | Single-argument `_rmdir` |
| `0x0047e170` | 114 B | `?FS_FileExists@@YAHPBD@Z` | `FS_FileExists` | **MATCH** | Builds OS path in `fs_homepath` and tests `fopen("rb")` |

#### Current Status Post-Batch 2:
- **Total Matched Rows**: **320 / 320** (0 failures).
- **Game functions matched**: 320 / 3579 (8.94%) (**+16 total across session**).
- **Game code bytes matched**: 42,488 / 699,591 bytes (6.07%) (**+1,777 B total across session**).
- **Rebuilt EXE same-offset byte goal**: **1.204% (+358 bytes in place)**.
- **Unverified functions in `src/`**: 50 (unchanged, 0 leaks).

#### Batch 3: Functions 0x00481040 – 0x004811e0 (Matched: 3/3)
- **Worktree**: `radiant/.agents/gemini`, branch `agent/gemini`
- **Consolidated Baseline**: 383 game functions / 48,845 bytes (747a45c / 4242057)
All verified 100% byte-match inside linked executable (`make try` & `make gate`):
| Address | Size | Symbol | Function Name | Status | Evidence / Notes |
|---|---|---|---|---|---|
| `0x00481040` | 147 B | `?IwdFileLanguage@@YAPBDPBD@Z` | `IwdFileLanguage` | **MATCH** | Static buffer toggler, parses language from `"localized_[lang]"` |
| `0x004810e0` | 244 B | `?iwdsort@@YAHPBX0@Z` | `iwdsort` | **MATCH** | Address-taken `qsort` comparator (`link.address_taken` = true); calls `IwdFileLanguage` |
| `0x004811e0` | 47 B | `?FS_AddSearchPath@@YAXPAUsearchpath_t@@@Z` | `FS_AddSearchPath` | **MATCH** | Search path linked list insertion; priority for unlocalized paths |

#### Current Status Post-Batch 3:
- **Total Matched Rows**: **386 / 386** (0 failures).
- **Game functions matched**: 386 / 3579 (10.79%) (**+3 net new functions**).
- **Game code bytes matched**: 49,283 / 699,591 bytes (7.04%) (**+438 B net new game bytes**).
- **Rebuilt EXE same-offset byte goal**: **25,546 bytes (1.424%, +255 bytes gained)**.
- **Unverified functions in `src/`**: 50 (unchanged, 0 growth).

#### Batch 4: Read Graph & Filename Sanitizer Cluster Analysis (Commit HEAD `754c328`)
- **Status in linked executable**:
  - `FS_IsBackupSubStr` (`0x0047e9a0`, 27 B): **MATCH 100%** at `0x00403a20`
  - `FS_IsPathSepChar` (`0x0047e9c0`, 17 B): **MATCH 100%** at `0x00403a40` via two-case switch (`switch (c) { case '/': case '\\': return 1; default: return 0; }`), matching exact retail bytes `3c 2f 74 07 3c 5c 74 03 33 c0 c3 b8 01 00 00 00 c3`
  - `FS_SanitizeFilename` (`0x0047e9e0`, 643 B): **MATCH 100%** at `0x00403a60` with locked assert lines 1268, 1269, 1270, 1284, 1297
  - `FS_FilesAreLoadedGlobally` (`0x0047ec70`, 161 B): **MATCH 100%** at `0x00403cf0`
  - `FS_Shutdown` (`0x00481990`, 68 B): **MATCH 100%** at `0x00404450`
- **Caller / Callee Findings & Blockers**:
  - `FS_FOpenFileRead_Internal` (`0x0047ed20`, 1396 B): Fully mapped all 412 instructions. Reached 1378 B vs 1396 B (within 18 bytes).
  - External caller blocker: Retail binary has a call to `FS_FOpenFileRead_Internal` from `TexWnd.cpp` (`0x440d01`), preserving the standard 4-argument stack calling convention. Without `TexWnd.cpp` in the build, LTCG optimizes `filename` into register `edx`, shifting stack arguments by 4 bytes.
  - `FS_ReadFile` (`0x0047fa40`, 181 B): Discovered that retail reuses the incoming `qpath` slot (`&qpath`) instead of allocating a separate `h` local, dropping built size from 223 B to 184 B (within 3 bytes of 181 B).
  - `unverified_in_src`: Maintained strictly at **50** (no unverified growth; clean gate).

