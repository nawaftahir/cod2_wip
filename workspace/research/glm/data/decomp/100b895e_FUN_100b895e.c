// 100b895e size=103 FUN_100b895e

undefined4 FUN_100b895e(int param_1,int param_2)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int in_ECX;
  
  iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4);
  if ((((*(int *)(iVar3 + 8) == -1) ||
       (iVar2 = FUN_100b895e(*(int *)(iVar3 + 8),param_2), -1 < iVar2)) &&
      (iVar2 = FUN_100b866d(iVar3), -1 < iVar2)) &&
     (iVar3 = FUN_100c7b3a(*(int *)(iVar3 + 0x10) + *(int *)(iVar3 + 0xc) * 4), -1 < iVar3)) {
    piVar1 = (int *)(*(int *)(in_ECX + 0x10c) + param_2 * 4);
    *piVar1 = *piVar1 + 1;
    return 0;
  }
  return 0x8007000e;
}


