// 10087dc4 size=1548 FUN_10087dc4

int FUN_10087dc4(uint param_1,int *param_2,int *param_3,int *param_4,int *param_5,int *param_6)

{
  byte *pbVar1;
  uint *puVar2;
  int iVar3;
  uint *puVar4;
  int iVar5;
  int iVar6;
  uint uVar7;
  int *piVar8;
  int in_ECX;
  uint uVar9;
  int *piVar10;
  int iVar11;
  uint uVar12;
  int *local_10;
  uint local_8;
  
  pbVar1 = *(byte **)(*(int *)(in_ECX + 0x14) + param_1 * 4);
  if (((*(int *)(pbVar1 + 8) != -1) || ((*pbVar1 & 1) == 0)) ||
     ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(pbVar1 + 4) * 4) + 4) & 2) == 0)) {
    return -0x7fffbffb;
  }
  puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(pbVar1 + 0x48) * 4);
  uVar7 = puVar2[3];
  uVar9 = 0;
  if (uVar7 != 0) {
    piVar10 = (int *)puVar2[4];
    do {
      if (*piVar10 == param_1) break;
      uVar9 = uVar9 + 1;
      piVar10 = piVar10 + 1;
    } while (uVar9 < uVar7);
  }
  if (uVar9 == uVar7) {
    return -0x7fffbffb;
  }
  uVar12 = *puVar2 & 0xfff00000;
  if (uVar12 == 0x10000000) {
    iVar6 = *(int *)(puVar2[2] + uVar9 * 4);
LAB_10087e9b:
    iVar6 = FUN_10087dc4(iVar6,param_2,param_3,param_4,CONCAT44(param_6,param_5));
    if (-1 < iVar6) {
      return 0;
    }
    return iVar6;
  }
  if (uVar12 == 0x20500000) {
    iVar11 = *(int *)(puVar2[2] + uVar9 * 4);
    iVar6 = *(int *)(puVar2[2] + (uVar7 + uVar9) * 4);
    iVar5 = FUN_10087dc4(iVar11,param_2,param_3,param_4,param_5,param_6);
    if (iVar5 < 0) {
      return iVar5;
    }
    if (iVar11 == iVar6) {
      return 0;
    }
    goto LAB_10087e9b;
  }
  if (uVar12 == 0x20200000) {
    iVar6 = *(int *)(puVar2[2] + uVar9 * 4);
    iVar11 = *(int *)(puVar2[2] + (uVar7 + uVar9) * 4);
    if ((((*param_2 != -1) && (iVar11 != *param_2)) ||
        (iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + iVar6 * 4),
        (*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar5 + 4) * 4) + 4) & 0x100) == 0))
       || (*(int *)(iVar5 + 8) != -1)) {
      if ((*param_2 != -1) && (iVar6 != *param_2)) {
        return -0x7fffbffb;
      }
      iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + iVar11 * 4);
      if ((*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar5 + 4) * 4) + 4) & 0x100) == 0)
      {
        return -0x7fffbffb;
      }
      if (*(int *)(iVar5 + 8) != -1) {
        return -0x7fffbffb;
      }
      if ((*param_6 != -1) &&
         (*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + *param_6 * 4) + 0x20) <=
          *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar11 * 4) + 0x20))) {
        return 0;
      }
LAB_10087f7c:
      *param_2 = iVar6;
      *param_6 = iVar11;
      return 0;
    }
    if ((*param_3 != -1) &&
       (*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar6 * 4) + 0x20) <=
        *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + *param_3 * 4) + 0x20))) {
      return 0;
    }
LAB_10087ff4:
    *param_2 = iVar11;
    *param_3 = iVar6;
    return 0;
  }
  if (uVar12 == 0x20300000) {
    iVar6 = *(int *)(puVar2[2] + uVar9 * 4);
    iVar11 = *(int *)(puVar2[2] + (uVar7 + uVar9) * 4);
    if ((((*param_2 != -1) && (iVar11 != *param_2)) ||
        (iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + iVar6 * 4),
        (*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar5 + 4) * 4) + 4) & 0x100) == 0))
       || (*(int *)(iVar5 + 8) != -1)) {
      if ((*param_2 != -1) && (iVar6 != *param_2)) {
        return -0x7fffbffb;
      }
      iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + iVar11 * 4);
      if ((*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar5 + 4) * 4) + 4) & 0x100) == 0)
      {
        return -0x7fffbffb;
      }
      if (*(int *)(iVar5 + 8) != -1) {
        return -0x7fffbffb;
      }
      param_6 = param_4;
      if ((*param_4 != -1) &&
         (*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar11 * 4) + 0x20) <=
          *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + *param_4 * 4) + 0x20))) {
        return 0;
      }
      goto LAB_10087f7c;
    }
    param_3 = param_5;
    if ((*param_5 != -1) &&
       (*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + *param_5 * 4) + 0x20) <=
        *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar6 * 4) + 0x20))) {
      return 0;
    }
    goto LAB_10087ff4;
  }
  if (uVar12 != 0x30000000) {
    return -0x7fffbffb;
  }
  iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar2[2] + (uVar9 + puVar2[3]) * 4) * 4);
  iVar11 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar2[2] + (uVar9 + puVar2[3] * 2) * 4) * 4)
  ;
  iVar5 = *(int *)(in_ECX + 0x10);
  if ((*(uint *)(*(int *)(iVar5 + *(int *)(iVar6 + 4) * 4) + 4) & 0x100) == 0) {
    return -0x7fffbffb;
  }
  if (*(int *)(iVar6 + 8) != -1) {
    return -0x7fffbffb;
  }
  if ((*(uint *)(*(int *)(iVar5 + *(int *)(iVar11 + 4) * 4) + 4) & 0x100) == 0) {
    return -0x7fffbffb;
  }
  if (*(int *)(iVar11 + 8) != -1) {
    return -0x7fffbffb;
  }
  if ((*(double *)(iVar6 + 0x20) != 0.0) || (*(double *)(iVar11 + 0x20) != 1.0)) {
    if (*(double *)(iVar6 + 0x20) != 1.0) {
      return -0x7fffbffb;
    }
    if (*(double *)(iVar11 + 0x20) != 0.0) {
      return -0x7fffbffb;
    }
  }
  iVar11 = *(int *)(puVar2[2] + uVar9 * 4);
  iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + iVar11 * 4);
  if ((*(byte *)(*(int *)(iVar5 + *(int *)(iVar3 + 4) * 4) + 4) & 2) == 0) {
    return -0x7fffbffb;
  }
  puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar3 + 0x48) * 4);
  uVar7 = *puVar2 & 0xfff00000;
  if ((uVar7 != 0x20400000) && (uVar7 != 0x10100000)) {
    return -0x7fffbffb;
  }
  uVar9 = puVar2[3];
  param_1 = 0;
  if (uVar9 != 0) {
    local_10 = (int *)puVar2[4];
    do {
      if (*local_10 == iVar11) break;
      param_1 = param_1 + 1;
      local_10 = local_10 + 1;
    } while (param_1 < uVar9);
  }
  if (uVar7 == 0x10100000) {
    piVar8 = (int *)FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,0);
    piVar10 = *(int **)(puVar2[2] + param_1 * 4);
    if (piVar8 == (int *)0xffffffff) {
      return -0x7ff8fff2;
    }
    goto LAB_1008828a;
  }
  local_8 = 0;
  local_10 = (int *)(puVar2[2] + (param_1 + uVar9) * 4);
  do {
    iVar11 = *local_10;
    iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + iVar11 * 4);
    if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar5 + 4) * 4) + 4) & 2) != 0) &&
       (puVar4 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar5 + 0x48) * 4),
       (*puVar4 & 0xfff00000) == 0x10100000)) {
      local_10 = (int *)0x0;
      if (puVar4[3] == 0) goto LAB_1008826a;
      piVar10 = (int *)puVar4[4];
      goto LAB_10088252;
    }
    local_8 = local_8 + 1;
    local_10 = local_10 + -uVar9;
    piVar10 = param_2;
    piVar8 = param_2;
  } while (local_8 < 2);
  goto LAB_10088280;
  while( true ) {
    local_10 = (int *)((int)local_10 + 1);
    piVar10 = piVar10 + 1;
    if (puVar4[3] <= local_10) break;
LAB_10088252:
    if (iVar11 == *piVar10) break;
  }
LAB_1008826a:
  piVar10 = *(int **)(puVar4[2] + (int)local_10 * 4);
  piVar8 = *(int **)(puVar2[2] + (uVar9 * local_8 + param_1) * 4);
LAB_10088280:
  if (local_8 == 2) {
    return -0x7fffbffb;
  }
LAB_1008828a:
  if (((((int *)*param_2 == (int *)0xffffffff) || (piVar8 == (int *)*param_2)) &&
      (iVar11 = *(int *)(*(int *)(in_ECX + 0x14) + (int)piVar10 * 4),
      (*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar11 + 4) * 4) + 4) & 0x100) != 0))
     && (*(int *)(iVar11 + 8) == -1)) {
    if (*(double *)(iVar6 + 0x20) == 1.0) {
      if ((*param_4 != -1) &&
         (*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + (int)piVar10 * 4) + 0x20) <=
          *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + *param_4 * 4) + 0x20))) {
        return 0;
      }
    }
    else {
      param_4 = param_6;
      if ((*param_6 != -1) &&
         (*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + *param_6 * 4) + 0x20) <=
          *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + (int)piVar10 * 4) + 0x20))) {
        return 0;
      }
    }
    *param_2 = (int)piVar8;
    *param_4 = (int)piVar10;
    return 0;
  }
  if ((((int *)*param_2 == (int *)0xffffffff) || (piVar10 == (int *)*param_2)) &&
     ((iVar11 = *(int *)(*(int *)(in_ECX + 0x14) + (int)piVar8 * 4),
      (*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar11 + 4) * 4) + 4) & 0x100) != 0 &&
      (*(int *)(iVar11 + 8) == -1)))) {
    if (*(double *)(iVar6 + 0x20) == 1.0) {
      if ((*param_5 != -1) &&
         (*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + *param_5 * 4) + 0x20) <=
          *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + (int)piVar8 * 4) + 0x20))) {
        return 0;
      }
    }
    else {
      param_5 = param_3;
      if ((*param_3 != -1) &&
         (*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + (int)piVar8 * 4) + 0x20) <=
          *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + *param_3 * 4) + 0x20))) {
        return 0;
      }
    }
    *param_2 = (int)piVar10;
    *param_5 = (int)piVar8;
    return 0;
  }
  return -0x7fffbffb;
}


