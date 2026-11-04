// 10020d50 size=111 FUN_10020d50

void FUN_10020d50(void)

{
  int *piVar1;
  undefined2 *puVar2;
  int iVar3;
  int iVar4;
  
  iVar4 = DAT_1042e778;
  iVar3 = *(int *)(DAT_1042e778 + 0x30000);
  if (0x30000 - iVar3 < 4) {
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
  }
  else {
    puVar2 = (undefined2 *)(iVar3 + DAT_1042e778);
    *(int *)(DAT_1042e778 + 0x30000) = iVar3 + 4;
    piVar1 = (int *)(iVar4 + 0x30004);
    *piVar1 = *piVar1 + 4;
    *(undefined2 **)(iVar4 + 0x30008) = puVar2;
    *puVar2 = 0;
    puVar2[1] = 4;
  }
  iVar3 = DAT_101da9c8;
  *(undefined4 *)(DAT_101da9c8 + 0x249d0c) = 0;
  *(undefined4 *)(iVar3 + 0x249d10) = 0;
  *(undefined4 *)(iVar3 + 0x249d14) = 0;
  FUN_10033d20(iVar3);
  FUN_10033b20();
  FUN_10021040();
  return;
}


