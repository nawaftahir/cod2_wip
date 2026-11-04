// 100222f0 size=93 R_SaveScreen

void R_SaveScreen(int param_1)

{
  undefined2 *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = DAT_1042e778;
  if (0 < param_1) {
    iVar2 = *(int *)(DAT_1042e778 + 0x30000);
    if ((0x2e000 - iVar2) + *(int *)(DAT_1042e778 + 0x30004) < 0xc) {
      *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
      return;
    }
    puVar1 = (undefined2 *)(iVar2 + DAT_1042e778);
    *(int *)(DAT_1042e778 + 0x30000) = iVar2 + 0xc;
    *(undefined2 **)(iVar3 + 0x30008) = puVar1;
    *puVar1 = 0x1d;
    puVar1[1] = 0xc;
    *(int *)(puVar1 + 2) = param_1;
  }
  return;
}


