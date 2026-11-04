// 100221d0 size=79 FUN_100221d0

void FUN_100221d0(void)

{
  undefined2 *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = DAT_1042e778;
  iVar2 = *(int *)(DAT_1042e778 + 0x30000);
  if ((0x2e000 - iVar2) + *(int *)(DAT_1042e778 + 0x30004) < 4) {
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
    return;
  }
  puVar1 = (undefined2 *)(iVar2 + DAT_1042e778);
  *(int *)(DAT_1042e778 + 0x30000) = iVar2 + 4;
  *(undefined2 **)(iVar3 + 0x30008) = puVar1;
  *puVar1 = 0x1c;
  puVar1[1] = 4;
  return;
}


