
void FUN_00435840(void)

{
  undefined4 *puVar1;
  int iVar2;
  undefined4 uVar3;
  
  for (puVar1 = DAT_010a44e0; (puVar1 != (undefined4 *)0x0 && (puVar1 != &DAT_010a44dc));
      puVar1 = (undefined4 *)puVar1[1]) {
    if ((int *)puVar1[8] != (int *)0x0) {
      if ((*(int *)puVar1[8] != *(int *)(puVar1[5] + 0x44)) && (DAT_0124a14a == '\0')) {
        iVar2 = FUN_0047d980("b->patch->def == b->def->patch",".\\Pmesh.cpp",0x188a,0,1);
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_0124a14a = '\x01';
        }
      }
      iVar2 = *(int *)puVar1[8];
      if (*(void **)(iVar2 + 0x3824) != (void *)0x0) {
        _free(*(void **)(iVar2 + 0x3824));
      }
      uVar3 = FUN_004267d0(DAT_01128d94,0,0);
      *(short *)(iVar2 + 0x382c) = *(short *)(iVar2 + 0x382c) + 1;
      *(undefined4 *)(iVar2 + 0x3824) = uVar3;
    }
  }
  return;
}

