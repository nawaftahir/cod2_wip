// 100b9e11 size=117 FUN_100b9e11

undefined4 FUN_100b9e11(int *param_1)

{
  int iVar1;
  uint uVar2;
  int iVar3;
  uint uVar4;
  int in_ECX;
  int *piVar5;
  
  uVar4 = *param_1 + 1;
  piVar5 = (int *)(*(int *)(in_ECX + 0x14) + uVar4 * 4);
  iVar1 = *piVar5;
  if (uVar4 < *(uint *)(in_ECX + 8)) {
    while( true ) {
      uVar2 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(*piVar5 + 4) * 4) + 4);
      if ((((uVar2 & 0x10) == 0) || ((uVar2 & 0x200) != 0)) && ((uVar2 & 0x20) == 0)) break;
      iVar3 = *(int *)(*piVar5 + 0x68);
      if ((*(int *)(*(int *)(iVar1 + 0x68) + 0x24) != *(int *)(iVar3 + 0x24)) ||
         (*(int *)(*(int *)(iVar1 + 0x68) + 0x20) != *(int *)(iVar3 + 0x20))) break;
      uVar4 = uVar4 + 1;
      piVar5 = piVar5 + 1;
      if (*(uint *)(in_ECX + 8) <= uVar4) break;
    }
  }
  *param_1 = uVar4 - 1;
  return 0;
}


