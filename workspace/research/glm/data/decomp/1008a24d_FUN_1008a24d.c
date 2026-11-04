// 1008a24d size=630 FUN_1008a24d

uint FUN_1008a24d(int param_1,uint param_2,uint param_3,uint param_4,uint *param_5,uint param_6)

{
  uint uVar1;
  int iVar2;
  int in_ECX;
  uint uVar3;
  uint uVar4;
  int iVar5;
  uint uVar6;
  bool bVar7;
  bool bVar8;
  uint local_4c [9];
  int local_28;
  uint local_24;
  int local_20;
  int local_1c;
  int local_18;
  uint local_14;
  uint *local_10;
  uint local_c;
  int local_8;
  
  iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + param_2 * 4);
  local_24 = *(uint *)(*(int *)(param_1 + 8) + *(int *)(iVar5 + 0xc) * 4);
  local_20 = iVar5;
  local_c = 4;
  local_18 = in_ECX;
  if ((*(byte *)(iVar5 + 3) & 0x80) == 0) {
    bVar7 = local_24 == 0;
    bVar8 = false;
    if (local_24 == 1) {
      if ((*(byte *)(in_ECX + 0x6c) & 4) != 0) goto LAB_1008a2aa;
      bVar7 = false;
      bVar8 = true;
    }
    if (((!bVar7 && !bVar8) && ((*(byte *)(in_ECX + 0x6c) & 2) != 0)) ||
       (iVar2 = FUN_1008540c(), iVar2 != 0)) goto LAB_1008a2aa;
  }
  else {
LAB_1008a2aa:
    local_c = 1;
  }
  local_4c[4] = 0xffffffff;
  local_4c[5] = 0xffffffff;
  local_4c[6] = 0xffffffff;
  local_4c[7] = 0xffffffff;
  local_4c[0] = 0xffffffff;
  local_4c[1] = 0xffffffff;
  local_4c[2] = 0xffffffff;
  local_4c[3] = 0xffffffff;
  local_8 = 4;
  param_2 = 0;
  iVar5 = *(int *)(iVar5 + 0xc) << 4;
  do {
    local_28 = *(int *)(iVar5 + *(int *)(param_1 + 0x18));
    local_1c = 0;
    if (local_28 == -1) {
LAB_1008a388:
      local_8 = local_8 + -1;
    }
    else {
      local_4c[8] = *(uint *)(iVar5 + *(int *)(param_1 + 0x30));
      local_14 = 0;
      if (local_4c[8] == 0) goto LAB_1008a388;
      local_10 = (uint *)(*(int *)(param_1 + 0x38) + *(int *)(iVar5 + *(int *)(param_1 + 0x34)) * 4)
      ;
      do {
        uVar6 = *(uint *)(*(int *)(param_1 + 0x10) + (*local_10 & 0xfffffffc));
        if (uVar6 != 0xffffffff) {
          local_1c = 1;
        }
        if ((((param_3 == uVar6) &&
             (uVar6 = *(uint *)(*(int *)(param_1 + 0x14) + *local_10 * 4), uVar6 != 0xffffffff)) &&
            ((local_4c[uVar6 + 4] == 0xffffffff && ((local_c != 1 || (param_2 == uVar6)))))) &&
           (iVar2 = FUN_1008a14f(param_1,local_28,param_3,uVar6), iVar2 == -1)) {
          local_8 = local_8 + -1;
          local_4c[uVar6 + 4] = param_2;
          local_4c[param_2] = uVar6;
          break;
        }
        local_14 = local_14 + 1;
        local_10 = local_10 + 1;
      } while (local_14 < local_4c[8]);
      if (local_1c == 0) goto LAB_1008a388;
    }
    uVar6 = 0;
    param_2 = param_2 + 1;
    iVar5 = iVar5 + 4;
  } while (param_2 < 4);
  uVar3 = local_8 << 0x1d;
  if (param_6 <= uVar3) {
    return uVar3;
  }
  iVar5 = 0;
  if ((int)param_4 < 0) {
    if ((param_3 & 1) == 0) goto LAB_1008a3c4;
  }
  else if (((int)param_4 < 1) || ((param_3 & 1) != 0)) goto LAB_1008a3c4;
  iVar5 = 1;
LAB_1008a3c4:
  uVar3 = uVar3 | iVar5 << 0x1c;
  param_4 = uVar3;
  if (uVar3 < param_6) {
    do {
      if ((local_4c[uVar6] == 0xffffffff) &&
         (iVar5 = *(int *)(*(int *)(param_1 + 0x18) + (uVar6 + *(int *)(local_20 + 0xc) * 4) * 4),
         iVar5 != -1)) {
        uVar4 = 0;
        if (local_c != 0) {
          do {
            uVar3 = uVar4 + uVar6 & 3;
            if ((local_24 == 1) &&
               ((((*(byte *)(local_18 + 0x70) & 2) == 0 ||
                 (uVar1 = **(uint **)(*(int *)(local_18 + 0x18) + *(int *)(local_20 + 0x48) * 4),
                 (uVar1 & 0xfff00000) != 0x50000000)) || (3 < (uVar1 & 0xfffff))))) {
              uVar3 = 3 - uVar3;
            }
            if ((local_4c[uVar3 + 4] == 0xffffffff) &&
               (iVar2 = FUN_1008a14f(param_1,iVar5,param_3,uVar3), iVar2 == -1)) {
              local_4c[uVar3 + 4] = uVar6;
              local_4c[uVar6] = uVar3;
              break;
            }
            uVar4 = uVar4 + 1;
          } while (uVar4 < local_c);
        }
        if (local_c == uVar4) {
          return 0xffffffff;
        }
        if ((((*(byte *)(param_1 + 0x60) & 1) == 0) || (uVar3 = param_4, 1 < local_24)) &&
           (param_4 = param_4 + uVar4 * 0x1000000, uVar3 = param_4, param_6 <= param_4)) {
          return param_4;
        }
      }
      uVar6 = uVar6 + 1;
    } while (uVar6 < 4);
    if (param_5 != (uint *)0x0) {
      *param_5 = local_4c[0];
      param_5[1] = local_4c[1];
      param_5[2] = local_4c[2];
      param_5[3] = local_4c[3];
    }
  }
  return uVar3;
}


