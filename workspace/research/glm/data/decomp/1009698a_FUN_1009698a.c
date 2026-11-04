// 1009698a size=1462 FUN_1009698a

undefined4 FUN_1009698a(void)

{
  undefined4 *puVar1;
  uint *puVar2;
  int *piVar3;
  bool bVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  int in_ECX;
  uint uVar8;
  int *piVar9;
  undefined4 uVar10;
  int *piVar11;
  int local_1c;
  uint local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  int *local_8;
  
  uVar8 = 0;
  bVar4 = false;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + uVar8 * 4);
      iVar6 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar7 + 4) * 4);
      *(undefined4 *)(iVar7 + 0x30) = *(undefined4 *)(iVar7 + 0x14);
      *(undefined4 *)(iVar7 + 0x40) = *(undefined4 *)(iVar7 + 0x18);
      uVar5 = *(uint *)(iVar6 + 4);
      if ((uVar5 & 0x10) == 0) {
        if ((uVar5 & 0x11028) == 0) {
          *(undefined4 *)(iVar7 + 0x18) = 0;
          goto LAB_100969dd;
        }
      }
      else {
        *(undefined4 *)(iVar7 + 0x18) = 1;
LAB_100969dd:
        *(undefined4 *)(iVar7 + 0x14) = 0xffffffff;
      }
      uVar8 = uVar8 + 1;
    } while (uVar8 < *(uint *)(in_ECX + 8));
  }
  local_10 = *(uint *)(in_ECX + 0xc);
  while (local_10 != 0) {
    local_10 = local_10 - 1;
    puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + local_10 * 4);
    if ((*puVar2 & 0xfff00000) != 0) {
      uVar8 = 1;
      if (1 < puVar2[3]) {
        do {
          FUN_1008d884(*(undefined4 *)(*(int *)(in_ECX + 0x14) + *(int *)puVar2[4] * 4),
                       *(undefined4 *)(*(int *)(in_ECX + 0x14) + ((int *)puVar2[4])[uVar8] * 4));
          uVar8 = uVar8 + 1;
        } while (uVar8 < puVar2[3]);
      }
      local_8 = (int *)0x1;
      if (1 < puVar2[3]) {
        do {
          piVar9 = (int *)((int)local_8 + 1);
          *(undefined4 *)
           (*(int *)(*(int *)(in_ECX + 0x14) + ((int *)puVar2[4])[(int)local_8] * 4) + 0x14) =
               *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar2[4] * 4) + 0x14);
          *(undefined4 *)
           (*(int *)(*(int *)(in_ECX + 0x14) + ((int *)puVar2[4])[(int)local_8] * 4) + 0x18) =
               *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar2[4] * 4) + 0x18);
          local_8 = piVar9;
        } while (piVar9 < (int *)puVar2[3]);
      }
      uVar8 = *puVar2;
      uVar5 = uVar8 & 0xfff00000;
      if (((uVar5 == 0x20700000) || (uVar5 == 0x20800000)) || (uVar5 == 0x11500000)) {
        local_c = 0;
        if (puVar2[3] != 0) {
          do {
            iVar7 = *(int *)(in_ECX + 0x14);
            iVar6 = local_c * 4;
            local_c = local_c + 1;
            *(undefined4 *)(*(int *)(iVar7 + *(int *)(iVar6 + puVar2[4]) * 4) + 0x14) =
                 *(undefined4 *)
                  (*(int *)(iVar7 + *(int *)(*(int *)(iVar7 + *(int *)(iVar6 + puVar2[2]) * 4) +
                                            0x14) * 4) + 0x14);
            iVar7 = *(int *)(in_ECX + 0x14);
            *(undefined4 *)(*(int *)(iVar7 + *(int *)(iVar6 + puVar2[4]) * 4) + 0x18) =
                 *(undefined4 *)
                  (*(int *)(iVar7 + *(int *)(*(int *)(iVar7 + *(int *)(iVar6 + puVar2[2]) * 4) +
                                            0x14) * 4) + 0x18);
          } while (local_c < puVar2[3]);
        }
      }
      else if (uVar5 == 0x11200000) {
        local_14 = puVar2[1] / (uVar8 & 0xfffff);
        local_8 = (int *)0x0;
        if (puVar2[3] != 0) {
          do {
            local_c = 0;
            if (local_14 != 0) {
              do {
                for (iVar7 = *(int *)(puVar2[2] + (int)(puVar2[3] * local_c + (int)local_8) * 4);
                    iVar7 != -1; iVar7 = *(int *)(*(int *)(iVar7 * 4 + *(int *)(in_ECX + 0x14)) + 8)
                    ) {
                  iVar6 = *(int *)(in_ECX + 0x14);
                  FUN_1008d884(*(undefined4 *)(iVar7 * 4 + iVar6),
                               *(undefined4 *)
                                (iVar6 + *(int *)(*(int *)(iVar6 + *(int *)(puVar2[4] +
                                                                           (int)local_8 * 4) * 4) +
                                                 0x14) * 4));
                }
                local_c = local_c + 1;
              } while (local_c < local_14);
            }
            local_8 = (int *)((int)local_8 + 1);
          } while (local_8 < (int *)puVar2[3]);
        }
      }
      else if (((uVar8 & 0xf0000000) < 0x10000000) || (0x40000000 < (uVar8 & 0xf0000000))) {
        if (puVar2[3] == 0) {
          uVar8 = 0;
          if (puVar2[1] != 0) {
            do {
              *(undefined4 *)
               (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar2[2] + uVar8 * 4) * 4) + 0x14) =
                   0xffffffff;
              iVar7 = uVar8 * 4;
              uVar8 = uVar8 + 1;
              *(undefined4 *)
               (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar2[2] + iVar7) * 4) + 0x18) = 1;
            } while (uVar8 < puVar2[1]);
          }
        }
        else {
          local_c = 0;
          if (puVar2[1] != 0) {
            do {
              for (iVar7 = *(int *)(puVar2[2] + local_c * 4); iVar7 != -1;
                  iVar7 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar7 * 4) + 8)) {
                FUN_1008d884(*(undefined4 *)(iVar7 * 4 + *(int *)(in_ECX + 0x14)),
                             *(undefined4 *)(*(int *)(in_ECX + 0x14) + *(int *)puVar2[4] * 4));
              }
              local_c = local_c + 1;
            } while (local_c < puVar2[1]);
          }
        }
      }
      else {
        local_14 = puVar2[1] / (uVar8 & 0xfffff);
        local_8 = (int *)0x0;
        if (puVar2[3] != 0) {
          do {
            local_c = 0;
            if (local_14 != 0) {
              do {
                for (iVar7 = *(int *)(puVar2[2] + (int)(puVar2[3] * local_c + (int)local_8) * 4);
                    iVar7 != -1; iVar7 = *(int *)(*(int *)(iVar7 * 4 + *(int *)(in_ECX + 0x14)) + 8)
                    ) {
                  FUN_1008d884(*(undefined4 *)(iVar7 * 4 + *(int *)(in_ECX + 0x14)),
                               *(undefined4 *)
                                (*(int *)(in_ECX + 0x14) +
                                *(int *)(puVar2[4] + (int)local_8 * 4) * 4));
                }
                local_c = local_c + 1;
              } while (local_c < local_14);
            }
            local_8 = (int *)((int)local_8 + 1);
          } while (local_8 < (int *)puVar2[3]);
        }
      }
    }
  }
  FUN_10085bf1();
  local_c = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
      uVar8 = *puVar2 & 0xfff00000;
      if (((((uVar8 != 0) && (uVar8 != 0x10f00000)) &&
           ((uVar8 != 0x20700000 &&
            ((((uVar8 != 0x11100000 && (uVar8 != 0x11200000)) && (uVar8 != 0x11300000)) &&
             ((uVar8 != 0x11400000 && (uVar8 != 0x20800000)))))))) && (uVar8 != 0x20900000)) &&
         (uVar8 != 0x11500000)) {
        iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar2[4] * 4);
        if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar7 + 4) * 4) + 5) & 0x10) == 0
           ) {
          local_18 = 0;
          local_10 = 0;
          FUN_10086e7d(*(int *)puVar2[4],&local_18);
          for (iVar6 = iVar7; iVar6 = *(int *)(iVar6 + 8), iVar6 != -1;
              iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + iVar6 * 4)) {
            FUN_10086e7d(iVar6,&local_10);
          }
          if (puVar2[1] != 0) {
            local_8 = (int *)puVar2[2];
            local_14 = puVar2[1];
            do {
              for (iVar6 = *local_8; iVar6 != -1;
                  iVar6 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar6 * 4) + 8)) {
                FUN_10086e7d(iVar6,&local_10);
              }
              local_8 = local_8 + 1;
              local_14 = local_14 - 1;
            } while (local_14 != 0);
          }
          iVar7 = *(int *)(iVar7 + 0x14);
          if (local_10 < local_18) {
            local_18 = local_18 - local_10;
            do {
              iVar7 = iVar7 * 4;
              if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                      *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar7) + 4) * 4) +
                             5) & 0x80) != 0) && (local_8 = (int *)0x0, puVar2[3] != 0)) {
                do {
                  piVar9 = (int *)((int)local_8 + 1);
                  *(undefined4 *)
                   (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar2[4] + (int)local_8 * 4) * 4) +
                   0x18) = *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar7) + 0x18);
                  *(undefined4 *)
                   (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar2[4] + (int)local_8 * 4) * 4) +
                   0x14) = *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar7) + 0x14);
                  local_8 = piVar9;
                } while (piVar9 < (int *)puVar2[3]);
              }
              local_18 = local_18 - 1;
              iVar7 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar7) + 0x14);
            } while (local_18 != 0);
          }
        }
      }
      local_c = local_c + 1;
    } while (local_c < *(uint *)(in_ECX + 0xc));
  }
  iVar7 = *(int *)(in_ECX + 8);
  if (iVar7 != 0) {
    piVar9 = *(int **)(in_ECX + 0x14);
    do {
      iVar6 = *piVar9;
      if ((*(int *)(iVar6 + 0x30) != *(int *)(iVar6 + 0x14)) ||
         (*(int *)(iVar6 + 0x40) != *(int *)(iVar6 + 0x18))) {
        bVar4 = true;
      }
      piVar9 = piVar9 + 1;
      iVar7 = iVar7 + -1;
    } while (iVar7 != 0);
    if (bVar4) {
      FUN_1008a979();
      piVar9 = *(int **)(in_ECX + 0xc);
      while (piVar9 != (int *)0x0) {
        piVar9 = (int *)((int)piVar9 - 1);
        iVar7 = *(int *)(*(int *)(in_ECX + 0x18) + (int)piVar9 * 4);
        if (((*(ushort *)(iVar7 + 2) & 0xfff0) != 0) &&
           (local_1c = *(int *)(iVar7 + 0xc), local_8 = piVar9, local_1c != 0)) {
          piVar11 = *(int **)(iVar7 + 0x10);
          do {
            iVar6 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar11 * 4) + 0x14);
            if ((iVar6 != -1) &&
               (piVar3 = *(int **)(*(int *)(*(int *)(in_ECX + 0x14) + iVar6 * 4) + 0x48),
               local_8 < piVar3)) {
              local_8 = piVar3;
            }
            piVar11 = piVar11 + 1;
            local_1c = local_1c + -1;
          } while (local_1c != 0);
          piVar11 = piVar9;
          if (piVar9 != local_8) {
            for (; piVar11 < local_8; piVar11 = (int *)((int)piVar11 + 1)) {
              puVar1 = (undefined4 *)(*(int *)(in_ECX + 0x18) + (int)piVar11 * 4);
              *puVar1 = puVar1[1];
            }
            *(int *)(*(int *)(in_ECX + 0x18) + (int)local_8 * 4) = iVar7;
            FUN_1008a979();
          }
        }
      }
      uVar10 = 0;
      goto LAB_10096f2e;
    }
  }
  uVar10 = 1;
LAB_10096f2e:
  FUN_10085bf4();
  return uVar10;
}


