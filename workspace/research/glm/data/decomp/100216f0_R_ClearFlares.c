// 100216f0 size=119 R_ClearFlares

void R_ClearFlares(undefined4 *param_1)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  undefined2 *puVar4;
  
  iVar3 = DAT_1042e778;
  iVar2 = *(int *)(DAT_1042e778 + 0x30000);
  if (0x30000 - iVar2 < 0x14) {
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
    puVar4 = (undefined2 *)0x0;
  }
  else {
    puVar4 = (undefined2 *)(iVar2 + DAT_1042e778);
    *(int *)(DAT_1042e778 + 0x30000) = iVar2 + 0x14;
    piVar1 = (int *)(iVar3 + 0x30004);
    *piVar1 = *piVar1 + 0x14;
    *(undefined2 **)(iVar3 + 0x30008) = puVar4;
    *puVar4 = 4;
    puVar4[1] = 0x14;
  }
  if (param_1 != (undefined4 *)0x0) {
    *(undefined4 *)(puVar4 + 2) = *param_1;
    *(undefined4 *)(puVar4 + 4) = param_1[1];
    *(undefined4 *)(puVar4 + 6) = param_1[2];
    *(undefined4 *)(puVar4 + 8) = param_1[3];
    return;
  }
  *(undefined4 *)(puVar4 + 2) = 0;
  *(undefined4 *)(puVar4 + 4) = 0;
  *(undefined4 *)(puVar4 + 6) = 0;
  *(undefined4 *)(puVar4 + 8) = 0;
  return;
}


