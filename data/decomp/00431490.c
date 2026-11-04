
void FUN_00431490(int param_1)

{
  undefined4 *puVar1;
  int iVar2;
  int unaff_EBX;
  undefined4 *puVar3;
  
  puVar3 = DAT_010a44b8;
  if (DAT_010a44b8 != &DAT_010a44b4) {
    do {
      if ((int *)puVar3[8] != (int *)0x0) {
        if ((*(int *)puVar3[8] != *(int *)(puVar3[5] + 0x44)) && (DAT_0124a15f == '\0')) {
          iVar2 = FUN_0047d980("b->patch->def == b->def->patch",".\\Pmesh.cpp",0x1221,0,1);
          if (iVar2 == 0) {
            DebugBreak();
          }
          else if (iVar2 == 2) {
            DAT_0124a15f = '\x01';
          }
        }
        if ((*(byte *)(*(int *)puVar3[8] + 0x10) & 0x40) == 0) {
          FUN_00430370(*(int *)puVar3[8]);
          if (unaff_EBX != 0) {
            FUN_00430e20();
          }
          if (param_1 != 0) {
            FUN_00430c40(param_1);
          }
        }
        else {
          FUN_0047a5b0(
                      "********* Patch_AdjustSelectedRowCols not implemented for terrain brushes, since it looked like dead code\n"
                      );
        }
      }
      puVar1 = puVar3 + 1;
      puVar3 = (undefined4 *)*puVar1;
    } while ((undefined4 *)*puVar1 != &DAT_010a44b4);
  }
  if (DAT_01234694 == 0) {
    return;
  }
  FUN_00424b10();
  return;
}

