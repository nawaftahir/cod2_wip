// 10089055 size=755 FUN_10089055

undefined4 FUN_10089055(uint param_1,int *param_2,uint param_3,int *param_4)

{
  undefined4 *puVar1;
  int iVar2;
  undefined4 uVar3;
  int in_ECX;
  int iVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  int *piVar8;
  int iVar9;
  int iVar10;
  uint uVar11;
  int *piVar12;
  int local_40 [4];
  int local_30 [4];
  int *local_20;
  int local_1c;
  int local_18;
  uint local_14;
  int local_10;
  int *local_c;
  uint local_8;
  
  local_14 = 0xffffffff;
  iVar6 = *(int *)(*(int *)(in_ECX + 0x14) +
                  **(int **)(*(int *)(*(int *)(in_ECX + 0x18) + param_1 * 4) + 0x10) * 4);
  local_1c = *(int *)(iVar6 + 0x14);
  iVar10 = *param_2;
  local_18 = *(int *)(iVar6 + 0x18);
  do {
    iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + iVar10 * 4);
    local_10 = iVar6;
    iVar2 = iVar6;
    if ((*(int *)(iVar6 + 0x10) == 0) &&
       ((*(uint *)(iVar6 + 0x48) == 0xffffffff || (*(uint *)(iVar6 + 0x48) < param_1)))) {
      iVar4 = local_1c;
      iVar7 = local_18;
      if (local_1c != -1) {
        do {
          if (iVar4 == *(int *)(iVar6 + 0x14)) break;
          iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4);
          iVar7 = *(int *)(iVar4 + 0x18);
          iVar4 = *(int *)(iVar4 + 0x14);
        } while (iVar4 != -1);
      }
      if ((iVar4 == *(int *)(iVar6 + 0x14)) && (iVar7 == *(int *)(iVar6 + 0x18))) {
        local_30[0] = iVar10;
        local_8 = 1;
        if (1 < param_3) {
          piVar8 = param_2 + 1;
          local_c = piVar8;
          local_20 = (int *)((int)local_30 - (int)param_2);
LAB_10089107:
          iVar10 = *piVar8;
          do {
            iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + iVar10 * 4);
            if ((*(uint *)(iVar7 + 0x10) == local_8) &&
               ((((*(uint *)(iVar7 + 0x48) == 0xffffffff || (*(uint *)(iVar7 + 0x48) < param_1)) &&
                 (*(int *)(iVar7 + 4) == *(int *)(iVar2 + 4))) &&
                ((*(int *)(iVar7 + 0xc) == *(int *)(iVar2 + 0xc) &&
                 (*(int *)(iVar7 + 8) == *(int *)(iVar2 + 8))))))) {
              iVar4 = local_18;
              iVar9 = local_1c;
              if (local_1c != -1) {
                do {
                  if (iVar9 == *(int *)(iVar7 + 0x14)) break;
                  iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + iVar9 * 4);
                  iVar4 = *(int *)(iVar2 + 0x18);
                  iVar9 = *(int *)(iVar2 + 0x14);
                } while (iVar9 != -1);
              }
              iVar2 = iVar6;
              if ((iVar9 == *(int *)(iVar7 + 0x14)) && (iVar4 == *(int *)(iVar7 + 0x18)))
              goto LAB_10089178;
            }
            iVar10 = *(int *)(iVar7 + 0x34);
            local_c = piVar8;
            if (iVar10 == *piVar8) break;
          } while( true );
        }
LAB_10089199:
        if (local_8 == param_3) {
          uVar11 = 0;
          uVar5 = 0;
          if (param_3 != 0) {
            do {
              if (*(int *)(*(int *)(local_30[uVar5] * 4 + *(int *)(in_ECX + 0x14)) + 0x48) != 0) {
                iVar6 = param_1 - *(int *)(*(int *)(local_30[uVar5] * 4 + *(int *)(in_ECX + 0x14)) +
                                          0x48);
                uVar11 = uVar11 + iVar6 * iVar6;
              }
              uVar5 = uVar5 + 1;
            } while (uVar5 < param_3);
          }
          if (uVar11 < local_14) {
            local_14 = uVar11;
            piVar8 = local_30;
            piVar12 = local_40;
            for (uVar5 = param_3; uVar5 != 0; uVar5 = uVar5 - 1) {
              *piVar12 = *piVar8;
              piVar8 = piVar8 + 1;
              piVar12 = piVar12 + 1;
            }
          }
        }
      }
    }
    iVar10 = *(int *)(iVar2 + 0x34);
    if (iVar10 == *param_2) {
      if (local_14 == 0xffffffff) {
        uVar5 = FUN_10086199(param_3 & 0xfffff | 0x10000000,0xffffffff,0xffffffff);
        if (uVar5 == 0xffffffff) {
          return 0x8007000e;
        }
        iVar6 = *(int *)(*(int *)(in_ECX + 0x18) + uVar5 * 4);
        local_14 = uVar5;
        FUN_100853b0();
        local_8 = 0;
        if (param_3 != 0) {
          do {
            iVar10 = local_8 * 4;
            local_20 = param_2 + local_8;
            *(int *)(iVar10 + *(int *)(iVar6 + 8)) = *local_20;
            uVar3 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),*param_4,local_8,0);
            *(undefined4 *)(iVar10 + *(int *)(iVar6 + 0x10)) = uVar3;
            if (*(int *)(iVar10 + *(int *)(iVar6 + 0x10)) == -1) {
              return 0x8007000e;
            }
            *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                             *(int *)(iVar10 + *(int *)(iVar6 + 0x10)) * 4) + 0x18) = local_18;
            *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                             *(int *)(iVar10 + *(int *)(iVar6 + 0x10)) * 4) + 0x14) = local_1c;
            **(undefined4 **)
              (*(int *)(in_ECX + 0x14) + *(int *)(iVar10 + *(int *)(iVar6 + 0x10)) * 4) =
                 **(undefined4 **)
                   (*(int *)(in_ECX + 0x14) + *(int *)(iVar10 + *(int *)(iVar6 + 8)) * 4);
            local_8 = local_8 + 1;
            *(undefined4 *)
             (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar10 + *(int *)(iVar6 + 0x10)) * 4) +
             0x34) = *(undefined4 *)
                      (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar10 + *(int *)(iVar6 + 8)) * 4
                               ) + 0x34);
            *(undefined4 *)
             (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar10 + *(int *)(iVar6 + 8)) * 4) + 0x34)
                 = *(undefined4 *)(iVar10 + *(int *)(iVar6 + 0x10));
            *local_20 = *(int *)(iVar10 + *(int *)(iVar6 + 0x10));
            uVar5 = local_14;
          } while (local_8 < param_3);
        }
        for (; param_1 < uVar5; uVar5 = uVar5 - 1) {
          puVar1 = (undefined4 *)(*(int *)(in_ECX + 0x18) + uVar5 * 4);
          *puVar1 = puVar1[-1];
        }
        *(int *)(*(int *)(in_ECX + 0x18) + uVar5 * 4) = iVar6;
        *param_4 = *param_4 + 1;
      }
      else {
        piVar8 = local_40;
        for (; param_3 != 0; param_3 = param_3 - 1) {
          *param_2 = *piVar8;
          piVar8 = piVar8 + 1;
          param_2 = param_2 + 1;
        }
      }
      return 0;
    }
  } while( true );
LAB_10089178:
  uVar5 = local_8 + 1;
  local_8 = uVar5;
  *(int *)(((int)local_30 - (int)param_2) + (int)piVar8) = iVar10;
  piVar8 = piVar8 + 1;
  local_c = piVar8;
  if (param_3 <= uVar5) goto LAB_10089199;
  goto LAB_10089107;
}


