// 1006d594 size=69 FUN_1006d594

undefined4 FUN_1006d594(int param_1,uint param_2)

{
  uint uVar1;
  int iVar2;
  int in_ECX;
  uint uVar3;
  
  uVar3 = 0;
  if (param_2 != 0) {
    do {
      uVar1 = *(uint *)(param_1 + uVar3 * 4);
      if (uVar1 < *(uint *)(*(int *)(in_ECX + 8) + 8)) {
        iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + uVar1 * 4);
      }
      else {
        iVar2 = 0;
      }
      if ((iVar2 == 0) || (*(int *)(iVar2 + 0x68) == 0)) {
        return 0;
      }
      uVar3 = uVar3 + 1;
    } while (uVar3 < param_2);
  }
  return 1;
}


