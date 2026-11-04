// 1008a70d size=225 FUN_1008a70d

undefined4 FUN_1008a70d(undefined4 *param_1,uint param_2,uint param_3,int param_4)

{
  int *piVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  uint uVar5;
  int in_ECX;
  undefined4 *puVar6;
  undefined4 local_24 [4];
  uint local_14;
  uint local_10;
  uint local_8;
  
  iVar4 = param_2;
  if (param_4 != 0) {
    uVar5 = 0;
    if (param_3 != 0) {
      do {
        *(uint *)(param_2 + uVar5 * 4) = uVar5;
        uVar5 = uVar5 + 1;
      } while (uVar5 < param_3);
    }
    local_14 = 0;
    if (param_3 != 0) {
      do {
        piVar1 = (int *)(iVar4 + local_14 * 4);
        iVar3 = *piVar1;
        param_2 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + param_1[iVar3] * 4) + 0x10);
        local_8 = local_14;
        local_14 = local_14 + 1;
        for (uVar5 = local_14; uVar5 < param_3; uVar5 = uVar5 + 1) {
          local_10 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                       param_1[*(int *)(iVar4 + uVar5 * 4)] * 4) + 0x10);
          if ((local_10 < param_2) || ((local_10 == param_2 && (uVar5 < local_8)))) {
            local_8 = uVar5;
            param_2 = local_10;
          }
        }
        piVar2 = (int *)(iVar4 + local_8 * 4);
        *piVar1 = *piVar2;
        *piVar2 = iVar3;
      } while (local_14 < param_3);
    }
  }
  uVar5 = 0;
  if (param_3 != 0) {
    do {
      local_24[uVar5] = param_1[*(int *)(iVar4 + uVar5 * 4)];
      uVar5 = uVar5 + 1;
    } while (uVar5 < param_3);
    if (param_3 != 0) {
      puVar6 = local_24;
      for (; param_3 != 0; param_3 = param_3 - 1) {
        *param_1 = *puVar6;
        puVar6 = puVar6 + 1;
        param_1 = param_1 + 1;
      }
    }
  }
  return 0;
}


