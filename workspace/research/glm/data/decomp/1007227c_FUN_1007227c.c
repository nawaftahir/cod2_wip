// 1007227c size=3646 FUN_1007227c

/* WARNING: Type propagation algorithm not settling */

int FUN_1007227c(undefined4 param_1,double *param_2,int param_3,double *param_4,uint param_5)

{
  double dVar1;
  uint *puVar2;
  int iVar3;
  undefined *puVar4;
  int *piVar5;
  int *piVar6;
  int in_ECX;
  uint uVar7;
  double *pdVar8;
  undefined4 *puVar9;
  double *pdVar10;
  undefined4 *puVar11;
  int iVar12;
  bool bVar13;
  undefined8 uVar14;
  double local_cc;
  double local_c4;
  double local_bc;
  double local_b4;
  double local_ac;
  double local_a4;
  undefined4 local_9c;
  undefined4 local_98;
  int local_94;
  undefined4 local_90;
  double local_8c;
  void *local_84;
  int local_80 [3];
  undefined4 local_74;
  uint local_70;
  uint local_6c;
  int *local_68;
  int *local_64 [4];
  int local_54;
  int local_50;
  int *local_4c;
  int local_48;
  int local_44;
  int local_40;
  uint local_3c;
  int local_38;
  double *local_34;
  double *local_30;
  undefined4 *local_2c;
  uint local_28;
  undefined4 local_24;
  undefined4 *local_20;
  double *local_1c;
  uint local_18;
  double *local_14;
  int local_10;
  double *local_c;
  double *local_8;
  
  local_80[2] = *(undefined4 *)(in_ECX + 0x30);
  local_74 = *(undefined4 *)(in_ECX + 0x34);
  local_9c = *(undefined4 *)(in_ECX + 0x68);
  local_98 = *(undefined4 *)(in_ECX + 0x6c);
  local_84 = (void *)0x0;
  local_3c = (uint)(param_2 != (double *)0x0);
  local_2c = (undefined4 *)0x0;
  local_20 = (undefined4 *)0x0;
  local_30 = (double *)0x0;
  local_34 = (double *)0x0;
  iVar3 = *(int *)(in_ECX + 8);
  if (*(uint *)(iVar3 + 0x5c) <= *(uint *)(in_ECX + 0x44)) {
    return -0x7fffbffb;
  }
  *(uint *)(in_ECX + 0x44) = *(uint *)(in_ECX + 0x44) + 1;
  local_6c = *(uint *)(iVar3 + 8);
  local_1c = *(double **)(iVar3 + 0xc);
  local_8 = *(double **)(*(int *)(in_ECX + 4) + 0x18);
  local_68 = operator_new((int)local_8 << 2);
  if (((local_68 != (int *)0x0) &&
      (local_2c = operator_new((int)local_8 << 2), local_2c != (undefined4 *)0x0)) &&
     (local_20 = operator_new((int)local_8 << 2), local_20 != (undefined4 *)0x0)) {
    local_14 = (double *)((int)local_8 << 4);
    local_30 = operator_new((uint)local_14);
    if ((local_30 != (double *)0x0) &&
       (local_34 = operator_new((uint)local_14), local_34 != (double *)0x0)) {
      pdVar10 = (double *)0x0;
      if (local_8 != (double *)0x0) {
        param_2 = local_30;
        do {
          iVar3 = *(int *)((int)pdVar10 * 4 + *(int *)(in_ECX + 0x18));
          if ((iVar3 == -1) || (iVar3 = FUN_1006c8ca(iVar3,param_2), iVar3 < 0)) {
            *param_2 = *(double *)(in_ECX + 0xa0);
            param_2[1] = *(double *)(in_ECX + 0xa8);
          }
          iVar3 = *(int *)((int)pdVar10 * 4 + *(int *)(in_ECX + 0x18));
          if ((iVar3 == -1) ||
             (puVar2 = *(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + iVar3 * 4),
             *(uint *)(*(int *)(in_ECX + 8) + 0x74) == puVar2[1])) {
            local_2c[(int)pdVar10] = 0x1f;
          }
          else {
            local_2c[(int)pdVar10] = *puVar2 & 0x1f;
          }
          param_2 = param_2 + 2;
          pdVar10 = (double *)((int)pdVar10 + 1);
        } while (pdVar10 < local_8);
      }
      local_8c = 1.0;
      puVar9 = local_2c;
      puVar11 = local_20;
      for (uVar7 = (uint)local_8 & 0x3fffffff; uVar7 != 0; uVar7 = uVar7 - 1) {
        *puVar11 = *puVar9;
        puVar9 = puVar9 + 1;
        puVar11 = puVar11 + 1;
      }
      for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
        *(undefined1 *)puVar11 = *(undefined1 *)puVar9;
        puVar9 = (undefined4 *)((int)puVar9 + 1);
        puVar11 = (undefined4 *)((int)puVar11 + 1);
      }
      pdVar10 = local_30;
      pdVar8 = local_34;
      for (uVar7 = (uint)local_14 >> 2; uVar7 != 0; uVar7 = uVar7 - 1) {
        *(undefined4 *)pdVar8 = *(undefined4 *)pdVar10;
        pdVar10 = (double *)((int)pdVar10 + 4);
        pdVar8 = (double *)((int)pdVar8 + 4);
      }
      for (uVar7 = (uint)local_14 & 3; uVar7 != 0; uVar7 = uVar7 - 1) {
        *(undefined1 *)pdVar8 = *(undefined1 *)pdVar10;
        pdVar10 = (double *)((int)pdVar10 + 1);
        pdVar8 = (double *)((int)pdVar8 + 1);
      }
      local_24 = *(undefined4 *)(in_ECX + 0x20);
      local_80[0] = -1;
      local_80[1] = 0xffffffff;
      local_10 = 1;
      local_38 = 1;
      local_28 = *(uint *)(*(int *)(in_ECX + 8) + 0x68);
      if (local_28 == 0) {
        local_28 = 0xff;
      }
      local_18 = 0;
      if (local_28 != 0) {
        do {
          *(uint *)(in_ECX + 0x68) = local_18;
          local_70 = local_18 + 1;
          *(uint *)(in_ECX + 0x6c) = local_70;
          if ((param_4 != (double *)0x0) && (local_3c != 0)) {
            iVar3 = FUN_1007a632(param_4,0);
            if (iVar3 < 0) goto LAB_1007305d;
            if (*(int *)(in_ECX + 0x5c) != 0) break;
            if ((*(int *)(in_ECX + 0x50) != 0) || (*(int *)(in_ECX + 0x54) != 0)) goto LAB_1007304d;
          }
          piVar6 = *(int **)(in_ECX + 0x18);
          piVar5 = local_68;
          for (uVar7 = (uint)local_8 & 0x3fffffff; uVar7 != 0; uVar7 = uVar7 - 1) {
            *piVar5 = *piVar6;
            piVar6 = piVar6 + 1;
            piVar5 = piVar5 + 1;
          }
          for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
            *(char *)piVar5 = (char)*piVar6;
            piVar6 = (int *)((int)piVar6 + 1);
            piVar5 = (int *)((int)piVar5 + 1);
          }
          param_2 = (double *)0xffffffff;
          if (param_3 != 0) {
            param_2 = (double *)0xffffffff;
            iVar3 = FUN_1007b5eb(param_3,&param_2,0);
            if ((iVar3 < 0) ||
               (iVar3 = FUN_1006e308(param_3,0x20500001,&local_24,&local_24,&param_2,0x17),
               iVar3 < 0)) goto LAB_1007305d;
            if (*(int *)(in_ECX + 0x5c) != 0) break;
            if ((*(int *)(in_ECX + 0x50) != 0) || (*(int *)(in_ECX + 0x54) != 0)) goto LAB_1007304d;
          }
          iVar3 = FUN_1006e16c(local_24,&local_8c);
          if ((iVar3 < 0) || (local_8c == 0.0)) {
            local_c = (double *)0x0;
            if (local_8 != (double *)0x0) {
              pdVar10 = (double *)(param_5 - (int)local_20);
              pdVar8 = local_34;
              local_14 = pdVar10;
              do {
                puVar2 = local_20 + (int)local_c;
                iVar3 = *(int *)(*(int *)(in_ECX + 0x18) + (int)local_c * 4);
                if (*(int *)((int)puVar2 + (int)pdVar10) != iVar3) {
                  if ((*(double *)(in_ECX + 0xa8) < *pdVar8) ||
                     (pdVar8[1] < *(double *)(in_ECX + 0xa0))) {
                    iVar3 = FUN_1006c8ca(iVar3,&local_bc);
                    if (iVar3 < 0) {
                      *pdVar8 = *(double *)(in_ECX + 0xa0);
                      dVar1 = *(double *)(in_ECX + 0xa8);
                    }
                    else {
                      if (local_bc < *pdVar8) {
                        *pdVar8 = local_bc;
                      }
                      dVar1 = local_b4;
                      if (local_b4 <= pdVar8[1]) goto LAB_1007266a;
                    }
                    pdVar8[1] = dVar1;
                  }
LAB_1007266a:
                  *puVar2 = *puVar2 & **(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) +
                                                 *(int *)(*(int *)(in_ECX + 0x18) + (int)local_c * 4
                                                         ) * 4);
                  pdVar10 = local_14;
                }
                local_c = (double *)((int)local_c + 1);
                pdVar8 = pdVar8 + 2;
              } while (local_c < local_8);
            }
          }
          else {
            pdVar10 = (double *)0x0;
            if (local_8 != (double *)0x0) {
              pdVar8 = (double *)(param_5 - (int)local_20);
              local_c = local_34;
              local_14 = pdVar8;
              do {
                puVar9 = local_20 + (int)pdVar10;
                iVar3 = *(int *)(*(int *)(in_ECX + 0x18) + (int)pdVar10 * 4);
                if (*(int *)((int)puVar9 + (int)pdVar8) != iVar3) {
                  iVar3 = FUN_1006c8ca(iVar3,local_c);
                  if (iVar3 < 0) {
                    *local_c = *(double *)(in_ECX + 0xa0);
                    local_c[1] = *(double *)(in_ECX + 0xa8);
                  }
                  *puVar9 = **(undefined4 **)
                              (*(int *)(*(int *)(in_ECX + 8) + 0x14) +
                              *(int *)(*(int *)(in_ECX + 0x18) + (int)pdVar10 * 4) * 4);
                  pdVar8 = local_14;
                }
                local_c = local_c + 2;
                pdVar10 = (double *)((int)pdVar10 + 1);
              } while (pdVar10 < local_8);
            }
          }
          if (param_2 != (double *)0xffffffff) {
            iVar3 = FUN_1006c8ca(param_2,&local_cc);
            if (-1 < iVar3) {
              if ((local_cc == 0.0) && (local_c4 == 0.0)) break;
              if ((local_cc <= 0.0) && (!NAN(local_c4) && 0.0 < local_c4 != (local_c4 == 0.0))) {
                local_10 = 0;
              }
            }
            *(undefined8 *)
             (*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + (int)param_2 * 4) + 0x20) =
                 0x3ff0000000000000;
            *(undefined8 *)
             (*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + (int)param_2 * 4) + 0x28) =
                 0x3ff0000000000000;
          }
          if (local_8 != (double *)0x0) {
            iVar3 = param_5 - (int)local_68;
            local_c = (double *)((int)local_2c - (int)local_68);
            local_14 = local_8;
            pdVar10 = local_30;
            piVar6 = local_68;
            local_94 = iVar3;
            do {
              if (*(int *)(iVar3 + (int)piVar6) != *piVar6) {
                if ((*(double *)(in_ECX + 0xa8) < *pdVar10) ||
                   (pdVar10[1] < *(double *)(in_ECX + 0xa0))) {
                  iVar3 = FUN_1006c8ca(*piVar6,&local_ac);
                  if (iVar3 < 0) {
                    *pdVar10 = *(double *)(in_ECX + 0xa0);
                    dVar1 = *(double *)(in_ECX + 0xa8);
                  }
                  else {
                    if (local_ac < *pdVar10) {
                      *pdVar10 = local_ac;
                    }
                    dVar1 = local_a4;
                    if (local_a4 <= pdVar10[1]) goto LAB_100727cd;
                  }
                  pdVar10[1] = dVar1;
                }
LAB_100727cd:
                *(uint *)((int)local_c + (int)piVar6) =
                     *(uint *)((int)local_c + (int)piVar6) &
                     **(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *piVar6 * 4);
                iVar3 = local_94;
              }
              pdVar10 = pdVar10 + 2;
              piVar6 = piVar6 + 1;
              local_14 = (double *)((int)local_14 + -1);
            } while (local_14 != (double *)0x0);
          }
          if (local_38 != 0) {
            if ((local_10 == 0) &&
               (iVar3 = FUN_10071188(param_2,local_18,local_80,local_80 + 1), iVar3 != 0)) {
              local_38 = 1;
            }
            else {
              local_38 = 0;
            }
          }
          if ((param_4 != (double *)0x0) && (local_3c == 0)) {
            iVar3 = FUN_1007a632(param_4,0);
            if (iVar3 < 0) goto LAB_1007305d;
            if (*(int *)(in_ECX + 0x5c) != 0) break;
            if ((*(int *)(in_ECX + 0x50) != 0) || (*(int *)(in_ECX + 0x54) != 0)) goto LAB_1007304d;
          }
          local_18 = local_70;
        } while (local_70 < local_28);
        pdVar10 = local_1c;
        if (1 < local_18) {
          if (local_18 < local_28) {
            if ((*(int *)(in_ECX + 0x60) != 0) || ((*(byte *)(in_ECX + 0x15) & 2) != 0))
            goto LAB_1007304d;
            if (*(int *)(in_ECX + 0x5c) == 0) {
              local_38 = 0;
            }
          }
          if ((local_10 == 0) && (local_38 == 0)) {
            if ((*(byte *)(*(int *)(in_ECX + 8) + 0x70) & 4) == 0) goto LAB_1007304d;
            pdVar8 = local_1c;
            if (local_1c < *(double **)(*(int *)(in_ECX + 8) + 0xc)) {
              do {
                iVar3 = FUN_1008576b();
                if (iVar3 != 0) goto LAB_1007304d;
                pdVar8 = (double *)((int)pdVar8 + 1);
              } while (pdVar8 < *(double **)(*(int *)(in_ECX + 8) + 0xc));
            }
          }
          if (*(int *)(in_ECX + 0x5c) != 0) {
            local_18 = local_28;
            *(undefined4 *)(in_ECX + 0x5c) = 0;
          }
          if (((local_18 != local_28) || (iVar3 = FUN_1006e16c(local_24,&local_8c), iVar3 < 0)) ||
             (local_8c == 0.0)) {
            if (((local_18 < local_28) && (local_10 != 0)) && ((*(byte *)(in_ECX + 0x15) & 4) == 0))
            {
              pdVar8 = *(double **)(*(int *)(in_ECX + 8) + 0xc);
              if (pdVar10 < pdVar8) {
                puVar9 = (undefined4 *)(*(int *)(*(int *)(in_ECX + 8) + 0x18) + (int)pdVar10 * 4);
                do {
                  puVar4 = (undefined *)(*(uint *)*puVar9 & 0xfff00000);
                  if (puVar4 < (undefined *)0x20100001) {
                    if (((((puVar4 != (undefined *)0x20100000) && (puVar4 != (undefined *)0x0)) &&
                         (puVar4 != (undefined *)0x10000000)) &&
                        ((puVar4 != (undefined *)0x10100000 && (puVar4 != &DAT_10200000)))) &&
                       (puVar4 != &DAT_10400000)) {
                      bVar13 = puVar4 == (undefined *)0x20000000;
LAB_100729bf:
                      if (!bVar13) break;
                    }
                  }
                  else if (((puVar4 != (undefined *)0x20200000) &&
                           (puVar4 != (undefined *)0x20300000)) &&
                          ((puVar4 != (undefined *)0x20400000 && (puVar4 != (undefined *)0x20500000)
                           ))) {
                    bVar13 = puVar4 == (undefined *)0x30000000;
                    goto LAB_100729bf;
                  }
                  pdVar10 = (double *)((int)pdVar10 + 1);
                  puVar9 = puVar9 + 1;
                } while (pdVar10 < *(double **)(*(int *)(in_ECX + 8) + 0xc));
              }
              if (pdVar10 == pdVar8) goto LAB_1007304d;
            }
            pdVar10 = (double *)0x0;
            iVar12 = 0;
            if (local_8 != (double *)0x0) {
              do {
                iVar3 = *(int *)(param_5 + (int)pdVar10 * 4);
                if ((iVar3 != -1) && (*(int *)(*(int *)(in_ECX + 0x18) + (int)pdVar10 * 4) != iVar3)
                   ) {
                  iVar12 = iVar12 + 1;
                }
                pdVar10 = (double *)((int)pdVar10 + 1);
              } while (pdVar10 < local_8);
            }
            local_84 = operator_new(iVar12 * 0x24);
            if (local_84 == (void *)0x0) goto LAB_10073058;
            uVar14 = FUN_1006c566(local_84,iVar12 * 9);
            piVar6 = (int *)((ulonglong)uVar14 >> 0x20);
            iVar3 = (int)uVar14;
            if (iVar3 < 0) goto LAB_1007305d;
            uVar7 = 0;
            do {
              local_64[uVar7] = piVar6;
              uVar7 = uVar7 + 1;
              piVar6 = piVar6 + iVar12;
            } while (uVar7 < 9);
            param_2 = (double *)0x0;
            local_c = (double *)0x0;
            if (local_8 != (double *)0x0) {
              local_10 = (int)local_64[0] - (int)local_64[2];
              local_14 = (double *)((int)local_64[2] - (int)local_64[1]);
              piVar6 = local_64[1];
              do {
                piVar5 = (int *)(param_5 + (int)local_c * 4);
                if ((*piVar5 != -1) &&
                   (*(int *)((int)local_c * 4 + *(int *)(in_ECX + 0x18)) != *piVar5)) {
                  *(double **)((int)local_14 + (int)piVar6 + local_10) = local_c;
                  *piVar6 = *piVar5;
                  *(int *)((int)local_14 + (int)piVar6) = *piVar5;
                  if ((*piVar5 == -1) ||
                     (*(int *)(*(int *)(in_ECX + 8) + 0x74) ==
                      *(int *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *piVar5 * 4) + 4)))
                  {
                    *piVar6 = *(int *)(in_ECX + 0x24);
                  }
                  param_2 = (double *)((int)param_2 + 1);
                  piVar6 = piVar6 + 1;
                }
                local_c = (double *)((int)local_c + 1);
              } while (local_c < local_8);
            }
            FUN_1006e26a(local_6c,local_1c,param_5);
            param_5 = local_18;
            dVar1 = (double)(int)local_18;
            *(undefined4 *)(in_ECX + 0x68) = 0;
            *(uint *)(in_ECX + 0x6c) = local_18;
            if ((int)local_18 < 0) {
              dVar1 = dVar1 + 4294967296.0;
            }
            local_90 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,dVar1);
            local_40 = -1;
            iVar3 = FUN_1006e308(param_1,0x11100001,&local_40,&local_90,0,0);
            if (iVar3 < 0) goto LAB_1007305d;
            *(undefined4 *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + local_40 * 4) + 4) =
                 *(undefined4 *)(*(int *)(in_ECX + 8) + 0xa4);
            *(int *)(in_ECX + 0x30) = local_40;
            param_5 = (uint)param_2 & 0xfffff;
            *(undefined4 *)(in_ECX + 0x34) = 1;
            iVar3 = FUN_1006e308(param_1,param_5 | 0x11200000,local_64[2],local_64[1],0,0);
            if ((iVar3 < 0) ||
               (iVar3 = FUN_1006e308(param_1,param_5 | 0x11300000,local_44,local_64[2],0,0),
               iVar3 < 0)) goto LAB_1007305d;
            if (param_2 != (double *)0x0) {
              local_10 = (int)local_64[0] - (int)local_64[2];
              local_70 = local_44 - (int)local_64[2];
              local_1c = param_2;
              piVar6 = local_64[2];
              do {
                puVar2 = *(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *piVar6 * 4);
                pdVar10 = local_30 + *(int *)(local_10 + (int)piVar6) * 2;
                if (*pdVar10 < pdVar10[1] != (*pdVar10 == pdVar10[1])) {
                  *(double *)(puVar2 + 8) = *pdVar10;
                  dVar1 = pdVar10[1];
                  *(byte *)((int)puVar2 + 1) = *(byte *)((int)puVar2 + 1) | 1;
                  local_6c = *puVar2;
                  *(double *)(puVar2 + 10) = dVar1;
                  if (*pdVar10 == pdVar10[1]) {
                    *puVar2 = local_6c | 0x80;
                  }
                }
                *puVar2 = *puVar2 | local_2c[*(int *)(local_10 + (int)piVar6)];
                *(undefined4 *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *piVar6 * 4) + 4) =
                     *(undefined4 *)(*(int *)(in_ECX + 8) + 0x98);
                piVar5 = (int *)(local_70 + (int)piVar6);
                piVar6 = piVar6 + 1;
                local_1c = (double *)((int)local_1c + -1);
                *(undefined4 *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *piVar5 * 4) + 4) =
                     *(undefined4 *)(*(int *)(in_ECX + 8) + 0xac);
              } while (local_1c != (double *)0x0);
            }
            if (((param_4 != (double *)0x0) && (local_3c != 0)) &&
               (iVar3 = FUN_1007a632(param_4,0), iVar3 < 0)) goto LAB_1007305d;
            local_24 = 0xffffffff;
            iVar3 = FUN_1007b5eb(param_3,&local_24,0);
            if (iVar3 < 0) goto LAB_1007305d;
            if (param_2 != (double *)0x0) {
              local_1c = param_2;
              piVar6 = local_64[2];
              do {
                *piVar6 = *(int *)(*(int *)(in_ECX + 0x18) +
                                  *(int *)(((int)local_64[0] - (int)local_64[2]) + (int)piVar6) * 4)
                ;
                piVar6 = piVar6 + 1;
                local_1c = (double *)((int)local_1c + -1);
              } while (local_1c != (double *)0x0);
            }
            iVar3 = FUN_1006c8ca(local_24,&local_ac);
            if ((iVar3 < 0) || ((local_ac <= 0.0 && (0.0 <= local_a4)))) {
              if ((local_18 < local_28) && ((*(byte *)(*(int *)(in_ECX + 8) + 0x70) & 4) == 0))
              goto LAB_1007304d;
              local_10 = -1;
              iVar3 = FUN_1006e308(param_1,0x11400001,&local_10,&local_24,0,0);
              if (iVar3 < 0) goto LAB_1007305d;
              *(undefined4 *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + local_10 * 4) + 4) =
                   *(undefined4 *)(*(int *)(in_ECX + 8) + 0xa0);
              *(int *)(in_ECX + 0x30) = local_10;
              *(undefined4 *)(in_ECX + 0x34) = 1;
              if (((param_4 != (double *)0x0) && (local_3c == 0)) &&
                 (iVar3 = FUN_1007a632(param_4,0), iVar3 < 0)) goto LAB_1007305d;
              if (param_2 != (double *)0x0) {
                param_4 = param_2;
                piVar6 = local_64[3];
                do {
                  *piVar6 = *(undefined4 *)
                             (*(int *)(in_ECX + 0x18) +
                             *(int *)(((int)local_64[0] - (int)local_64[3]) + (int)piVar6) * 4);
                  piVar6 = piVar6 + 1;
                  param_4 = (double *)((int)param_4 + -1);
                } while (param_4 != (double *)0x0);
              }
              param_4 = (double *)(param_5 | 0x10000000);
              iVar3 = FUN_1006e308(param_1,param_4,local_54,local_64[3],0,0);
              if (iVar3 < 0) goto LAB_1007305d;
              pdVar10 = (double *)0x0;
              if (param_2 != (double *)0x0) {
                do {
                  iVar3 = (int)pdVar10 * 4;
                  pdVar10 = (double *)((int)pdVar10 + 1);
                  *(undefined4 *)
                   (*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *(int *)(local_54 + iVar3) * 4)
                   + 4) = *(undefined4 *)(*(int *)(in_ECX + 8) + 0x98);
                } while (pdVar10 < param_2);
              }
              *(int *)(in_ECX + 0x30) = local_10;
              *(undefined4 *)(in_ECX + 0x34) = 0;
              iVar3 = FUN_1006e308(param_1,param_4,local_50,local_64[2],0,0);
              if (iVar3 < 0) goto LAB_1007305d;
              pdVar10 = (double *)0x0;
              if (param_2 != (double *)0x0) {
                do {
                  iVar3 = (int)pdVar10 * 4;
                  pdVar10 = (double *)((int)pdVar10 + 1);
                  *(undefined4 *)
                   (*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *(int *)(local_50 + iVar3) * 4)
                   + 4) = *(undefined4 *)(*(int *)(in_ECX + 8) + 0x98);
                } while (pdVar10 < param_2);
              }
              *(int *)(in_ECX + 0x30) = local_40;
              *(undefined4 *)(in_ECX + 0x34) = 1;
              iVar3 = FUN_1006e308(param_1,param_5 | 0x20800000,local_4c,local_54,local_50,0);
              if (iVar3 < 0) goto LAB_1007305d;
              pdVar10 = (double *)0x0;
              if (param_2 != (double *)0x0) {
                do {
                  piVar6 = local_4c + (int)pdVar10;
                  pdVar10 = (double *)((int)pdVar10 + 1);
                  *(undefined4 *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *piVar6 * 4) + 4)
                       = *(undefined4 *)(*(int *)(in_ECX + 8) + 0x98);
                } while (pdVar10 < param_2);
              }
            }
            else {
              if (((param_4 != (double *)0x0) && (local_3c == 0)) &&
                 (iVar3 = FUN_1007a632(param_4,0), iVar3 < 0)) goto LAB_1007305d;
              if (param_2 != (double *)0x0) {
                param_4 = param_2;
                piVar6 = local_4c;
                do {
                  iVar3 = *(int *)(*(int *)(in_ECX + 0x18) +
                                  *(int *)(((int)local_64[0] - (int)local_4c) + (int)piVar6) * 4);
                  *piVar6 = iVar3;
                  if (iVar3 == -1) {
                    *piVar6 = *(int *)(in_ECX + 0x24);
                  }
                  piVar6 = piVar6 + 1;
                  param_4 = (double *)((int)param_4 + -1);
                } while (param_4 != (double *)0x0);
                param_4 = (double *)0x0;
              }
            }
            iVar3 = FUN_1006e308(param_1,param_5 | 0x10000000,local_4c,local_4c,0,0);
            if (iVar3 < 0) goto LAB_1007305d;
            pdVar10 = (double *)0x0;
            if (param_2 != (double *)0x0) {
              do {
                piVar6 = local_4c + (int)pdVar10;
                pdVar10 = (double *)((int)pdVar10 + 1);
                *(undefined4 *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *piVar6 * 4) + 4) =
                     *(undefined4 *)(*(int *)(in_ECX + 8) + 0x98);
              } while (pdVar10 < param_2);
            }
            iVar3 = FUN_1006e308(param_1,param_5 | 0x20900000,local_48,local_4c,local_44,0);
            if (iVar3 < 0) goto LAB_1007305d;
            pdVar10 = (double *)0x0;
            if (param_2 != (double *)0x0) {
              do {
                iVar3 = (int)pdVar10 * 4;
                pdVar10 = (double *)((int)pdVar10 + 1);
                *(undefined4 *)
                 (*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *(int *)(local_48 + iVar3) * 4) +
                 4) = *(undefined4 *)(*(int *)(in_ECX + 8) + 0x98);
              } while (pdVar10 < param_2);
            }
            *(int *)(in_ECX + 0x30) = local_80[2];
            *(undefined4 *)(in_ECX + 0x34) = local_74;
            iVar3 = FUN_1006e308(param_1,param_5 | 0x11500000,local_64[2],local_48,0,0);
            if (iVar3 < 0) goto LAB_1007305d;
            if (param_2 != (double *)0x0) {
              iVar3 = (int)local_64[2] - (int)local_64[0];
              param_4 = param_2;
              do {
                puVar2 = *(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) +
                                   *(int *)(iVar3 + (int)local_64[0]) * 4);
                pdVar10 = local_34 + *local_64[0] * 2;
                if (*pdVar10 < pdVar10[1] != (*pdVar10 == pdVar10[1])) {
                  *(double *)(puVar2 + 8) = *pdVar10;
                  dVar1 = pdVar10[1];
                  *(byte *)((int)puVar2 + 1) = *(byte *)((int)puVar2 + 1) | 1;
                  param_5 = *puVar2;
                  *(double *)(puVar2 + 10) = dVar1;
                  if (*pdVar10 == pdVar10[1]) {
                    *puVar2 = param_5 | 0x80;
                  }
                }
                *puVar2 = *puVar2 | local_20[*local_64[0]];
                local_64[0] = local_64[0] + 1;
                param_4 = (double *)((int)param_4 + -1);
              } while (param_4 != (double *)0x0);
            }
            if (((local_18 == 0) || (local_38 == 0)) ||
               ((*(int *)(in_ECX + 0x50) != 0 ||
                ((*(int *)(in_ECX + 0x54) != 0 ||
                 (iVar3 = FUN_1006e308(param_3,0x10000001,*(int *)(in_ECX + 0x18) + local_80[0] * 4,
                                       local_80 + 1,0,0), -1 < iVar3)))))) {
              iVar3 = 0;
              goto LAB_1007305d;
            }
          }
        }
      }
LAB_1007304d:
      iVar3 = -0x7fffbffb;
      goto LAB_1007305d;
    }
  }
LAB_10073058:
  iVar3 = -0x7ff8fff2;
LAB_1007305d:
  _free(local_68);
  _free(local_2c);
  _free(local_20);
  _free(local_30);
  _free(local_34);
  _free(local_84);
  *(int *)(in_ECX + 0x30) = local_80[2];
  *(undefined4 *)(in_ECX + 0x34) = local_74;
  *(undefined4 *)(in_ECX + 0x68) = local_9c;
  *(int *)(in_ECX + 0x44) = *(int *)(in_ECX + 0x44) + -1;
  *(undefined4 *)(in_ECX + 0x6c) = local_98;
  return iVar3;
}


