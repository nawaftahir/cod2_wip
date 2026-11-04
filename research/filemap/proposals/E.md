# Region E (0x47c650-0x4ad790): src/universal, splines, xanim, script, zlib start

27 rows, 987 carved functions (17 missing from the Ghidra inventory, all inside the ranges).
By row tag: PINNED 890, SUPPORTED 78, HYPOTHESIS 19. Region D owns 0x47c4e0-0x47c650 (assertive.cpp head).

## Link order found
assertive, com_files, com_math, com_memory, com_shared, dvar, g_vehicle_path, linearmapping,
UNKNOWN noise, q_parse, q_shared, win_common, UNKNOWN stubs, splines/math_angles, math_matrix,
math_quaternion, math_vector, splines, util_str, xanim/dobj, script/scr_memorytree, scr_stringlist,
xanim/xmodel, xmodel_load_obj, xmodel_utils, zlib/adler32, compress, deflate.
New vs link/order.txt: win_common.cpp, the four splines/math_*.cpp, adler32.c, compress.c, deflate.c
head, and two unnamed files. Note xanim and script are interleaved (dobj, script x2, xmodel x3), so the
include order is not "xanim then script".

## Things that break the README / RULES facts
- **zlib starts at 0x4acfc0, not 0x4ad790.** adler32.c 0x4acfc0, compress.c 0x4ad0f0 (compress2,
  compress), deflate.c from 0x4ad1a0 (deflateInit_). compress.c is not in src/zlib; it has to be added.
- **xmodel.cpp is not at 0x4a6f70** (link/order.txt). 0x4a6f70 is DObjHasContents in dobj.cpp: it
  carries an xmodel.cpp assert only through inlined XModelGetContents (OUTLIER). Server dobj.cpp ends
  with exactly DObjHasContents, DObjSetLocalTagInternal, DObjSetControlTagAngles, DObjSetLocalTag,
  DObjSetLocalBoneIndex, DObjInitFromModel (0x4a6f70..0x4a7210). xmodel.cpp is contiguous from 0x4aa670.
- **xmodel_utils.cpp starts at 0x4acb50**, not 0x4acb70: XModelGetName 0x4acb50 and XModelGetFlags
  0x4acb60 are its first two functions in the server source.
- **One header, two __FILE__ spellings.** xanim_public.h appears as
  "src\universal\../xanim/xanim_public.h" (0x4826e0, after com_files) and "src\xanim\xanim_public.h"
  (0x4a1170, after util_str); splines.h as "radiant\../src/universal/splines/" (0x499fb0) and
  "src\universal\splines\" (0x4999c0). An include-guarded single unit emits one spelling per header,
  so either the guard is missing, or these files are separate compile units (each .cpp includes the
  header by its own relative path). Worth checking against the "one compile unit" fact.
- **0x489b20 is Z_FreeInternal, not LIB.** data/lib_funcs.tsv calls it CWnd::XAccessible::Invoke (a
  bare `jmp free`, identical bytes). The GfxWrapper refimport table at 0x4105f0 puts it in the
  Z_FreeInternal slot.

## Unsure boundary calls
- 0x494480-0x4947d0 value noise (HYPOTHESIS): no path string. Alphabetically between linearmapping
  and q_parse; KisakCOD has similar noise in pmesh.cpp but here it sits in src/universal. Named UNKNOWN.
- 0x4985d0-0x498750 engine stubs (HYPOTHESIS): empty fns plus FS_Read/FS_Seek wrappers and
  Sys_IsMainThread/Sys_SetValue/Sys_GetValue-like fns (CoD2 win_threads names), some in the refimport
  table. Probably a radiant-side stub file; no name evidence.
- assertive.cpp tail 0x47d4b0-0x47da80 has no assert; kept in assertive by KisakCOD/cod2map order and
  the shared cwd buffer 0x1141f78. 0x47da40/0x47da50/0x47da60 are unreferenced.
- com_files/com_math split at 0x482980: header code 0x482440-0x48297f goes to com_files (README rule).
- deflateParams 0x4ad510 has deflate() inlined (calls putShortMSB/flush_pending, config func ptr);
  it is not deflate. Real deflate is 0x4ad830 (region F agrees).

## Header code found (addr: what)
- 0x482440/60/80/a0 float CRT wrappers (call 0x4db9f4/0x4db934); 0x4824c0 I_fsel, 0x4824f0 I_fmax,
  0x482520 clamp, 0x482580 SinCos (fsincos), 0x4825a0 Vec2Length, 0x482600 Vec3IsNormalized,
  0x482670 VectorScale, 0x4826a0 Vec4LengthSq, 0x4826e0 xanim_public.h inline (IS_NAN asserts;
  called by dobj and xmodel_load_obj), 0x482910 quat/trans transform (calls 0x4826e0)
- 0x48b730 I_fmin, 0x48b760 Vector2Compare, 0x48b790 Vector4Copy, 0x48b7b0 Byte4Compare-like
- 0x495b40 float return stub (fld arg; ret)
- 0x4986c0 idVec3 3-float ctor, 0x4986e0 empty, 0x4986f0 math_matrix.h operator[] assert
- 0x498bb0 idVec3 dot, 0x498bd0 vec*scalar, 0x498c10 vec+vec, 0x498c60 mat3 ctor
- 0x499210 idQuat operator[] (math_quaternion.h)
- 0x4997b0 idStr(const char*), 0x499870/0x499890/0x499930/0x499980/0x499a40 idVec3 ops (compare eps,
  Normalize, snap, set), 0x4999c0 splines.h getPosition, 0x499a70 getVelocity, 0x499af0 addVelocity,
  0x499b90 idCameraFOV::getFOV, 0x499c60/0x499cd0 ctors, 0x499d80 idCameraDef ctor (fov 90),
  0x499e10 dtor, 0x499ec0 newFromType, 0x499fb0 getActiveTarget
- 0x49ef00-0x49f660 idList<T> templates (util_list.h "index >= 0", "size > 0"), 0x49f740-0x49fc60 idStr
  inlines, 0x49fd00/0x49fd20/0x49fd30 operator==/!=
- 0x4a10f0 deleting dtor, 0x4a1140 I_sgn, 0x4a1170 xanim_public.h mat->quat inline, 0x4a1440
  DObjCalcTransWeight-like

## Other names (addr: name, evidence in E.tsv)
assertive: 0x47c9b0/0x47c9f0 ParseError, 0x47ca40 ParseMapFile, 0x47d1b0 GetModuleBase, 0x47d270
LoadMapFilesForDir, 0x47d4b0 LoadMapFiles, 0x47d510 DoStackTrace, 0x47d720 stack-trace wrapper,
0x47d7b0 clipboard copy, 0x47d830 AssertNotify, 0x47d8b0 BuildAssertMessage, 0x47d980 MyAssertHandler.
com_files: 0x47db70 FS_HandleForFile, 0x482100 FS_Restart, 0x4823c0 GetBspExtension.
com_math: 0x482980 randomf, 0x4829a0 crandom, 0x4829d0 GaussianRandom.
linearmapping: 0x493c10 LU_Decompose3x3, 0x494000 LU_Solve3x3, 0x4941f0 SolveLinearMapping.
q_parse: 0x495490 Com_ParseOnLine, 0x4954e0 Com_MatchToken, 0x495590 SkipBracedSection, 0x495660
SkipRestOfLine, 0x4956f0 Com_ParseRestOfLine, 0x495800/0x495880 ParseFloat/ParseInt, 0x4958e0/0x4959d0
Com_Parse1D/2DMatrix.
q_shared: 0x495b80 Com_AssembleFilepath.
splines.cpp: 0x49a0e0 getCameraInfo, 0x49a1a0 startCamera, 0x49a2c0 buildSpline, 0x49a420
totalDistance, 0x49a4f0 initPosition, 0x49a6f0 calcSpline, 0x49a8c0 updateSelection, 0x49a910
setSelectedPoint, 0x49a9c0 getPosition, 0x49ab90 idSplineList::parse, 0x49af80 write, 0x49b220
getCameraInfo, 0x49b7a0 buildCamera, 0x49be90 startCamera, 0x49c580/0x49c5c0 addEvent, 0x49ca00
idCameraEvent::write, 0x49cca0 idInterpolatedPosition::getPosition, 0x49ce70 idCameraFOV::parse,
0x49d260 idCameraPosition::parseToken, 0x49d3e0/0x49d770/0x49dbc0 Fixed/Interpolated/Spline parse,
0x49df20 FOV write, 0x49e230 Position write, 0x49ee90 int pow helper.
scr_memorytree: 0x4a72d0 MT_DumpTree, 0x4a85c0 MT_ForceAllocIndex.
