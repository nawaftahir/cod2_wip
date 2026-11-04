# scr_stringlist + scr_memorytree import (2026-11-04, claude)

- Both files from the server source (lnxded-1.3) compile together with `script_public.full.h`
  (MSVC form of the server header: memory tree, string list, hash table; GCC aligned -> __declspec(align)).
- With both full server files compiled: 21 functions match (`match_both_full.log`): 4 memory tree, 17 string list.
- After blanking unmatched bodies only 13 still match (`match_after_blanking.log`): the rest inline the
  blanked SL_GetStringOfLen / SL_FindStringOfLen / MT_GetSize.
- Landing them breaks the existing row 0x4acb70 XModelGetSurfaceName (92%): it calls SL_GetString, whose
  convention changes once scr_stringlist is a /GL object. So these files must land together with
  xmodel_utils' callers re-checked, or after the remaining SL_* and MT_* bodies match.
- The 17 MT_* functions differ at +0x0: retail gives them register arguments (LTCG, callers in scr_stringlist).
- Removing the server asserts changed nothing (retail has none in these functions, but that was not the cause).
