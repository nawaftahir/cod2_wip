// 100c1688 size=752 FUN_100c1688

int FUN_100c1688(int param_1,undefined4 *param_2,int *param_3,undefined4 *param_4,uint *param_5,
                int param_6)

{
  uint *puVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  int iVar6;
  int *piVar7;
  int iVar8;
  int *in_ECX;
  uint uVar9;
  uint uVar10;
  undefined4 *puVar11;
  uint uVar12;
  undefined4 *puVar13;
  int local_34 [4];
  undefined4 *local_24 [4];
  uint local_14;
  int local_10;
  int *local_c;
  uint local_8;
  
  local_24[0] = (undefined4 *)0x0;
  local_24[1] = (undefined4 *)0x0;
  local_24[2] = (undefined4 *)0x0;
  uVar10 = *param_5 & 0xfffff;
  local_14 = uVar10;
  local_24[3] = (undefined4 *)0x0;
  local_c = in_ECX;
  if ((*(byte *)((int)in_ECX + 0x6f) & 2) == 0) {
    uVar12 = 0;
    if (uVar10 != 0) {
      do {
        iVar6 = FUN_100c1571(*(undefined4 *)(param_1 + uVar12 * 4),local_24 + uVar12,
                             local_34 + uVar12);
        if (iVar6 != 0) {
          return iVar6;
        }
        uVar12 = uVar12 + 1;
      } while (uVar12 < uVar10);
    }
    local_8 = 0;
    if (uVar10 != 0) {
      local_10 = (int)local_24 - (int)param_3;
      piVar7 = param_3;
      do {
        if (((*(int *)(*(int *)(in_ECX[5] +
                               *(int *)(((int)local_34 - (int)param_3) + (int)piVar7) * 4) + 0x38)
              != *piVar7) || ((*(byte *)(*(int *)(in_ECX[5] + *piVar7 * 4) + 0x3e) & 0x1f) != 0)) ||
           (*(undefined4 **)(((int)local_24 - (int)param_3) + (int)piVar7) != local_24[0]))
        goto LAB_100c196e;
        local_8 = local_8 + 1;
        piVar7 = piVar7 + 1;
      } while (local_8 < uVar10);
    }
    uVar12 = 0;
    if (local_24[0][3] != 0) {
      do {
        uVar9 = 0;
        local_8 = 1;
        if (uVar10 == 0) goto LAB_100c196e;
        do {
          if (*(int *)(local_24[0][4] + uVar12 * 4) == *(int *)(param_1 + uVar9 * 4)) {
            local_8 = 0;
          }
          uVar9 = uVar9 + 1;
        } while (uVar9 < uVar10);
        if (local_8 != 0) goto LAB_100c196e;
        uVar12 = uVar12 + 1;
      } while (uVar12 < (uint)local_24[0][3]);
    }
  }
  else {
    local_8 = 0;
    if (uVar10 != 0) {
      piVar7 = param_3;
      do {
        iVar6 = *(int *)(in_ECX[5] + *(int *)((int)piVar7 + (param_1 - (int)param_3)) * 4);
        if ((*(int *)(iVar6 + 0x38) != *piVar7) || ((*(uint *)(iVar6 + 0x3c) & 0x1f0000) != 0x10000)
           ) goto LAB_100c196e;
        puVar1 = *(uint **)(in_ECX[5] + *piVar7 * 4);
        uVar12 = puVar1[0xf];
        if (((uVar12 & 0x1f0000) != 0) ||
           (((uVar12 & 0x200) == 0 &&
            ((uVar12 = *puVar1, (uVar12 & 4) == 0 || ((uVar12 & 0x10) == 0)))))) goto LAB_100c196e;
        local_8 = local_8 + 1;
        piVar7 = piVar7 + 1;
      } while (local_8 < uVar10);
    }
  }
  iVar6 = FUN_10085814(0x74);
  if (iVar6 == 0) {
    iVar6 = 0;
  }
  else {
    iVar6 = FUN_10085379();
  }
  if (iVar6 == 0) {
    iVar8 = -0x7ff8fff2;
  }
  else {
    iVar8 = FUN_1008585f(uVar10 | 0x70100000,uVar10 * 3,uVar10,0);
    if ((-1 < iVar8) && (iVar8 = FUN_100853b0(param_5), -1 < iVar8)) {
      puVar11 = *(undefined4 **)(param_6 + 0x10);
      puVar13 = *(undefined4 **)(iVar6 + 0x10);
      for (uVar12 = uVar10; uVar12 != 0; uVar12 = uVar12 - 1) {
        *puVar13 = *puVar11;
        puVar11 = puVar11 + 1;
        puVar13 = puVar13 + 1;
      }
      for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
        *(undefined1 *)puVar13 = *(undefined1 *)puVar11;
        puVar11 = (undefined4 *)((int)puVar11 + 1);
        puVar13 = (undefined4 *)((int)puVar13 + 1);
      }
      piVar7 = *(int **)(iVar6 + 8);
      for (uVar12 = uVar10; uVar12 != 0; uVar12 = uVar12 - 1) {
        *piVar7 = *param_3;
        param_3 = param_3 + 1;
        piVar7 = piVar7 + 1;
      }
      for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
        *(char *)piVar7 = (char)*param_3;
        param_3 = (int *)((int)param_3 + 1);
        piVar7 = (int *)((int)piVar7 + 1);
      }
      puVar11 = (undefined4 *)(*(int *)(iVar6 + 8) + local_14 * 8);
      for (uVar12 = uVar10; uVar12 != 0; uVar12 = uVar12 - 1) {
        *puVar11 = *param_2;
        param_2 = param_2 + 1;
        puVar11 = puVar11 + 1;
      }
      for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
        *(undefined1 *)puVar11 = *(undefined1 *)param_2;
        param_2 = (undefined4 *)((int)param_2 + 1);
        puVar11 = (undefined4 *)((int)puVar11 + 1);
      }
      puVar11 = (undefined4 *)(*(int *)(iVar6 + 8) + uVar10 * 4);
      for (; uVar10 != 0; uVar10 = uVar10 - 1) {
        *puVar11 = *param_4;
        param_4 = param_4 + 1;
        puVar11 = puVar11 + 1;
      }
      for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
        *(undefined1 *)puVar11 = *(undefined1 *)param_4;
        param_4 = (undefined4 *)((int)param_4 + 1);
        puVar11 = (undefined4 *)((int)puVar11 + 1);
      }
      iVar8 = local_c[5];
      iVar2 = *(int *)(iVar8 + **(int **)(iVar6 + 0x10) * 4);
      iVar3 = *(int *)(iVar8 + **(int **)(iVar6 + 8) * 4);
      iVar8 = *(int *)(iVar8 + (*(int **)(iVar6 + 8))[local_14 * 2] * 4);
      iVar4 = *(int *)(iVar2 + 4);
      bVar5 = false;
      if (((((iVar4 == *(int *)(iVar3 + 4)) && (*(int *)(iVar2 + 0xc) == *(int *)(iVar3 + 0xc))) ||
           ((iVar4 == *(int *)(iVar8 + 4) && (*(int *)(iVar2 + 0xc) == *(int *)(iVar8 + 0xc))))) ||
          (iVar4 != local_c[0x22])) && ((*(byte *)((int)local_c + 0x6f) & 2) == 0)) {
        bVar5 = true;
      }
      iVar8 = (**(code **)(*local_c + 0x20))(iVar6,0);
      if ((iVar8 != 0) ||
         ((((*(byte *)(*(int *)(local_c[4] + *(int *)(iVar2 + 4) * 4) + 4) & 0x20) != 0 || (bVar5))
          && ((*(byte *)((int)local_c + 0x6f) & 2) == 0)))) {
        FUN_1006c418(1);
LAB_100c196e:
        iVar8 = 1;
      }
      else {
        iVar8 = FUN_10085abe(iVar6);
        if (-1 < iVar8) {
          FUN_1006c418(1);
          *param_5 = 0;
          if (local_24[0] != (undefined4 *)0x0) {
            *local_24[0] = 0;
          }
          iVar8 = 0;
        }
      }
    }
  }
  return iVar8;
}


