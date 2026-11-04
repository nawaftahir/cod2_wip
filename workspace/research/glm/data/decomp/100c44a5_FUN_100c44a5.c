// 100c44a5 size=761 FUN_100c44a5

int FUN_100c44a5(uint param_1,uint *param_2,undefined4 *param_3)

{
  int *piVar1;
  uint uVar2;
  int iVar3;
  int *in_ECX;
  uint uVar4;
  int *local_c;
  int *local_8;
  
  uVar2 = param_1;
  if (in_ECX[0x22] == *(int *)(param_1 + 4)) {
    local_c = *(int **)(param_1 + 0xc);
    param_1 = 0;
    if ((int *)in_ECX[0xb] <= local_c) goto LAB_100c4673;
    piVar1 = (int *)in_ECX[0x14];
    if ((piVar1 != (int *)0x0) && (piVar1 <= local_c)) {
      local_c = (int *)((int)local_c - (int)piVar1);
      param_1 = 3;
    }
LAB_100c4549:
    local_8 = (int *)0x0;
    uVar4 = *(uint *)(uVar2 + 0x3c) & 0x1f0000;
    if (uVar4 == 0x100000) {
      local_8 = (int *)0xb000000;
    }
    else if (uVar4 == 0x180000) {
      local_8 = (int *)0xc000000;
    }
    else if (uVar4 == 0x80000) {
      local_8 = (int *)0x1000000;
    }
    else if (uVar4 == 0x20000) {
      local_8 = (int *)0x2000000;
    }
    else if (uVar4 == 0xa0000) {
      local_8 = (int *)0x3000000;
    }
    else if (uVar4 == 0x60000) {
      local_8 = (int *)0x4000000;
    }
    else if (uVar4 == 0xe0000) {
      local_8 = (int *)0x5000000;
    }
    else if (uVar4 == 0x10000) {
      local_8 = (int *)0x6000000;
    }
    else if (uVar4 == 0x40000) {
      local_8 = (int *)0x7000000;
    }
    else if (uVar4 == 0xc0000) {
      local_8 = (int *)0x8000000;
    }
    if (param_2 != (uint *)0x0) {
      *param_2 = ((param_1 | 0xfffffff8) << 0x14 | param_1 & 0x18) << 8 | (uint)local_c & 0x7ff |
                 (uint)local_8;
    }
    if (param_3 != (undefined4 *)0x0) {
      *param_3 = *(undefined4 *)(uVar2 + 8);
    }
    if (*(int *)(uVar2 + 8) != -1) {
      if (in_ECX[0x55] == 0) goto LAB_100c4789;
      *(byte *)((int)param_2 + 1) = *(byte *)((int)param_2 + 1) | 0x20;
    }
    iVar3 = 0;
  }
  else {
    uVar4 = *(uint *)(*(int *)(in_ECX[4] + *(int *)(param_1 + 4) * 4) + 4);
    if (((uVar4 & 0x10) != 0) && ((uVar4 & 4) != 0)) {
      param_1 = 0xf;
      local_c = (int *)0x0;
      goto LAB_100c4549;
    }
    local_c = in_ECX;
    if (((uVar4 & 0x10) != 0) && ((uVar4 & 0x200) == 0)) {
      iVar3 = (**(code **)(*in_ECX + 0x88))(param_1,&local_c,&param_1);
      if (iVar3 < 0) {
        return iVar3;
      }
      goto LAB_100c4549;
    }
    if (((uVar4 & 0x200) != 0) && ((uVar4 & 0x42080) == 0)) {
      local_c = *(int **)(param_1 + 0xc);
      if ((int *)in_ECX[0xe] <= local_c) goto LAB_100c4673;
      if (local_c < (int *)0x800) {
        param_1 = 2;
      }
      else if (local_c < (int *)0x1000) {
        param_1 = 0xb;
      }
      else {
        param_1 = 0xd - (local_c < (int *)0x1800);
      }
      local_c = (int *)((uint)local_c & 0x7ff);
      goto LAB_100c4549;
    }
    if ((uVar4 & 0x200) != 0) {
      if (-1 < (char)uVar4) {
        if ((uVar4 & 0x2000) != 0) {
          local_c = *(int **)(param_1 + 0xc);
          param_1 = 0xe;
          if ((int *)in_ECX[0x18] <= local_c) goto LAB_100c4673;
          goto LAB_100c4549;
        }
        goto LAB_100c45fc;
      }
LAB_100c4600:
      local_c = *(int **)(param_1 + 0xc);
      param_1 = 10;
      if ((int *)in_ECX[0x13] <= local_c) {
LAB_100c4673:
        FUN_1008b0b5();
        return -0x7789f4a7;
      }
      goto LAB_100c4549;
    }
LAB_100c45fc:
    if ((char)uVar4 < '\0') goto LAB_100c4600;
    if ((uVar4 & 0x40000) != 0) {
      local_c = *(int **)(param_1 + 0xc);
      param_1 = 7;
      if ((int *)in_ECX[0x10] <= local_c) goto LAB_100c4673;
      goto LAB_100c4549;
    }
    local_8 = in_ECX;
    if (in_ECX[0x24] == *(int *)(param_1 + 4)) {
      local_c = *(int **)(param_1 + 0xc);
      param_1 = 0x13;
      if ((int *)in_ECX[0xd] <= local_c) goto LAB_100c4673;
      goto LAB_100c4549;
    }
LAB_100c4789:
    FUN_1008b0b5();
    iVar3 = -0x7fffbffb;
  }
  return iVar3;
}


