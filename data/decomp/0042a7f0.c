
undefined4 FUN_0042a7f0(undefined4 param_1,undefined4 param_2)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 *puVar4;
  
  if ((DAT_011298b0 != 1) && (DAT_011298b0 != 4)) {
    return 0;
  }
  uVar2 = 0;
  puVar4 = DAT_010a44b8;
  if (DAT_010a44b8 != &DAT_010a44b4) {
    do {
      if ((int *)puVar4[8] != (int *)0x0) {
        if ((*(int *)puVar4[8] != *(int *)(puVar4[5] + 0x44)) && (DAT_0124a18c == '\0')) {
          iVar3 = FUN_0047d980("b->patch->def == b->def->patch",".\\Pmesh.cpp",0x7f9,0,1);
          if (iVar3 == 0) {
            DebugBreak();
          }
          else if (iVar3 == 2) {
            DAT_0124a18c = '\x01';
          }
        }
        FUN_0042a4b0(param_1,param_2);
        uVar2 = 1;
      }
      puVar1 = puVar4 + 1;
      puVar4 = (undefined4 *)*puVar1;
    } while ((undefined4 *)*puVar1 != &DAT_010a44b4);
  }
  return uVar2;
}

