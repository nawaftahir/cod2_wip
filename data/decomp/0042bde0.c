
undefined4 FUN_0042bde0(int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = DAT_0109fdcc;
  for (iVar1 = *(int *)(param_1 + 4); iVar1 != param_1; iVar1 = *(int *)(iVar1 + 4)) {
    if (*(int **)(iVar1 + 0x20) != (int *)0x0) {
      if ((**(int **)(iVar1 + 0x20) != *(int *)(*(int *)(iVar1 + 0x14) + 0x44)) &&
         (DAT_0124a182 == '\0')) {
        iVar2 = FUN_0047d980("b->patch->def == b->def->patch",".\\Pmesh.cpp",0xa6c,0,1);
        if (iVar2 == 0) {
          DebugBreak();
          iVar3 = DAT_0109fdcc;
        }
        else {
          iVar3 = DAT_0109fdcc;
          if (iVar2 == 2) {
            DAT_0124a182 = '\x01';
          }
        }
      }
      if (*(char *)(**(int **)(iVar1 + 0x20) + 0x382e) != '\0') {
        *(undefined1 *)(*(int *)(*(int *)(iVar1 + 0x14) + 0x44) + 0x382e) = 0;
        iVar2 = *(int *)(iVar1 + 0x14);
        if ((iVar3 != 0) && (*(int *)(iVar3 + 0xc) == 0)) {
          *(undefined4 *)(iVar2 + 0x10) = *(undefined4 *)(iVar3 + 8);
          iVar2 = *(int *)(iVar2 + 8);
          if (*(int *)(*(int *)(iVar2 + 0x50) + 8) != 0) {
            *(undefined4 *)(iVar2 + 0x6c) = *(undefined4 *)(iVar3 + 8);
          }
        }
      }
    }
  }
  return 1;
}

