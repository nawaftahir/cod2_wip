// 100accd2 size=1264 FUN_100accd2

undefined4 FUN_100accd2(void)

{
  float fVar1;
  int iVar2;
  uint *puVar3;
  uint *puVar4;
  undefined4 uVar5;
  int in_ECX;
  int iVar6;
  uint uVar7;
  uint uVar8;
  uint uVar9;
  uint *puVar10;
  float *pfVar11;
  int *piVar12;
  int iVar13;
  float local_170 [32];
  int local_f0 [32];
  int local_70 [8];
  float local_50 [4];
  int local_40 [5];
  undefined4 local_2c;
  uint local_28;
  uint *local_24;
  uint *local_20;
  uint local_1c;
  int local_18;
  uint local_14;
  uint local_10;
  uint *local_c;
  uint *local_8;
  
  uVar9 = *(uint *)(in_ECX + 8);
  pfVar11 = local_170;
  for (iVar6 = 0x20; iVar6 != 0; iVar6 = iVar6 + -1) {
    *pfVar11 = 0.0;
    pfVar11 = pfVar11 + 1;
  }
  piVar12 = local_f0;
  for (iVar6 = 0x20; iVar6 != 0; iVar6 = iVar6 + -1) {
    *piVar12 = 0;
    piVar12 = piVar12 + 1;
  }
  piVar12 = local_70;
  for (iVar6 = 8; iVar6 != 0; iVar6 = iVar6 + -1) {
    *piVar12 = 0;
    piVar12 = piVar12 + 1;
  }
  local_1c = uVar9;
  local_2c = FUN_100860e0(&DAT_1010e914,0x311,0x400000008);
  local_14 = 0;
  if (uVar9 != 0) {
    iVar6 = *(int *)(in_ECX + 0x10);
    piVar12 = *(int **)(in_ECX + 0x14);
    do {
      uVar9 = *(uint *)(*(int *)(iVar6 + *(int *)(*piVar12 + 4) * 4) + 4);
      if (((uVar9 & 0x200) != 0) && ((uVar9 & 0x180) == 0)) {
        uVar9 = *(uint *)(*piVar12 + 0xc);
        if (*(uint *)(in_ECX + 0x38) < uVar9) {
LAB_100ad1ab:
          FUN_1008b0b5();
          return 0x80004005;
        }
        local_f0[uVar9 * 4] = 1;
        local_f0[uVar9 * 4 + 1] = 1;
        local_f0[uVar9 * 4 + 2] = 1;
        local_f0[uVar9 * 4 + 3] = 1;
        local_70[uVar9] = 1;
      }
      local_14 = local_14 + 1;
      piVar12 = piVar12 + 1;
    } while (local_14 < local_1c);
  }
  uVar9 = *(uint *)(in_ECX + 0x224);
  uVar8 = *(uint *)(in_ECX + 0x220);
  local_10 = 0;
  if (uVar8 + uVar9 != 0) {
    do {
      if (local_10 < uVar8) {
        local_24 = *(uint **)(*(int *)(in_ECX + 0x22c) + local_10 * 4);
      }
      else {
        local_24 = *(uint **)(*(int *)(in_ECX + 0x230) + (local_10 - uVar8) * 4);
      }
      local_18 = 0;
      if ((((local_24 != (uint *)0x0) && (local_24[3] != 0)) && (*(int *)local_24[4] != -1)) &&
         ((*local_24 & 0xfff00000) != 0)) {
        if (((*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)local_24[4] * 4) + 0x10) != 3) &&
            (local_24[3] != 4)) && (uVar8 <= local_10)) {
          iVar6 = 1;
          if ((local_10 - uVar8) + 1 < uVar9) {
            uVar7 = (local_10 - uVar8) + 1;
            uVar9 = (local_10 - uVar8) + 1;
            do {
              iVar13 = *(int *)(*(int *)(in_ECX + 0x230) + uVar9 * 4);
              if ((iVar13 != 0) && ((*(ushort *)(iVar13 + 2) & 0xfff0) != 0)) break;
              iVar6 = iVar6 + 1;
              uVar7 = uVar7 + 1;
              uVar9 = uVar7;
            } while (uVar7 < *(uint *)(in_ECX + 0x224));
          }
          uVar9 = (iVar6 - uVar8) + local_10;
          if (uVar9 < *(uint *)(in_ECX + 0x224)) {
            local_18 = *(int *)(*(int *)(in_ECX + 0x230) + uVar9 * 4);
            if ((*(int *)(local_18 + 0xc) != 1) ||
               (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + **(int **)(local_18 + 0x10) * 4) + 0x10)
                != 3)) {
              local_18 = 0;
            }
          }
        }
        local_20 = (uint *)(*local_24 & 0xfffff);
        local_40[4] = local_24[1] / (uint)local_20;
        local_28 = 0;
        if (local_40[4] != 0) {
          local_14 = 0;
          puVar10 = local_24;
          do {
            puVar3 = local_24;
            local_40[0] = 0;
            local_40[1] = 0;
            local_40[2] = 0;
            local_40[3] = 0;
            puVar10 = (uint *)(puVar10[2] + local_14);
            iVar6 = *(int *)(in_ECX + 0x14);
            if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                    *(int *)(*(int *)(iVar6 + *puVar10 * 4) + 4) * 4) + 5) & 1) != 0
                ) && (*puVar10 < local_1c)) {
              local_c = (uint *)0x0;
              if (local_20 != (uint *)0x0) {
                local_8 = (uint *)(*local_24 & 0xfff00000);
                do {
                  puVar4 = local_c;
                  if (local_8 != (uint *)0x50000000) {
                    puVar4 = *(uint **)(*(int *)(iVar6 + *(int *)(puVar3[4] + (int)local_c * 4) * 4)
                                       + 0x10);
                  }
                  local_50[(int)puVar4] = (float)*(double *)(*(int *)(iVar6 + *puVar10 * 4) + 0x20);
                  local_40[(int)puVar4] = 1;
                  local_c = (uint *)((int)local_c + 1);
                  puVar10 = puVar10 + 1;
                } while (local_c < local_20);
              }
              iVar13 = local_18;
              if ((local_18 != 0) && (local_c = *(uint **)(local_18 + 4), local_c != (uint *)0x0)) {
                local_8 = *(uint **)(local_18 + 8);
                do {
                  iVar2 = *(int *)(iVar6 + *local_8 * 4);
                  if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar2 + 4) * 4) + 5) &
                       1) != 0) && (*local_8 < local_1c)) {
                    local_40[3] = 1;
                    local_50[3] = (float)*(double *)(iVar2 + 0x20);
                  }
                  local_8 = local_8 + 1;
                  local_c = (uint *)((int)local_c + -1);
                } while (local_c != (uint *)0x0);
              }
              local_c = (uint *)0x0;
              uVar9 = 0;
              do {
                uVar8 = 0;
                if (local_70[(int)local_c] == 0) {
                  local_8 = (uint *)0x1;
                  do {
                    if (((*(int *)((int)local_40 + uVar8) != 0) &&
                        (*(float *)((int)local_50 + uVar8) !=
                         *(float *)((int)local_170 + uVar9 + uVar8))) &&
                       (*(int *)((int)local_f0 + uVar9 + uVar8) != 0)) {
                      local_8 = (uint *)0x0;
                    }
                    uVar8 = uVar8 + 4;
                  } while (uVar8 < 0x10);
                  if (local_8 != (uint *)0x0) break;
                }
                local_c = (uint *)((int)local_c + 1);
                uVar9 = uVar9 + 0x10;
              } while (uVar9 < 0x80);
              if (local_c == (uint *)0x8) goto LAB_100ad1ab;
              uVar9 = 0;
              local_8 = (uint *)0x0;
              do {
                if (local_40[uVar9] != 0) {
                  iVar6 = uVar9 + (int)local_c * 4;
                  pfVar11 = local_50 + uVar9;
                  fVar1 = *pfVar11;
                  local_f0[iVar6] = 1;
                  local_170[iVar6] = fVar1;
                  if ((1.0 < *pfVar11) || (*pfVar11 < -1.0)) {
                    local_8 = (uint *)0x1;
                  }
                }
                uVar9 = uVar9 + 1;
              } while (uVar9 < 4);
              if (local_8 != (uint *)0x0) {
                FUN_1008b13a();
              }
              local_8 = (uint *)0x0;
              uVar9 = local_14;
              if (local_20 != (uint *)0x0) {
                do {
                  puVar10 = local_8;
                  if ((*puVar3 & 0xfff00000) != 0x50000000) {
                    puVar10 = *(uint **)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                 *(int *)(puVar3[4] + (int)local_8 * 4) * 4) + 0x10)
                    ;
                  }
                  iVar6 = FUN_10086139(local_2c,local_c,puVar10,
                                       *(undefined8 *)
                                        (*(int *)(*(int *)(in_ECX + 0x14) +
                                                 *(int *)(uVar9 + puVar3[2]) * 4) + 0x20));
                  *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar6 * 4) + 0x3c) = 0;
                  local_8 = (uint *)((int)local_8 + 1);
                  *(int *)(uVar9 + puVar3[2]) = iVar6;
                  iVar13 = local_18;
                  uVar9 = uVar9 + 4;
                } while (local_8 < local_20);
              }
              if ((iVar13 != 0) && (local_8 = (uint *)0x0, *(int *)(iVar13 + 4) != 0)) {
                do {
                  uVar9 = *(uint *)(*(int *)(iVar13 + 8) + (int)local_8 * 4);
                  iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + uVar9 * 4);
                  if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar6 + 4) * 4) + 5) &
                       1) != 0) && (uVar9 < local_1c)) {
                    uVar5 = FUN_10086139(local_2c,local_c,3,*(undefined8 *)(iVar6 + 0x20));
                    *(undefined4 *)(*(int *)(local_18 + 8) + (int)local_8 * 4) = uVar5;
                  }
                  local_8 = (uint *)((int)local_8 + 1);
                  iVar13 = local_18;
                } while (local_8 < *(uint **)(local_18 + 4));
              }
            }
            local_28 = local_28 + 1;
            local_14 = local_14 + (int)local_20 * 4;
            puVar10 = puVar3;
          } while (local_28 < (uint)local_40[4]);
        }
      }
      uVar9 = *(uint *)(in_ECX + 0x224);
      uVar8 = *(uint *)(in_ECX + 0x220);
      local_10 = local_10 + 1;
    } while (local_10 < uVar8 + uVar9);
  }
  uVar9 = 0;
  if (local_1c != 0) {
    do {
      iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + uVar9 * 4);
      if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar6 + 4) * 4) + 5) & 1) != 0) {
        *(undefined4 *)(iVar6 + 4) = *(undefined4 *)(in_ECX + 0x74);
      }
      uVar9 = uVar9 + 1;
    } while (uVar9 < local_1c);
  }
  return 0;
}


