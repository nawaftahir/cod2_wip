// 100acb59 size=377 FUN_100acb59

undefined4
FUN_100acb59(int param_1,uint param_2,uint param_3,int *param_4,int param_5,uint *param_6,
            undefined4 *param_7,undefined4 *param_8)

{
  uint uVar1;
  uint *puVar2;
  uint uVar3;
  uint uVar4;
  int iVar5;
  uint uVar6;
  int in_ECX;
  uint uVar7;
  int local_24;
  uint local_20;
  uint local_14;
  uint local_10;
  int *local_c;
  int local_8;
  
  *param_7 = 0;
  *param_8 = 0;
  local_10 = 0;
  for (uVar6 = param_2; uVar6 < param_3; uVar6 = uVar6 + 1) {
    puVar2 = *(uint **)(param_1 + uVar6 * 4);
    if ((puVar2 != (uint *)0x0) && (*puVar2 != 0)) {
      uVar4 = *puVar2 & 0xfffff;
      uVar3 = puVar2[1];
      local_14 = 0;
      if (param_5 != 0) {
        local_c = param_4;
        local_24 = param_5;
        do {
          if (uVar3 / uVar4 != 0) {
            local_8 = 0;
            local_20 = uVar3 / uVar4;
            do {
              param_2 = 0;
              iVar5 = local_8;
              for (uVar1 = uVar4; uVar1 != 0; uVar1 = uVar1 - 1) {
                if ((*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar5 + puVar2[2]) * 4) +
                             0x38) == *local_c) || (*(int *)(iVar5 + puVar2[2]) == *local_c)) {
                  param_2 = param_2 + 1;
                  local_14 = local_14 + 1;
                  if (local_10 < local_14) {
                    local_10 = local_14;
                  }
                  if ((puVar2[3] == 1) &&
                     (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar2[4] * 4) + 0x10) ==
                      3)) {
                    *param_7 = 1;
                  }
                  if (((*puVar2 & 0xfff00000) != 0x50000000) && (uVar7 = 0, puVar2[3] != 0)) {
                    do {
                      if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                           *(int *)(puVar2[4] + uVar7 * 4) * 4) + 0x10) == 3) {
                        *param_7 = 1;
                      }
                      uVar7 = uVar7 + 1;
                    } while (uVar7 < puVar2[3]);
                  }
                }
                iVar5 = iVar5 + 4;
              }
              if ((param_2 != uVar4) && (param_2 != 0)) {
                *param_8 = 1;
              }
              local_8 = local_8 + uVar4 * 4;
              local_20 = local_20 - 1;
            } while (local_20 != 0);
          }
          local_c = local_c + 1;
          local_24 = local_24 + -1;
        } while (local_24 != 0);
      }
    }
  }
  *param_6 = local_10;
  return 0;
}


