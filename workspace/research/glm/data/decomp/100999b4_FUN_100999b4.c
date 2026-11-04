// 100999b4 size=141 FUN_100999b4

undefined4 FUN_100999b4(int param_1,int param_2)

{
  int in_ECX;
  int iVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  
  if ((*(uint *)(param_1 + 0x10) & *(uint *)(param_2 + 0x10)) != 0) {
    FUN_100994dd();
  }
  if ((*(int *)(param_1 + 0x14) != 0) && (*(int *)(param_2 + 0x14) != 0)) {
    puVar2 = (undefined4 *)(*(int *)(param_2 + 0x14) + 0x10);
    puVar3 = (undefined4 *)(in_ECX + 0x20);
    for (iVar1 = 8; iVar1 != 0; iVar1 = iVar1 + -1) {
      *puVar3 = *puVar2;
      puVar2 = puVar2 + 1;
      puVar3 = puVar3 + 1;
    }
    FUN_100993ad(in_ECX,"syntax error");
  }
  *(uint *)(param_1 + 0x10) = *(uint *)(param_1 + 0x10) | *(uint *)(param_2 + 0x10);
  if ((*(int *)(param_1 + 0x14) == 0) && (*(int *)(param_2 + 0x14) != 0)) {
    iVar1 = FUN_10082816(*(int *)(param_2 + 0x14));
    *(int *)(param_1 + 0x14) = iVar1;
    if (iVar1 == 0) {
      return 0x8007000e;
    }
  }
  return 0;
}


