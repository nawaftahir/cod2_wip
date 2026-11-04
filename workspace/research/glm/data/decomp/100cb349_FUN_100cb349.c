// 100cb349 size=511 FUN_100cb349

int FUN_100cb349(undefined4 param_1,int *param_2,int *param_3,uint param_4,uint param_5,
                undefined4 param_6)

{
  uint uVar1;
  int iVar2;
  int *in_ECX;
  int iVar3;
  uint uVar4;
  int *piVar5;
  uint uVar6;
  bool bVar7;
  int local_34 [4];
  int local_24 [4];
  int *local_14;
  int local_10;
  uint local_c;
  uint local_8;
  
  if (((param_5 < param_4) && (param_5 == 1)) && (**(int **)(in_ECX[0x40] + 8) == *param_3)) {
    iVar2 = FUN_100cb270(param_1,0);
  }
  else {
    iVar3 = *param_3 * 4;
    iVar2 = *param_2 * 4;
    if (((*(int *)(*(int *)(in_ECX[5] + iVar2) + 4) == *(int *)(*(int *)(iVar3 + in_ECX[5]) + 4)) &&
        (*(int *)(*(int *)(in_ECX[5] + iVar2) + 8) == *(int *)(*(int *)(in_ECX[5] + iVar3) + 8))) &&
       (*(int *)(*(int *)(in_ECX[5] + iVar2) + 0xc) == *(int *)(*(int *)(in_ECX[5] + iVar3) + 0xc)))
    {
      uVar6 = 0;
      bVar7 = false;
      if (param_4 != 0) {
        do {
          param_5 = 0;
          if (uVar6 != 0) {
            do {
              if (*(int *)(*(int *)(in_ECX[5] + param_3[uVar6] * 4) + 0x10) ==
                  *(int *)(*(int *)(in_ECX[5] + param_2[param_5] * 4) + 0x10)) break;
              param_5 = param_5 + 1;
            } while (param_5 < uVar6);
            if (param_5 < uVar6) break;
          }
          uVar6 = uVar6 + 1;
        } while (uVar6 < param_4);
        bVar7 = uVar6 < param_4;
      }
      local_c = (uint)bVar7;
      if (local_c != 0) {
        uVar4 = 0;
        uVar6 = 0;
        if (param_4 != 0) {
          do {
            uVar1 = *(uint *)(*(int *)(in_ECX[5] + param_2[uVar4] * 4) + 0x10);
            if (uVar6 <= uVar1) {
              uVar6 = uVar1 + 1;
            }
            uVar4 = uVar4 + 1;
          } while (uVar4 < param_4);
        }
        iVar2 = (**(code **)(*in_ECX + 0x80))(in_ECX[0x3f],local_34,uVar6,0,0);
        uVar6 = 0;
        if (iVar2 < 0) {
          return iVar2;
        }
        if (param_4 != 0) {
          iVar2 = in_ECX[5];
          do {
            local_24[uVar6] = local_34[*(int *)(*(int *)(iVar2 + param_2[uVar6] * 4) + 0x10)];
            uVar6 = uVar6 + 1;
          } while (uVar6 < param_4);
        }
        local_14 = param_2;
        param_2 = local_24;
      }
    }
    else {
      local_c = 0;
    }
    uVar6 = 0;
    if (param_4 != 0) {
      do {
        param_5 = 1;
        if (uVar6 + 1 < param_4) {
          piVar5 = param_3 + uVar6;
          local_10 = *(int *)(*(int *)(in_ECX[5] + *piVar5 * 4) + 0x10);
          local_8 = uVar6 + 1;
          do {
            piVar5 = piVar5 + 1;
            if (*(int *)(*(int *)(in_ECX[5] + *piVar5 * 4) + 0x10) != local_10) break;
            param_5 = param_5 + 1;
            local_8 = local_8 + 1;
          } while (local_8 < param_4);
        }
        iVar2 = FUN_100c9a7f(param_1,param_2 + uVar6,param_5,param_3 + uVar6,0,0,param_5,param_6,
                             param_6,param_6,0);
        if (iVar2 < 0) {
          return iVar2;
        }
        uVar6 = uVar6 + param_5;
      } while (uVar6 < param_4);
    }
    if ((local_c == 0) ||
       (iVar2 = FUN_100c9a7f(1,local_14,param_4,param_2,0,0,param_4,0,0,0,0), -1 < iVar2)) {
      iVar2 = 0;
    }
  }
  return iVar2;
}


