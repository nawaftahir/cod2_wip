// 100b3f9f size=424 FUN_100b3f9f

int FUN_100b3f9f(int *param_1,uint param_2,uint param_3)

{
  int iVar1;
  int *piVar2;
  int iVar3;
  int *in_ECX;
  uint uVar4;
  uint uVar5;
  bool bVar6;
  int local_30 [4];
  int local_20 [5];
  int local_c;
  int local_8;
  
  uVar4 = 0;
  bVar6 = param_3 == 0;
  if (param_3 != 0) {
    local_c = *(int *)(in_ECX[0x40] + 8);
    local_20[4] = *(int *)(*(int *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 0x10) * 4) + 4);
    local_8 = 0;
    do {
      if ((local_20[4] == *(int *)(*(int *)(in_ECX[5] + *(int *)(local_8 + local_c) * 4) + 4)) &&
         (*(int *)(*(int *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 0x10) * 4) + 0xc) ==
          *(int *)(*(int *)(in_ECX[5] + *(int *)(local_8 + *(int *)(in_ECX[0x40] + 8)) * 4) + 0xc)))
      break;
      local_8 = local_8 + param_2 * 4;
      uVar4 = uVar4 + 1;
    } while (uVar4 < param_3);
    bVar6 = uVar4 == param_3;
  }
  if (!bVar6) {
    iVar1 = *(int *)(in_ECX[0x40] + 8) + uVar4 * param_2 * 4;
    local_20[0] = -1;
    local_20[1] = 0xffffffff;
    local_20[2] = 0xffffffff;
    uVar4 = 0;
    uVar5 = 0;
    local_20[3] = 0xffffffff;
    if (param_2 != 0) {
      do {
        iVar3 = *(int *)(iVar1 + uVar4 * 4);
        uVar4 = uVar4 + 1;
        local_20[*(int *)(*(int *)(in_ECX[5] + iVar3 * 4) + 0x10)] = iVar3;
      } while (uVar4 < param_2);
    }
    uVar4 = 0;
    do {
      uVar5 = uVar5 + (local_20[uVar4] != -1);
      uVar4 = uVar4 + 1;
    } while (uVar4 < 4);
    iVar3 = (**(code **)(*in_ECX + 0x80))(in_ECX[0x3f],local_30,4,0,0);
    if (iVar3 < 0) {
      return iVar3;
    }
    iVar3 = FUN_10085814(0x74);
    if (iVar3 == 0) {
      iVar3 = 0;
    }
    else {
      iVar3 = FUN_10085379();
    }
    *param_1 = iVar3;
    if (iVar3 == 0) {
      return -0x7ff8fff2;
    }
    iVar3 = FUN_1008585f(uVar5 & 0xfffff | 0x10000000,uVar5,uVar5,0);
    if (iVar3 < 0) {
      return iVar3;
    }
    iVar3 = FUN_100853b0(in_ECX[0x40]);
    if (iVar3 < 0) {
      return iVar3;
    }
    iVar3 = 0;
    uVar4 = 0;
    do {
      if (*(int *)((int)local_20 + uVar4) != -1) {
        *(undefined4 *)(iVar3 + *(int *)(*param_1 + 0x10)) = *(undefined4 *)((int)local_30 + uVar4);
        *(undefined4 *)(iVar3 + *(int *)(*param_1 + 8)) = *(undefined4 *)((int)local_20 + uVar4);
        iVar3 = iVar3 + 4;
      }
      uVar4 = uVar4 + 4;
    } while (uVar4 < 0x10);
    uVar4 = 0;
    if (param_2 != 0) {
      do {
        piVar2 = (int *)(iVar1 + uVar4 * 4);
        uVar4 = uVar4 + 1;
        *piVar2 = local_30[*(int *)(*(int *)(in_ECX[5] + *piVar2 * 4) + 0x10)];
      } while (uVar4 < param_2);
    }
  }
  return 0;
}


