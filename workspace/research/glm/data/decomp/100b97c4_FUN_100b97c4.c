// 100b97c4 size=433 FUN_100b97c4

undefined4
FUN_100b97c4(uint *param_1,int param_2,uint param_3,uint *param_4,uint *param_5,int param_6,
            int param_7)

{
  uint uVar1;
  int in_ECX;
  int iVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  uint auStack_44 [4];
  int local_34 [5];
  int local_20;
  int local_1c;
  int local_18;
  uint local_14;
  int local_10;
  int local_c;
  uint *local_8;
  
  uVar4 = *param_1;
  local_34[0] = 0;
  local_34[1] = 0;
  local_34[2] = 0;
  local_34[3] = 0;
  local_34[4] = uVar4;
  if (((uVar4 & 0xfff00000) == 0x50000000) || ((uVar4 & 0xfff00000) == 0x70800000)) {
    uVar5 = 0;
    uVar1 = 0;
    do {
      if (uVar1 < (uVar4 & 0xfffff)) {
        param_5[uVar1] = uVar1;
      }
      else {
        param_5[uVar1] = 0xff;
      }
      uVar1 = uVar1 + 1;
    } while (uVar1 < 4);
    if (param_3 != 0) {
      do {
        iVar2 = *(int *)(param_2 + uVar5 * 4);
        iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + iVar2 * 4);
        if ((iVar2 != *(int *)param_1[4]) || (*(int *)(iVar3 + 0x3c) != param_6)) {
          if (*(int *)(iVar3 + 0x38) != *(int *)param_1[4]) {
            return 1;
          }
          if (*(int *)(iVar3 + 0x3c) != param_6) {
            return 1;
          }
        }
        uVar5 = uVar5 + 1;
      } while (uVar5 < param_3);
    }
  }
  else {
    local_14 = 0;
    if (param_3 != 0) {
      local_18 = *(int *)(in_ECX + 0x14);
      iVar2 = param_2 - (int)param_4;
      local_8 = param_4;
      local_20 = iVar2;
      do {
        local_10 = 0;
        local_c = *(int *)(local_18 + *(int *)(iVar2 + (int)local_8) * 4);
        uVar1 = local_14;
        if ((param_7 == 0) || (uVar1 = *local_8, uVar1 < 4)) {
          uVar4 = 0;
          if (param_1[3] == 0) {
            return 1;
          }
          local_1c = param_1[4] - (int)local_34;
          do {
            if (((*(int *)(uVar1 * 4 + param_2) == *(int *)(local_1c + (int)(local_34 + uVar4))) &&
                (*(int *)(local_c + 0x3c) == param_6)) ||
               ((*(int *)(local_c + 0x38) == *(int *)(param_1[4] + uVar4 * 4) &&
                (*(int *)(local_c + 0x3c) == param_6)))) {
              local_10 = 1;
              auStack_44[uVar1] = uVar4;
              local_34[uVar4] = 1;
            }
            uVar4 = uVar4 + 1;
          } while (uVar4 < param_1[3]);
          iVar2 = local_20;
          uVar4 = local_34[4];
          if (local_10 == 0) {
            return 1;
          }
        }
        local_8 = local_8 + 1;
        local_14 = local_14 + 1;
      } while (local_14 < param_3);
    }
    if (param_7 == 0) {
      uVar1 = 0;
      if ((uVar4 & 0xfffff) != 0) {
        do {
          if (local_34[uVar1] == 0) {
            return 1;
          }
          uVar1 = uVar1 + 1;
        } while (uVar1 < (uVar4 & 0xfffff));
      }
    }
    iVar3 = (int)param_4 - (int)param_5;
    iVar2 = 4;
    do {
      uVar4 = *(uint *)(iVar3 + (int)param_5);
      if (uVar4 < 4) {
        *param_5 = auStack_44[uVar4];
      }
      else {
        *param_5 = 0xff;
      }
      param_5 = param_5 + 1;
      iVar2 = iVar2 + -1;
    } while (iVar2 != 0);
  }
  return 0;
}


