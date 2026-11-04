// 100730ba size=1688 FUN_100730ba

/* WARNING: Type propagation algorithm not settling */

int FUN_100730ba(undefined4 param_1,double *param_2,int param_3,int param_4,int *param_5)

{
  uint *puVar1;
  uint *puVar2;
  int iVar3;
  int iVar4;
  int in_ECX;
  double *pdVar5;
  uint uVar6;
  undefined4 *puVar7;
  int *piVar8;
  double *pdVar9;
  undefined4 *puVar10;
  int *piVar11;
  double local_80;
  double local_78;
  double local_70;
  double local_68;
  undefined4 local_60;
  undefined4 local_5c;
  undefined4 local_58;
  uint local_54;
  int *local_50;
  int local_4c [2];
  int *local_44;
  undefined4 local_40;
  undefined4 local_3c;
  int local_38;
  int local_34;
  undefined4 local_30;
  double *local_2c;
  undefined4 *local_28;
  double *local_24;
  int *local_20;
  uint local_1c;
  int *local_18;
  double *local_14;
  uint local_10;
  undefined4 *local_c;
  int *local_8;
  
  local_60 = *(undefined4 *)(in_ECX + 0x58);
  local_3c = *(undefined4 *)(in_ECX + 0x5c);
  local_50 = *(int **)(in_ECX + 0x18);
  piVar8 = *(int **)(*(int *)(in_ECX + 4) + 0x18);
  local_10 = (int)piVar8 << 2;
  local_20 = (int *)0x0;
  local_14 = (double *)0x0;
  local_24 = (double *)0x0;
  local_c = (undefined4 *)0x0;
  local_28 = (undefined4 *)0x0;
  local_18 = piVar8;
  local_8 = operator_new(local_10);
  if ((local_8 != (int *)0x0) && (local_20 = operator_new(local_10), local_20 != (int *)0x0)) {
    uVar6 = (int)piVar8 << 4;
    local_54 = uVar6;
    local_14 = operator_new(uVar6);
    if ((local_14 != (double *)0x0) &&
       (((local_24 = operator_new(uVar6), local_24 != (double *)0x0 &&
         (local_c = operator_new(local_10), local_c != (undefined4 *)0x0)) &&
        (local_28 = operator_new(local_10), local_28 != (undefined4 *)0x0)))) {
      *(undefined4 *)(in_ECX + 0x5c) = 0;
      if (param_2 != (double *)0x0) {
        iVar3 = FUN_1007a632(param_2,0);
        if (iVar3 < 0) goto LAB_10073704;
        iVar3 = 0;
        if (*(int *)(in_ECX + 0x5c) != 0) {
          local_3c = 1;
        }
        if ((*(int *)(in_ECX + 0x50) != 0) || (*(int *)(in_ECX + 0x54) != 0)) goto LAB_10073704;
      }
      piVar8 = *(int **)(in_ECX + 0x18);
      piVar11 = local_8;
      for (uVar6 = local_10 >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
        *piVar11 = *piVar8;
        piVar8 = piVar8 + 1;
        piVar11 = piVar11 + 1;
      }
      for (uVar6 = local_10 & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
        *(char *)piVar11 = (char)*piVar8;
        piVar8 = (int *)((int)piVar8 + 1);
        piVar11 = (int *)((int)piVar11 + 1);
      }
      piVar8 = *(int **)(in_ECX + 0x18);
      piVar11 = param_5;
      for (uVar6 = local_10 >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
        *piVar11 = *piVar8;
        piVar8 = piVar8 + 1;
        piVar11 = piVar11 + 1;
      }
      for (uVar6 = local_10 & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
        *(char *)piVar11 = (char)*piVar8;
        piVar8 = (int *)((int)piVar8 + 1);
        piVar11 = (int *)((int)piVar11 + 1);
      }
      piVar8 = (int *)0x0;
      if (local_18 != (int *)0x0) {
        param_2 = local_14;
        do {
          iVar3 = *(int *)((int)piVar8 * 4 + *(int *)(in_ECX + 0x18));
          if ((iVar3 == -1) || (iVar3 = FUN_1006c8ca(iVar3,param_2), iVar3 < 0)) {
            *param_2 = *(double *)(in_ECX + 0xa0);
            param_2[1] = *(double *)(in_ECX + 0xa8);
          }
          iVar3 = *(int *)((int)piVar8 * 4 + *(int *)(in_ECX + 0x18));
          if ((iVar3 == -1) ||
             (puVar1 = *(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + iVar3 * 4),
             *(uint *)(*(int *)(in_ECX + 8) + 0x74) == puVar1[1])) {
            local_c[(int)piVar8] = 0x1f;
          }
          else {
            local_c[(int)piVar8] = *puVar1 & 0x1f;
          }
          param_2 = param_2 + 2;
          piVar8 = (int *)((int)piVar8 + 1);
        } while (piVar8 < local_18);
      }
      local_40 = *(undefined4 *)(in_ECX + 0x20);
      local_38 = 0;
      local_4c[0] = -1;
      local_4c[1] = 0xffffffff;
      local_1c = 0;
      local_34 = 1;
      local_30 = local_40;
      do {
        local_5c = *(undefined4 *)(*(int *)(in_ECX + 8) + 8);
        local_58 = *(undefined4 *)(*(int *)(in_ECX + 8) + 0xc);
        piVar8 = local_8;
        piVar11 = local_20;
        for (uVar6 = local_10 >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
          *piVar11 = *piVar8;
          piVar8 = piVar8 + 1;
          piVar11 = piVar11 + 1;
        }
        for (uVar6 = local_10 & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
          *(char *)piVar11 = (char)*piVar8;
          piVar8 = (int *)((int)piVar8 + 1);
          piVar11 = (int *)((int)piVar11 + 1);
        }
        pdVar5 = local_14;
        pdVar9 = local_24;
        for (uVar6 = local_54 >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
          *(undefined4 *)pdVar9 = *(undefined4 *)pdVar5;
          pdVar5 = (double *)((int)pdVar5 + 4);
          pdVar9 = (double *)((int)pdVar9 + 4);
        }
        param_2 = (double *)0xffffffff;
        for (uVar6 = local_54 & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
          *(undefined1 *)pdVar9 = *(undefined1 *)pdVar5;
          pdVar5 = (double *)((int)pdVar5 + 1);
          pdVar9 = (double *)((int)pdVar9 + 1);
        }
        puVar7 = local_c;
        puVar10 = local_28;
        for (uVar6 = local_10 >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
          *puVar10 = *puVar7;
          puVar7 = puVar7 + 1;
          puVar10 = puVar10 + 1;
        }
        for (uVar6 = local_10 & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
          *(undefined1 *)puVar10 = *(undefined1 *)puVar7;
          puVar7 = (undefined4 *)((int)puVar7 + 1);
          puVar10 = (undefined4 *)((int)puVar10 + 1);
        }
        if (param_3 != 0) {
          param_2 = (double *)0xffffffff;
          *(int **)(in_ECX + 0x18) = local_8;
          *(undefined4 *)(in_ECX + 0x50) = 0;
          *(undefined4 *)(in_ECX + 0x54) = 0;
          iVar3 = FUN_1007b5eb(param_3,&param_2,0);
          if ((iVar3 < 0) ||
             (iVar3 = FUN_1006e308(param_3,0x20500001,&local_40,&local_40,&param_2,0x17), iVar3 < 0)
             ) goto LAB_10073704;
          param_2 = (double *)0xffffffff;
          *(int **)(in_ECX + 0x18) = param_5;
          *(undefined4 *)(in_ECX + 0x50) = 0;
          *(undefined4 *)(in_ECX + 0x54) = 0;
          iVar3 = FUN_1007b5eb(param_3,&param_2,0);
          if ((iVar3 < 0) ||
             (iVar3 = FUN_1006e308(param_3,0x20500001,&local_30,&local_30,&param_2,0x17), iVar3 < 0)
             ) goto LAB_10073704;
          if ((*(int *)(in_ECX + 0x58) == 0) &&
             ((*(int *)(in_ECX + 0x50) != 0 || (*(int *)(in_ECX + 0x54) != 0)))) break;
          *(undefined4 *)(in_ECX + 0x50) = 0;
          *(undefined4 *)(in_ECX + 0x54) = 0;
        }
        iVar3 = FUN_1006c8ca(local_30,&local_70);
        if (iVar3 < 0) {
          local_70 = *(double *)(in_ECX + 0xa8);
          local_68 = *(double *)(in_ECX + 0xa0);
        }
        if ((0.0 < local_70) || (local_68 < 0.0)) {
          local_38 = 1;
        }
        if (local_18 != (int *)0x0) {
          local_2c = local_14;
          iVar3 = (int)local_c - (int)param_5;
          local_44 = local_18;
          piVar8 = param_5;
          do {
            if (*piVar8 != -1) {
              iVar4 = FUN_1006c8ca(*piVar8,&local_80);
              if (iVar4 < 0) {
                local_80 = *(double *)(in_ECX + 0xa0);
                local_78 = *(double *)(in_ECX + 0xa8);
              }
              if (local_38 == 0) {
                if (local_80 < *local_2c) {
                  *local_2c = local_80;
                }
                if (local_2c[1] < local_78) {
                  local_2c[1] = local_78;
                }
                puVar1 = (uint *)(iVar3 + (int)piVar8);
                *puVar1 = *puVar1 & **(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *piVar8 * 4)
                ;
              }
              else {
                *local_2c = local_80;
                local_2c[1] = local_78;
                *(uint *)(iVar3 + (int)piVar8) =
                     **(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *piVar8 * 4) & 0x1f;
              }
            }
            local_2c = local_2c + 2;
            piVar8 = piVar8 + 1;
            local_44 = (int *)((int)local_44 + -1);
          } while (local_44 != (int *)0x0);
          local_44 = (int *)0x0;
        }
        if ((local_70 == 0.0) && (local_68 == 0.0)) break;
        if ((local_70 <= 0.0) && (!NAN(local_68) && 0.0 < local_68 != (local_68 == 0.0))) {
          *(undefined4 *)(in_ECX + 0x58) = 1;
        }
        if (local_34 != 0) {
          if (local_38 == 0) {
            iVar3 = FUN_10071188(param_2,local_1c,local_4c,local_4c + 1);
            local_34 = 1;
            if (iVar3 != 0) goto LAB_10073516;
          }
          local_34 = 0;
        }
LAB_10073516:
        if (local_18 != (int *)0x0) {
          local_2c = (double *)((int)local_8 - (int)param_5);
          local_44 = local_18;
          piVar8 = param_5;
          do {
            if (*(int *)((int)local_2c + (int)piVar8) != *piVar8) {
              iVar3 = *(int *)(*(int *)(in_ECX + 8) + 0x14);
              puVar1 = *(uint **)(iVar3 + *(int *)((int)local_2c + (int)piVar8) * 4);
              puVar2 = *(uint **)(iVar3 + *piVar8 * 4);
              *(ushort *)puVar1 = (ushort)*puVar1 & 0xfe60;
              *puVar1 = *puVar2 & 0x19f | *puVar1;
              *(undefined8 *)(puVar1 + 8) = *(undefined8 *)(puVar2 + 8);
              *(undefined8 *)(puVar1 + 10) = *(undefined8 *)(puVar2 + 10);
            }
            piVar8 = piVar8 + 1;
            local_44 = (int *)((int)local_44 + -1);
          } while (local_44 != (int *)0x0);
        }
        if (param_4 != 0) {
          *(int **)(in_ECX + 0x18) = local_8;
          *(undefined4 *)(in_ECX + 0x50) = 0;
          *(undefined4 *)(in_ECX + 0x54) = 0;
          iVar3 = FUN_1007153d(param_3,local_30,param_4,0);
          if (iVar3 < 0) goto LAB_10073704;
          *(int **)(in_ECX + 0x18) = param_5;
          *(undefined4 *)(in_ECX + 0x50) = 0;
          *(undefined4 *)(in_ECX + 0x54) = 0;
          iVar3 = FUN_1007a632(param_4,0);
          if (iVar3 < 0) goto LAB_10073704;
          if ((*(int *)(in_ECX + 0x58) == 0) &&
             ((*(int *)(in_ECX + 0x50) != 0 || (*(int *)(in_ECX + 0x54) != 0)))) break;
          *(undefined4 *)(in_ECX + 0x50) = 0;
          *(undefined4 *)(in_ECX + 0x54) = 0;
        }
        puVar7 = local_c;
        pdVar5 = local_14;
        piVar8 = local_20;
        if (*(int *)(in_ECX + 0x5c) != 0) {
          local_20 = local_8;
          local_14 = local_24;
          local_24 = pdVar5;
          local_8 = piVar8;
          local_c = local_28;
          local_28 = puVar7;
          FUN_1006e26a(local_5c,local_58,piVar8);
          *(undefined4 *)(in_ECX + 0x4c) = 0;
          *(undefined4 *)(in_ECX + 0x50) = 0;
          *(undefined4 *)(in_ECX + 0x54) = 0;
          if (local_1c == 0) {
            local_3c = 1;
          }
          break;
        }
        local_1c = local_1c + 1;
      } while (local_1c < 0x400);
      if (local_1c == 0x400) {
        FUN_1006dca1();
      }
      else {
        if (local_18 != (int *)0x0) {
          param_5 = local_18;
          pdVar5 = local_14;
          piVar8 = local_8;
          do {
            if (*piVar8 != -1) {
              puVar1 = *(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *piVar8 * 4);
              *(double *)(puVar1 + 8) = *pdVar5;
              *(double *)(puVar1 + 10) = pdVar5[1];
              *puVar1 = *(uint *)(((int)local_c - (int)local_8) + (int)piVar8) | 0x180;
            }
            pdVar5 = pdVar5 + 2;
            piVar8 = piVar8 + 1;
            param_5 = (int *)((int)param_5 + -1);
          } while (param_5 != (int *)0x0);
        }
        uVar6 = local_10 >> 2;
        *(int **)(in_ECX + 0x18) = local_50;
        piVar8 = local_8;
        piVar11 = local_50;
        for (; uVar6 != 0; uVar6 = uVar6 - 1) {
          *piVar11 = *piVar8;
          piVar8 = piVar8 + 1;
          piVar11 = piVar11 + 1;
        }
        for (uVar6 = local_10 & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
          *(char *)piVar11 = (char)*piVar8;
          piVar8 = (int *)((int)piVar8 + 1);
          piVar11 = (int *)((int)piVar11 + 1);
        }
        if ((((local_1c == 0) || (local_34 == 0)) || (*(int *)(in_ECX + 0x50) != 0)) ||
           ((*(int *)(in_ECX + 0x54) != 0 ||
            (iVar3 = FUN_1006e308(param_3,0x10000001,*(int *)(in_ECX + 0x18) + local_4c[0] * 4,
                                  local_4c + 1,0,0), -1 < iVar3)))) {
          iVar3 = 0;
          goto LAB_10073704;
        }
      }
      iVar3 = -0x7fffbffb;
      goto LAB_10073704;
    }
  }
  iVar3 = -0x7ff8fff2;
LAB_10073704:
  *(int **)(in_ECX + 0x18) = local_50;
  _free(local_8);
  _free(local_20);
  _free(local_14);
  _free(local_24);
  _free(local_c);
  _free(local_28);
  *(undefined4 *)(in_ECX + 0x58) = local_60;
  *(undefined4 *)(in_ECX + 0x5c) = local_3c;
  return iVar3;
}


