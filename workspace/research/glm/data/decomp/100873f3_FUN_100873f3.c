// 100873f3 size=1642 FUN_100873f3

bool FUN_100873f3(uint *param_1,int param_2)

{
  double dVar1;
  uint *puVar2;
  uint *puVar3;
  uint uVar4;
  bool bVar5;
  uint *puVar6;
  int *piVar7;
  int in_ECX;
  uint uVar8;
  int iVar9;
  int iVar10;
  uint uVar11;
  undefined4 *puVar12;
  int iVar13;
  uint *puVar14;
  undefined4 *puVar15;
  bool bVar16;
  double local_3c;
  uint local_2c;
  int local_28;
  uint local_24;
  uint local_20;
  int *local_1c;
  uint local_18;
  int *local_14;
  int local_10;
  uint local_c;
  
  puVar6 = param_1;
  if ((*param_1 & 0xfff00000) != 0x50000000) {
    return true;
  }
  puVar2 = *(uint **)(*(int *)(in_ECX + 0x14) + *(int *)param_1[4] * 4);
  uVar11 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + puVar2[1] * 4) + 4);
  if ((uVar11 & 1) == 0) {
    return true;
  }
  if ((uVar11 & 0x1000) != 0) {
    return true;
  }
  uVar11 = *param_1 & 0xfffff;
  local_18 = 0xe;
  if (uVar11 != 0) {
    piVar7 = (int *)param_1[2];
    local_14 = piVar7 + uVar11;
    local_24 = uVar11;
    do {
      iVar9 = *(int *)(in_ECX + 0x14);
      if (param_2 == 0) {
        puVar14 = *(uint **)(iVar9 + *piVar7 * 4);
        iVar13 = *local_14;
      }
      else {
        puVar14 = *(uint **)(iVar9 + *(int *)(*(int *)(iVar9 + *piVar7 * 4) + 0x30) * 4);
        iVar13 = *(int *)(*(int *)(iVar9 + *local_14 * 4) + 0x30);
      }
      puVar3 = *(uint **)(iVar9 + iVar13 * 4);
      uVar8 = *puVar14;
      local_c = 0;
      if (((((uVar8 & 4) != 0) && ((*puVar3 & 4) != 0)) ||
          (((uVar8 & 8) != 0 && ((*puVar3 & 8) != 0)))) || (puVar14 == puVar3)) {
        local_c = 4;
      }
      if ((((uVar8 & 4) != 0) && ((*puVar3 & 8) != 0)) ||
         (((uVar8 & 8) != 0 && ((*puVar3 & 4) != 0)))) {
        local_c = local_c | 8;
      }
      if (((uVar8 & 2) != 0) && ((*puVar3 & 2) != 0)) {
        local_c = local_c | 2;
      }
      local_18 = local_18 & local_c;
      local_14 = local_14 + 1;
      piVar7 = piVar7 + 1;
      local_24 = local_24 - 1;
    } while (local_24 != 0);
  }
  *puVar2 = *puVar2 | local_18;
  if (param_2 != 0) {
    local_24 = 0xffffffff;
    local_3c = 0.0;
    local_c = 0;
    local_10 = 0;
    local_20 = 0;
    if (uVar11 != 0) {
      local_1c = (int *)param_1[2];
      iVar9 = *(int *)(in_ECX + 0x14);
      piVar7 = local_1c + uVar11;
      do {
        uVar8 = *(uint *)(*(int *)(iVar9 + *piVar7 * 4) + 0x30);
        uVar4 = *(uint *)(*(int *)(iVar9 + *local_1c * 4) + 0x30);
        iVar13 = *(int *)(iVar9 + uVar8 * 4);
        iVar10 = *(int *)(iVar9 + uVar4 * 4);
        if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar10 + 4) * 4) + 5) & 1) == 0)
           || (*(int *)(iVar10 + 8) != -1)) {
          bVar16 = false;
        }
        else {
          bVar16 = true;
        }
        if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar13 + 4) * 4) + 5) & 1) == 0)
           || (*(int *)(iVar13 + 8) != -1)) {
          bVar5 = false;
        }
        else {
          bVar5 = true;
        }
        if (((bVar16) && (*(double *)(iVar10 + 0x20) == 0.0)) ||
           ((bVar5 && (*(double *)(iVar13 + 0x20) == 0.0)))) {
LAB_100875f3:
          local_c = local_c + 1;
        }
        else {
          if (bVar16) {
            if (bVar5) {
              local_3c = *(double *)(iVar13 + 0x20) * *(double *)(iVar10 + 0x20) + local_3c;
              goto LAB_100875f3;
            }
            dVar1 = *(double *)(iVar10 + 0x20);
          }
          else {
            if (!bVar5) break;
            dVar1 = *(double *)(iVar13 + 0x20);
            uVar8 = uVar4;
          }
          if (dVar1 != 1.0) break;
          local_10 = local_10 + 1;
          local_24 = uVar8;
        }
        local_20 = local_20 + 1;
        local_1c = local_1c + 1;
        piVar7 = piVar7 + 1;
      } while (local_20 < uVar11);
      if (((local_10 == 1) && (uVar11 - 1 == local_c)) && (local_3c == 0.0)) {
        *param_1 = 0;
        puVar2[0xc] = local_24;
        return false;
      }
    }
    if (uVar11 == local_c) {
      *param_1 = 0;
      uVar11 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,local_3c);
      puVar2[0xc] = uVar11;
      *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar11 * 4) + 0x30) = uVar11;
      return false;
    }
  }
  local_28 = 0;
  local_c = 0;
  local_10 = 0;
  bVar16 = false;
  if (uVar11 != 0) {
    local_14 = (int *)param_1[2];
    piVar7 = local_14 + uVar11;
    local_2c = uVar11;
    do {
      iVar9 = *(int *)(in_ECX + 0x14);
      iVar13 = *piVar7;
      iVar10 = *(int *)(iVar9 + *local_14 * 4);
      if (param_2 != 0) {
        iVar10 = *(int *)(iVar9 + *(int *)(iVar10 + 0x30) * 4);
        iVar13 = *(int *)(*(int *)(iVar9 + iVar13 * 4) + 0x30);
      }
      iVar9 = *(int *)(iVar9 + iVar13 * 4);
      if (((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar10 + 4) * 4) + 5) & 1) == 0)
           || (*(int *)(iVar10 + 8) != -1)) || (*(double *)(iVar10 + 0x20) != 0.0)) &&
         ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar9 + 4) * 4) + 5) & 1) == 0 ||
           (*(int *)(iVar9 + 8) != -1)) || (*(double *)(iVar9 + 0x20) != 0.0)))) {
        local_c = local_c + 1;
        local_10 = 0;
      }
      else {
        local_28 = local_28 + 1;
        local_10 = local_10 + 1;
      }
      local_14 = local_14 + 1;
      piVar7 = piVar7 + 1;
      local_2c = local_2c - 1;
    } while (local_2c != 0);
    if (((local_28 != 0) && ((local_c != 2 || ((*(byte *)(in_ECX + 0x6c) & 0x20) != 0)))) &&
       ((local_c == 1 || ((local_28 == local_10 || ((*(byte *)(in_ECX + 0x6c) & 6) == 0)))))) {
      if (local_c == 0) {
        *param_1 = 0;
        return false;
      }
      local_c = 0;
      local_28 = uVar11 << 2;
      local_2c = 0;
      local_14 = (int *)local_28;
      do {
        uVar8 = param_1[2];
        iVar9 = *(int *)(uVar8 + local_2c * 4);
        iVar13 = *(int *)(in_ECX + 0x14);
        local_10 = *(int *)(iVar13 + iVar9 * 4);
        if (param_2 == 0) {
          iVar10 = *(int *)((int)local_14 + uVar8);
        }
        else {
          local_10 = *(int *)(iVar13 + *(int *)(local_10 + 0x30) * 4);
          iVar10 = *(int *)(*(int *)(iVar13 + *(int *)((int)local_14 + uVar8) * 4) + 0x30);
        }
        iVar13 = *(int *)(iVar13 + iVar10 * 4);
        if (((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(local_10 + 4) * 4) + 5) & 1)
               == 0) || (*(int *)(local_10 + 8) != -1)) || (*(double *)(local_10 + 0x20) != 0.0)) &&
           ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar13 + 4) * 4) + 5) & 1) == 0
             || (*(int *)(iVar13 + 8) != -1)) || (*(double *)(iVar13 + 0x20) != 0.0)))) {
          *(int *)(uVar8 + local_c * 4) = iVar9;
          *(undefined4 *)(local_28 + param_1[2]) = *(undefined4 *)((int)local_14 + param_1[2]);
          local_28 = local_28 + 4;
          local_c = local_c + 1;
        }
        local_14 = (int *)((int)local_14 + 4);
        local_2c = local_2c + 1;
      } while (local_2c < uVar11);
      puVar12 = (undefined4 *)(uVar11 * 4 + param_1[2]);
      puVar15 = (undefined4 *)(param_1[2] + local_c * 4);
      for (uVar8 = local_c & 0x3fffffff; uVar8 != 0; uVar8 = uVar8 - 1) {
        *puVar15 = *puVar12;
        puVar12 = puVar12 + 1;
        puVar15 = puVar15 + 1;
      }
      for (iVar9 = 0; iVar9 != 0; iVar9 = iVar9 + -1) {
        *(undefined1 *)puVar15 = *(undefined1 *)puVar12;
        puVar12 = (undefined4 *)((int)puVar12 + 1);
        puVar15 = (undefined4 *)((int)puVar15 + 1);
      }
      if (local_c == 1) {
        uVar8 = 0x20500001;
      }
      else {
        uVar8 = local_c & 0xfffff | 0x50000000;
      }
      *param_1 = uVar8;
      param_1[1] = local_c * 2;
      bVar16 = uVar11 != local_c;
      param_1[3] = 1;
      param_1 = (uint *)local_c;
      uVar11 = (uint)param_1;
    }
  }
  param_1 = (uint *)uVar11;
  if ((param_1 < 2) || ((param_1 == (uint *)0x2 && ((*(byte *)(in_ECX + 0x6c) & 0x20) == 0)))) {
    local_c = 0;
    if (param_1 != (uint *)0x0) {
      iVar9 = (int)param_1 << 2;
      do {
        if (param_2 == 0) {
          iVar13 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar6[2] + local_c * 4) * 4);
          iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar9 + puVar6[2]) * 4);
        }
        else {
          iVar10 = *(int *)(in_ECX + 0x14);
          iVar13 = *(int *)(iVar10 + *(int *)(*(int *)(iVar10 + *(int *)(puVar6[2] + local_c * 4) *
                                                                4) + 0x30) * 4);
          iVar10 = *(int *)(iVar10 + *(int *)(*(int *)(iVar10 + *(int *)(iVar9 + puVar6[2]) * 4) +
                                             0x30) * 4);
        }
        if (((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar13 + 4) * 4) + 5) & 1) ==
               0) || (*(int *)(iVar13 + 8) != -1)) || (*(double *)(iVar13 + 0x20) != 1.0)) &&
           ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar10 + 4) * 4) + 5) & 1) == 0
             || (*(int *)(iVar10 + 8) != -1)) || (*(double *)(iVar10 + 0x20) != 1.0)))) break;
        local_c = local_c + 1;
        iVar9 = iVar9 + 4;
      } while (local_c < param_1);
    }
    if ((uint *)local_c == param_1) {
      local_c = 0;
      if (param_1 != (uint *)0x0) {
        local_28 = (int)param_1 << 2;
        do {
          piVar7 = (int *)(puVar6[2] + local_c * 4);
          if (param_2 == 0) {
            iVar9 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar7 * 4);
          }
          else {
            iVar9 = *(int *)(*(int *)(in_ECX + 0x14) +
                            *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar7 * 4) + 0x30) * 4);
          }
          if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar9 + 4) * 4) + 5) & 1) !=
                0) && (*(int *)(iVar9 + 8) == -1)) && (*(double *)(iVar9 + 0x20) == 1.0)) {
            *piVar7 = *(int *)(puVar6[2] + local_28);
          }
          local_28 = local_28 + 4;
          local_c = local_c + 1;
        } while (local_c < param_1);
      }
      if (param_1 == (uint *)0x2) {
        *puVar6 = 0x20400001;
        puVar6[1] = 2;
      }
      else {
        *puVar6 = 0x10000001;
        puVar6[1] = 1;
      }
      bVar16 = true;
    }
  }
  return !bVar16;
}


