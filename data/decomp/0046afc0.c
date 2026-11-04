
void FUN_0046afc0(void)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 *local_8;
  
  iVar1 = 0;
  if (0 < DAT_012334f0) {
    local_8 = &DAT_010a02f0;
    do {
      FUN_0046aee0(*local_8,&DAT_010a43d0);
      iVar1 = iVar1 + 1;
      local_8 = local_8 + 0x114;
    } while (iVar1 < DAT_012334f0);
  }
  FUN_0046aee0(DAT_010a43d4,&DAT_010a43d0);
  if (0 < DAT_012334f0) {
    puVar2 = &DAT_010a02f0;
    local_8 = (undefined4 *)DAT_012334f0;
    do {
      FUN_0046ae70(*puVar2,&DAT_010a43d0);
      puVar2 = puVar2 + 0x114;
      local_8 = (undefined4 *)((int)local_8 + -1);
    } while (local_8 != (undefined4 *)0x0);
  }
  FUN_0046ae70(DAT_010a43d4,&DAT_010a43d0);
  return;
}

