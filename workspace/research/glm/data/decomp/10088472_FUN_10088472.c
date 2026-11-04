// 10088472 size=165 FUN_10088472

undefined4 FUN_10088472(uint *param_1,int param_2,int param_3)

{
  uint *puVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  int in_ECX;
  uint uVar5;
  int *piVar6;
  uint local_8;
  
  uVar2 = param_1[1];
  uVar5 = *param_1 & 0xfffff;
  local_8 = 0;
  if (uVar2 / uVar5 != 0) {
    puVar1 = param_1 + 2;
    iVar3 = *(int *)(in_ECX + 0x14);
    param_1 = (uint *)(*puVar1 + param_3 * 4);
    piVar6 = (int *)(*puVar1 + param_2 * 4);
    do {
      if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                               *(int *)(*(int *)(iVar3 + *piVar6 * 4) + 4) * 4) + 4) & 0x40) != 0)
          && ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                 *(int *)(*(int *)(iVar3 + *param_1 * 4) + 4) * 4) + 4) & 0x40) != 0
             )) && (iVar4 = FUN_100883d0(*piVar6,*param_1), iVar4 == 0)) {
        return 1;
      }
      local_8 = local_8 + 1;
      param_1 = param_1 + uVar5;
      piVar6 = piVar6 + uVar5;
    } while (local_8 < uVar2 / uVar5);
  }
  return 0;
}


