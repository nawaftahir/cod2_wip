# File map work (step 1)

Goal: every retail function in `.text` gets its original source file, with written evidence, BEFORE
any more code is matched. Code written into the wrong file, or in the wrong order, has to be moved later
and loses its assert line numbers. That mistake is not repeated here.

## Facts to rely on (RULES.md has the proofs)
- Each game file is its own object, built /GL and linked /LTCG (RULES.md, "REFUTED: one compile unit").
  Inside a file, code order = definition order, so each file is ONE contiguous address range, and files
  follow the link order. LTCG inlines across files, so an assert path from another file is not a boundary.
- Link order seen so far: editor files sorted ignoring case (AdvCurveDlg?, cameratargetdlg?, CamWnd,
  cmdlib, CommandsDlg, DialogInfo, DialogThick, DlgCamera, DlgEvent, draw, ... GfxWrapper, MainFrm, ...
  XYWnd), then the Q3 core files sorted (brush ... z), then src/universal sorted, splines, xanim, script.
  Treat this as a strong prior; report anything that breaks it.
- Asserts push `__FILE__`. A function that pushes a `.cpp` path is PINNED to that file, EXCEPT when a
  static from another file was inlined into it: then it carries the other file's path too (AMBIGUOUS /
  OUTLIER rows). Header paths (`...\splines\util_list.h`, `../src/universal/...h`) are header inlines.
- Header code is emitted inside the unit too: MFC/ATL inlines and templates (CString members, CArray),
  scalar deleting destructors of MFC controls (CEdit, CButton ...), game header inlines (idList<T>,
  q_shared.h helpers). These are AUTO, not part of any .cpp. Their position does NOT mark a file
  boundary (they are not emitted at first use). `data/auto_funcs.tsv` lists the ones already proven.
- A class's methods live in its own file (CCamWnd -> CamWnd.cpp, CDlgCamera -> dlgcamera.cpp). RTTI
  vtables and MFC message maps give the class of 1,861 functions (`classes.tsv`).
- MFC/CRT library code is LIB (`data/lib_funcs.tsv`); never assign it.

## Tools (run from `radiant/`)
- `python3 workspace/research/filemap/view.py LO HI` one line per function: addr, size, current file/evidence,
  class, strings it references, callers' files (`<`), callees' files (`>`). `?Name` = class of an
  unmapped function, `?4012f0` = unmapped, no class. Fast (cached).
- `make show A=0x...` full disassembly with strings and call targets resolved (Docker, ~5 s).
- `python3 workspace/research/filemap/ev.py LO HI` strings only.
- `workspace/research/filemap/classes.tsv` class per function (vtable owner = most-base class holding it; message
  map handlers = that class).
- `python3 workspace/research/filemap/hdrmatch.py OBJ...` names header code by compiling a probe with the game flags
  (`workspace/research/filemap/probe/*.cpp`; compile: `docker run --rm -v $PWD:/w -w /w/research/filemap/probe
  cod2-radiant-msvc71 sh -c 'wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 /Oy- /Op X.cpp'`).
- References (read-only): `../refrences/Quake-III-Arena/q3radiant/` (Q3Radiant, the ancestor: which
  functions live in which file), `../refrences/iw3xo-radiant/` (CoD4 radiant), `../cod2engine/archive/
  lnxded-1.0/src/` (the verified CoD2 server source: SAME src/universal, xanim, script files, real
  function order), `../refrences/CoD2rev_Server/src/`, `data/decomp/` (Ghidra decompile).

## Output (agents write ONLY here)
`workspace/research/filemap/proposals/<region>.tsv`, same format as `data/file_map.tsv`:
```
start	end	tu	tag	evidence
0x00401000	0x004024f0	radiant/AdvCurveDlg.cpp	SUPPORTED	CAdvCurveEditDlg vtable+message map 0x401310..0x402420; reg key Radiant::AdvCurveDlgPlace
```
- `start` = first function of the file, `end` = end of its last function (exclusive). Ranges cover the
  region with no overlap. Header code between two files goes into the earlier file's range.
- `tu` path style: `radiant/<Name>.cpp` for editor files (spell the name as the original most likely was:
  Q3Radiant spelling, class name, registry key; say which), `universal/...`, `xanim/...`, `script/...`,
  `libs/...`, `common/...` as in `link/order.txt`. Unknown name: `radiant/UNKNOWN_<firstaddr>.cpp`.
- `tag`: PINNED (an assert in the range names the file), SUPPORTED (class/vtable/message map, a
  reference file with the same functions in the same order, or a string that names the file),
  HYPOTHESIS (inferred only from position/neighbours). Never upgrade a guess.
- `evidence`: short and checkable (addresses, strings, class names, reference file + function).
- Also `workspace/research/filemap/proposals/<region>.md`: the boundary calls you were unsure about, header
  functions you found (addr + what it is), anything that breaks the facts above.

## Never
- Never edit `data/`, `tools/`, `link/`, `src/`, `ledger/` or files outside `workspace/research/filemap/`.
- Never invent a file name without evidence; use UNKNOWN_ and say why.
- No code matching in this step.
