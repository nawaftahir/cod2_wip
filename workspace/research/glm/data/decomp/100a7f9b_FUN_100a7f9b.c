// 100a7f9b size=981 FUN_100a7f9b

int FUN_100a7f9b(void)

{
  undefined8 uVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  uint *puVar4;
  int *piVar5;
  uint uVar6;
  int iVar7;
  int in_ECX;
  uint *puVar8;
  undefined4 uVar9;
  uint *puVar10;
  int iVar11;
  bool bVar12;
  int local_ec [20];
  uint local_9c [12];
  int local_6c [4];
  undefined4 local_5c [4];
  int local_4c;
  uint local_3c;
  uint local_38;
  uint local_34;
  uint local_30;
  uint *local_2c;
  uint local_28;
  uint local_24;
  uint *local_20;
  uint local_1c;
  int local_18;
  uint local_14;
  uint local_10;
  int local_c;
  int local_8;
  
  local_8 = 0;
  local_c = 0;
  local_34 = *(uint *)(in_ECX + 0x4c);
  local_3c = *(uint *)(in_ECX + 0x224);
  bVar12 = local_34 < *(uint *)(in_ECX + 0x224);
  do {
    local_c = 0;
    if (!bVar12) {
      iVar11 = 0;
LAB_100a8346:
      if (local_8 != 0) {
        FUN_1006c418();
      }
LAB_100a8354:
      if (local_c != 0) {
        FUN_1006c418();
      }
      return iVar11;
    }
    puVar10 = *(uint **)(*(int *)(in_ECX + 0x230) + local_34 * 4);
    local_2c = puVar10;
    if ((puVar10 != (uint *)0x0) && (*puVar10 != 0)) {
      local_14 = *puVar10 & 0xfffff;
      local_38 = puVar10[1] / local_14;
      local_24 = 0;
      if (local_38 != 0) {
        local_18 = 0;
        local_20 = local_9c;
        do {
          puVar4 = local_20;
          puVar8 = local_20 + 1;
          *local_20 = 0xffffffff;
          *puVar8 = 0xffffffff;
          puVar4[2] = 0xffffffff;
          puVar4[3] = 0xffffffff;
          local_ec[0] = -1;
          local_ec[1] = 0xffffffff;
          local_ec[2] = 0xffffffff;
          local_ec[3] = 0xffffffff;
          local_28 = 0;
          local_30 = 0;
          if (local_14 == 0) {
LAB_100a810b:
            iVar11 = FUN_100a7ec8(local_20,local_ec,2);
            if (iVar11 == 0) {
              local_4c = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0,3,0);
              if (local_4c == -1) goto LAB_100a8369;
              iVar11 = FUN_10085814();
              if (iVar11 == 0) {
                local_8 = 0;
              }
              else {
                local_8 = FUN_10085379();
              }
              if (local_8 == 0) goto LAB_100a8369;
              iVar11 = FUN_1008585f(0x50000003,6,1,0);
              if ((iVar11 < 0) || (iVar11 = FUN_100853b0(), iVar11 < 0)) goto LAB_100a8346;
              iVar11 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(local_18 + puVar10[2]) * 4);
              local_28 = *(uint *)(iVar11 + 0x10);
              local_10 = 0;
              do {
                if (local_10 == local_28) {
                  uVar9 = *(undefined4 *)(in_ECX + 0x444);
                }
                else {
                  uVar9 = *(undefined4 *)(in_ECX + 0x440);
                }
                uVar1 = *(undefined8 *)(iVar11 + 0x20);
                uVar2 = *(undefined4 *)(iVar11 + 4);
                local_5c[local_10] = uVar9;
                iVar7 = FUN_10086139(uVar2,0,local_10,uVar1);
                local_6c[local_10] = iVar7;
                if (iVar7 == -1) goto LAB_100a8369;
                local_1c = *(uint *)(*(int *)(in_ECX + 0x14) + iVar7 * 4);
                FUN_10085c65();
                iVar7 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                         *(int *)(local_18 + puVar10[2]) * 4) + 0x38);
                if (iVar7 == -1) {
                  *(int *)(local_1c + 0x38) = *(int *)(local_18 + puVar10[2]);
                }
                else {
                  *(int *)(local_1c + 0x38) = iVar7;
                }
                local_10 = local_10 + 1;
              } while (local_10 < 3);
              puVar3 = *(undefined4 **)(local_8 + 8);
              *puVar3 = local_5c[0];
              puVar3[1] = local_5c[1];
              puVar3[2] = local_5c[2];
              iVar11 = *(int *)(local_8 + 8);
              *(int *)(iVar11 + 0xc) = local_6c[0];
              *(int *)(iVar11 + 0x10) = local_6c[1];
              *(int *)(iVar11 + 0x14) = local_6c[2];
              **(int **)(local_8 + 0x10) = local_4c;
              iVar11 = local_18;
              for (uVar6 = local_14; uVar6 != 0; uVar6 = uVar6 - 1) {
                *(int *)(iVar11 + local_2c[2]) = local_4c;
                iVar11 = iVar11 + 4;
              }
              if (0x1ff < *(uint *)(in_ECX + 0x224)) goto LAB_100a8369;
              *(int *)(*(int *)(in_ECX + 0x230) + *(uint *)(in_ECX + 0x224) * 4) = local_8;
              *(int *)(in_ECX + 0x224) = *(int *)(in_ECX + 0x224) + 1;
              iVar11 = FUN_10086026();
              if (iVar11 < 0) goto LAB_100a8369;
              local_8 = 0;
              puVar10 = local_2c;
            }
          }
          else {
            local_1c = *puVar10 & 0xfff00000;
            piVar5 = (int *)(puVar10[2] + local_18);
            do {
              local_10 = *(uint *)(*(int *)(in_ECX + 0x14) + *piVar5 * 4);
              uVar6 = local_30;
              if ((local_1c != 0x50000000) && (local_14 == puVar10[3])) {
                uVar6 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                          *(int *)(puVar10[4] + local_30 * 4) * 4) + 0x10);
              }
              iVar11 = uVar6 + local_24 * 4;
              if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(local_10 + 4) * 4) + 5) & 1
                  ) == 0) {
                local_9c[iVar11] = *(uint *)(local_10 + 0x10);
              }
              else {
                local_9c[iVar11] = uVar6;
              }
              if (uVar6 == 3) {
                local_28 = 1;
              }
              local_ec[uVar6] = 0;
              local_30 = local_30 + 1;
              piVar5 = piVar5 + 1;
            } while (local_30 < local_14);
            if (((local_28 == 0) || (bVar12 = true, local_14 != 1)) ||
               ((local_1c == 0x50000000 && (puVar10[3] == 1)))) goto LAB_100a810b;
            uVar6 = 0;
            puVar8 = local_20;
            do {
              if ((*puVar8 != *(uint *)((int)&DAT_101a4060 + uVar6)) &&
                 (*(int *)((int)local_ec + uVar6) != -1)) {
                bVar12 = false;
              }
              uVar6 = uVar6 + 4;
              puVar8 = puVar8 + 1;
            } while (uVar6 < 0x10);
            if (!bVar12) goto LAB_100a810b;
          }
          local_24 = local_24 + 1;
          local_20 = local_20 + 4;
          local_18 = local_18 + local_14 * 4;
        } while (local_24 < local_38);
      }
      iVar11 = FUN_10085814();
      if (iVar11 == 0) {
        local_c = 0;
      }
      else {
        local_c = FUN_10085379();
      }
      if ((local_c != 0) && (iVar11 = FUN_10086026(), -1 < iVar11)) {
        iVar11 = FUN_10085abe();
        iVar7 = local_c;
        if (iVar11 < 0) goto LAB_100a8354;
        if (*(uint *)(in_ECX + 0x224) < 0x200) {
          local_c = 0;
          *(int *)(*(int *)(in_ECX + 0x230) + *(uint *)(in_ECX + 0x224) * 4) = iVar7;
          *(int *)(in_ECX + 0x224) = *(int *)(in_ECX + 0x224) + 1;
          *puVar10 = 0;
          goto LAB_100a8334;
        }
      }
LAB_100a8369:
      iVar11 = -0x7ff8fff2;
      goto LAB_100a8346;
    }
LAB_100a8334:
    local_34 = local_34 + 1;
    bVar12 = local_34 < local_3c;
  } while( true );
}


