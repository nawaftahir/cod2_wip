#!/usr/bin/env python3
"""test_inplace.py VER [--pinned]: self-check of tools/inplace.py on build/release (run from the target root).
Known-good: the anchor against itself has no differing function. Broken: one flipped byte in our build
turns exactly that function unverified. --pinned (1.0 at 364f672b only): the exact 29 differing functions."""
import os, shutil, sys, tempfile
import pefile
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from inplace import functions

EXE, MAP, A = 'build/release/CoD2MP_s.exe', 'build/release/CoD2MP_s.map', os.environ.get('ANCHOR', '../binaries/windows/%s/CoD2MP_s.exe' % sys.argv[1])
DIFFER_364f672b = set('''?HideWindowCallback@@YGHPAUHWND__@@J@Z ?CL_SetCGameTime@@YAXXZ ?IntersectPlanes@@YAHPAPBMQAM@Z
?Com_GetSubtitleStringEdReference@@YAPBDPBD@Z ?Com_ErrorCleanup@@YAXXZ ?SV_DirectConnect@@YAXUnetadr_t@@@Z
?EvalPrimitiveExpression@@YA_NTsval_u@@PAUVariableCompileValue@@@Z ?VM_Notify@@YAXIIPAUVariableValue@@@Z
?XAnimCalc@@YAXPBUDObj_s@@IMPAUDObjAnimMat@@_N2PAUXAnimCalcAnimInfo@@H@Z ?FX_AddFxToScene@@YAXPAVEffect@@H@Z
?FX_CalcOriginAndAxis@@YAXPAUEffectPrimitive@@QAMQBMQAY02M@Z ?DSound_UpdateSample@@YAHPAUdsound_sample_t@@PADI@Z
?CG_DrawCursorhint@@YAXPBUrectDef_s@@PAUFont_s@@MH@Z ?CG_CalcCrosshairPosition@@YAXPAM0@Z
?CG_DrawAdsOverlay@@YAXPBUWeaponDef@@HPBM1@Z ?CG_DrawGrenadePointer@@YAXMMPBM0@Z ?StartWeaponAnim@@YAXHPAUXAnimTree_s@@H@Z
?CalculateWeaponPosition_Sway@@YAXXZ ?CG_FireWeapon@@YAXPAUcentity_s@@HH@Z ?nb_decode@@YAHPAXPAUSpeexBits@@0@Z
?G_GetPlayerViewOrigin@@YAXPAUgentity_s@@PAM@Z ?Pickup_Weapon@@YAHPAUgentity_s@@0PAHH@Z ?G_RunMissile@@YAXPAUgentity_s@@@Z
?fire_grenade@@YAPAUgentity_s@@PAU1@PAM1HH@Z ?player_die@@YAXPAUgentity_s@@00HHHPBMHH@Z
?PlayerCmd_finishPlayerDamage@@YAXUscr_entref_t@@@Z ?Window_Paint@@YAXPAUdisplayContextDef_s@@PAY13CA@MMMMM@Z
?Item_ListBox_MouseEnter@@YAXPAUitemDef_s@@MM@Z ?Menu_SetNextCursorItem@@YAPAUitemDef_s@@PAUdisplayContextDef_s@@PAUmenuDef_t@@@Z'''.split())

def differ(exe, anchor=A):
    return {(rva, names[0]) for rva, _, names, _, same in functions(exe, MAP, anchor) if not same}  # by address: static names repeat

fs = functions(EXE, MAP, A)
got = {(r, n[0]) for r, _, n, _, same in fs if not same}
assert not differ(A, A), 'anchor vs itself must be identical'
if '--pinned' in sys.argv:
    names = {n for _, n in got}
    assert len(got) == 29 and names == DIFFER_364f672b, ('extra', names - DIFFER_364f672b, 'missing', DIFFER_364f672b - names)

# flip one byte inside an identical function: exactly that one must turn unverified
rva, names = next((r, n) for r, s, n, _, same in fs if same and s > 4)
off = pefile.PE(EXE, fast_load=True).get_offset_from_rva(rva + 2)
tmp = os.path.join(tempfile.mkdtemp(), 'flip.exe')
shutil.copy(EXE, tmp)
with open(tmp, 'r+b') as f:
    f.seek(off); b = f.read(1); f.seek(off); f.write(bytes([b[0] ^ 0xff]))
assert differ(tmp) == got | {(rva, names[0])}, 'flipped byte not caught'
print('inplace self-check OK: %d differ, flip in %s caught' % (len(got), names[0]))

# data symbols (.rdata), on the anchor against itself so it works before layout is placed:
# one flipped byte must turn exactly that symbol non-identical
from inplace import symbols
ds = symbols(A, MAP, A, (2,))
assert all(x[5] for x in ds), 'anchor data vs itself must be identical'
_, rva, _, names, _, _ = next(x for x in ds if x[2] > 4)
off = pefile.PE(A, fast_load=True).get_offset_from_rva(rva + 1)
shutil.copyfile(A, tmp)  # anchors are read-only; take bytes, not mode
with open(tmp, 'r+b') as f:
    f.seek(off); b = f.read(1); f.seek(off); f.write(bytes([b[0] ^ 0xff]))
assert {(x[1], x[3][0]) for x in symbols(tmp, MAP, A, (2,)) if not x[5]} == {(rva, names[0])}, 'flipped data byte not caught'
print('data flip in %s caught' % names[0])
