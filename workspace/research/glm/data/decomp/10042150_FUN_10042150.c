// 10042150 size=590 FUN_10042150

void FUN_10042150(int param_1,undefined4 *param_2)

{
  undefined2 uVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  int iVar8;
  int iVar9;
  uint uVar10;
  uint uVar11;
  uint uVar12;
  undefined4 *puVar13;
  undefined4 *puVar14;
  int iVar15;
  int iStack_30;
  uint uStack_2c;
  undefined4 *local_1c;
  undefined4 *local_18;
  int local_c;
  
  iVar2 = *(int *)(param_1 + 0x150);
  iVar15 = *(int *)(param_1 + 0x4c);
  uVar12 = *(int *)(param_1 + 0xe8) - 1;
  local_c = 0;
  if (0 < *(int *)(param_1 + 0x44)) {
    local_1c = (undefined4 *)(iVar2 + 0x40);
    local_18 = param_2;
    do {
      iVar5 = (**(code **)(*(int *)(param_1 + 4) + 0x20))
                        (param_1,*local_1c,*(int *)(iVar2 + 8) * *(int *)(iVar15 + 0xc),
                         *(int *)(iVar15 + 0xc),1);
      if (*(uint *)(iVar2 + 8) < uVar12) {
        uStack_2c = *(uint *)(iVar15 + 0xc);
      }
      else {
        uStack_2c = *(uint *)(iVar15 + 0x20) % *(uint *)(iVar15 + 0xc);
        if (uStack_2c == 0) {
          uStack_2c = *(uint *)(iVar15 + 0xc);
        }
      }
      uVar3 = *(uint *)(iVar15 + 0x1c);
      uVar4 = *(uint *)(iVar15 + 8);
      uVar10 = uVar3 % uVar4;
      if (0 < (int)uVar10) {
        uVar10 = uVar4 - uVar10;
      }
      iStack_30 = 0;
      if (0 < (int)uStack_2c) {
        do {
          iVar8 = *(int *)(iVar5 + iStack_30 * 4);
          (**(code **)(*(int *)(param_1 + 0x160) + 4))
                    (param_1,iVar15,*local_18,iVar8,iStack_30 << 3,0,uVar3);
          if (0 < (int)uVar10) {
            puVar14 = (undefined4 *)(iVar8 + uVar3 * 0x80);
            puVar13 = puVar14;
            for (iVar8 = (uVar10 & 0x1ffffff) << 5; iVar8 != 0; iVar8 = iVar8 + -1) {
              *puVar13 = 0;
              puVar13 = puVar13 + 1;
            }
            for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
              *(undefined1 *)puVar13 = 0;
              puVar13 = (undefined4 *)((int)puVar13 + 1);
            }
            uVar1 = *(undefined2 *)(puVar14 + -0x20);
            uVar6 = uVar10;
            if (0 < (int)uVar10) {
              do {
                *(undefined2 *)puVar14 = uVar1;
                puVar14 = puVar14 + 0x20;
                uVar6 = uVar6 - 1;
              } while (uVar6 != 0);
            }
          }
          iStack_30 = iStack_30 + 1;
        } while (iStack_30 < (int)uStack_2c);
      }
      if (*(uint *)(iVar2 + 8) == uVar12) {
        uVar7 = (uVar3 + uVar10) / uVar4;
        uVar6 = uStack_2c;
        if ((int)uStack_2c < *(int *)(iVar15 + 0xc)) {
          do {
            puVar13 = *(undefined4 **)(iVar5 + uVar6 * 4);
            iVar8 = *(int *)(iVar5 + -4 + uVar6 * 4);
            puVar14 = puVar13;
            for (iVar9 = (uVar3 + uVar10 & 0x1ffffff) << 5; iVar9 != 0; iVar9 = iVar9 + -1) {
              *puVar14 = 0;
              puVar14 = puVar14 + 1;
            }
            for (iVar9 = 0; iVar9 != 0; iVar9 = iVar9 + -1) {
              *(undefined1 *)puVar14 = 0;
              puVar14 = (undefined4 *)((int)puVar14 + 1);
            }
            if (uVar7 != 0) {
              uStack_2c = uVar7;
              do {
                uVar1 = *(undefined2 *)(uVar4 * 0x80 + -0x80 + iVar8);
                puVar14 = puVar13;
                uVar11 = uVar4;
                if (0 < (int)uVar4) {
                  do {
                    *(undefined2 *)puVar14 = uVar1;
                    uVar11 = uVar11 - 1;
                    puVar14 = puVar14 + 0x20;
                  } while (uVar11 != 0);
                }
                puVar13 = puVar13 + uVar4 * 0x20;
                iVar8 = iVar8 + uVar4 * 0x80;
                uStack_2c = uStack_2c - 1;
              } while (uStack_2c != 0);
            }
            uVar6 = uVar6 + 1;
          } while ((int)uVar6 < *(int *)(iVar15 + 0xc));
        }
      }
      local_1c = local_1c + 1;
      local_18 = local_18 + 1;
      local_c = local_c + 1;
      iVar15 = iVar15 + 0x54;
    } while (local_c < *(int *)(param_1 + 0x44));
  }
  FUN_100423a0(param_1,param_2);
  return;
}


