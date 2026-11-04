// 10021ae0 size=102 FUN_10021ae0

void FUN_10021ae0(undefined4 *param_1,undefined4 param_2)

{
  int *piVar1;
  int iVar2;
  undefined4 *puVar3;
  int iVar4;
  undefined4 *puVar5;
  
  iVar2 = DAT_1042e778;
  iVar4 = *(int *)(DAT_1042e778 + 0x30000);
  if (0x30000 - iVar4 < 0x48) {
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
    puVar3 = (undefined4 *)0x0;
  }
  else {
    puVar3 = (undefined4 *)(iVar4 + DAT_1042e778);
    *(int *)(DAT_1042e778 + 0x30000) = iVar4 + 0x48;
    piVar1 = (int *)(iVar2 + 0x30004);
    *piVar1 = *piVar1 + 0x48;
    *(undefined4 **)(iVar2 + 0x30008) = puVar3;
    *(undefined2 *)puVar3 = 9;
    *(undefined2 *)((int)puVar3 + 2) = 0x48;
  }
  puVar5 = puVar3;
  for (iVar4 = 0x10; puVar5 = puVar5 + 1, iVar4 != 0; iVar4 = iVar4 + -1) {
    *puVar5 = *param_1;
    param_1 = param_1 + 1;
  }
  puVar3[0x11] = param_2;
  return;
}


