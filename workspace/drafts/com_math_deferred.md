# src/universal/com_math.cpp deferred functions

Status: 119 of 155 `tu_map.tsv` rows matched in `ledger/matches.tsv`.

## 1. Banned `__asm` helpers (`I_fround` / `FastSinCos`)

- `0x004897c0` `SinCosDegrees` (306 B, PINNED — attempt 1/3, 46%, 280/306 B):
  - Retail (`+0x11b..+0x12d`) inlines `FastSinCos` (`__asm { push eax; push ecx; fld value; fsincos; ... }` per `client-1.0/build/tree/universal/com_math.h:389-404`).
  - `workspace/src/universal/com_math.h:334-338` uses C `sin`/`cos` because `__asm` is banned by `tools/verify.py`, emitting `call 0x40f070` (`280` B) instead of `fsincos`.
  - Keeping `SinCosDegrees` in `com_math.cpp` without matching `FastSinCos` also causes `/LTCG` to change calling convention on `BuildTextureVecs` (`0x004401d0` in `workspace/src/common/texturevecs.cpp`, dropping `0x004401d0` to 58%, `977/985`), so `SinCosDegrees` is omitted from `com_math.cpp` and saved below.
- `0x00489940` `Snap` / `SnapFloatToGrid` (471 B, PINNED — called by `FUN_0043fbc0` in `workspace/src/common/texturevecs.cpp`):
  - Retail (`0x00489abc..0x00489acb`) inlines `I_fround` (`fld qword [0x556b28]` `9.313225746154785e-10` = `2^-30`; `fadd`; `fistp`), matching `client-1.0/build/tree/universal/com_math.cpp:4211` `I_fround(value * grid)`.
  - `workspace/src/universal/com_math.h:252-255` replaces `__asm` with `(int)floor(x + 0.5f)` and `data/flags.tsv` has no `/QIfist`, so `Snap` cannot match `fistp` under current compiler/verify rules.

## 2. Blocked on `Vec3IsNormalized` (`0x00482600`, header inline emission in `com_files.cpp` boundary)

Per `workspace/drafts/com_files_deferred.md`, `0x00482600` (105 B) is a header math inline emitted at the `com_files.cpp` boundary in retail, not defined as a TU source function yet. Functions in `workspace/drafts/com_math_blocked_vec3isnormalized.cpp` (`PerpendicularVector` `0x00484c00`, `ProjectPointOnPlane` `0x00489410`, plus `0x00488b70`, `0x00489580`) remain blocked on its `/LTCG` `eax` calling convention.

## 3. Stashed draft: `SinCosDegrees` (`0x004897c0`)

```cpp
void SinCosDegrees( float angle, float *s, float *c )
{
#line 3953
	assert(s);
#line 3954
	assert(c);

	if ( angle < 0.0f )
		angle += 360.0f;

	if ( angle == 0.0f )
	{
		*c = 1.0f;
		*s = 0.0f;
		return;
	}
	if ( angle == 90.0f )
	{
		*c = 0.0f;
		*s = 1.0f;
		return;
	}
	if ( angle == 180.0f )
	{
		*c = -1.0f;
		*s = 0.0f;
		return;
	}
	if ( angle == 270.0f )
	{
		*c = 0.0f;
		*s = -1.0f;
		return;
	}

	FastSinCos(angle * 0.01745329238474369f, s, c);
}
```
