# Pmesh.cpp Batch-2 Notes and Deferred Drafts

## Matched & Added in Batch 2
- `0x0042b760` (`45` B, `SUPPORTED`, `address_taken` callback, `?FUN_0042b760@@YAMHHMHM@Z`): verified MATCH via `make try` (`task-573` and `task-594`).

## Attempted & Deferred (kept out of `workspace/src/radiant/Pmesh.cpp` and `ledger/matches.tsv`)

### 1. `0x00429bc0` (553 B, PINNED, assert lines 1746/1747/1748/1762)
- Best result: `97%, sizes 553/553, first difference at +0xcf` (3 tries used).
- Mismatch detail at `+0xcf`: retail emits `*px = -1; *py = -1;` before loading `ecx = DAT_010c4d84; xor eax, eax; test ecx, ecx; mov [ebp-1], al`, whereas MSVC 7.1 scheduled `mov ecx, [DAT_010c4d84]; xor eax, eax; test ecx, ecx` before `*px = -1; *py = -1;`.
- Draft:
```cpp
bool FUN_00429bc0(patchMesh_t *patch, int *px, int *py)
{
#line 1746
    assert( patch );
#line 1747
    assert( px );
#line 1748
    assert( py );
    *px = -1;
    *py = -1;
    bool found = false;
    for (int i = 0; i < DAT_010c4d84; i++)
    {
        PatchControl *pdv = (PatchControl *)DAT_010c4d88[i];
        if (pdv < &patch->ctrl[0][0] || pdv > &patch->ctrl[15][15])
            continue;
        int index = pdv - &patch->ctrl[0][0];
        int x = index / 16;
        int y = index - x * 16;
#line 1762
        assert( pdv == &patch->ctrl[x][y] );
        if (!found)
        {
            *px = x;
            *py = y;
            found = true;
        }
        else
        {
            if (*px != x)
                *px = -1;
            if (*py != y)
                *py = -1;
        }
    }
    if (!found)
        return false;
    if (*px >= 0 && *py >= 0)
        return false;
    if (*px < 0 && *py < 0)
    {
        FUN_0047a5b0("selected vertices must be on the same column or row\n");
        return false;
    }
    return true;
}
```

### 2. `0x00429f40` (`RemovePointFromMoveList` by value, ~192 B, PINNED)
- Result (`task-547`): LTCG-blocked in isolation because it has no callers in `Pmesh.cpp` yet (`0x0042a440`, `0x0042a4b0`, `0x0042a890`) and is not in `link.address_taken`, so `/GL` compiles its parameter in `eax` instead of `[ebp+8]`.
- Defer until its `Pmesh.cpp` callers are also implemented.

### 3. `0x0042a040` (88 B, SUPPORTED) and `0x0042a0a0` (762 B, PINNED, assert line 1908)
- `0x0042a040` best result: `97%, sizes 88/88, first difference at +0x51` (3 tries used). Retail emits `inc dword ptr [DAT_010c4d84]; ret`, whereas MSVC 7.1 emitted `inc eax; mov [DAT_010c4d84], eax; ret`. Note: `0x0042a040` is LTCG-dependent on its only caller `0x0042a0a0`.
- `0x0042a0a0` best result: `43%, sizes 768/762, first difference at +0x17` (3 tries used). Likely depends on matching the exact `0x0042a040` custom LTCG calling convention (`ecx = p`, `esi = pt` or inlining behavior) and `Vec3CompareEps` (`0x556b20` squared-epsilon constant vs exact form).

### 4. `0x0042b6e0` (114 B, SUPPORTED) and `0x0042b790` (114 B, SUPPORTED)
- Both are `address_taken` callbacks in `link.py`.
- Note on `tools/verify.py` without `--symbol`: `best()` runs across all symbols in `Pmesh.obj` before the `address_taken` relink, so unreferenced functions with `/GL`-stripped `unused1` can lose `best()` to an unrelated symbol unless `--symbol` is passed (or they are already in `ledger/matches.tsv`, where `link.ledger_includes()` supplies `/INCLUDE:`).
- Tested with `--symbol` (`task-599`): `43%, sizes 105/114, first difference at +0x12`. Needs closer inspection of stack/FPU clamping at `0x42b6f2` (`mov ecx, [ebp+14]` / `[ebp+18]` reload) — deferred.
