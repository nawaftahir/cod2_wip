// 1008c376 size=1199 FUN_1008c376

uint FUN_1008c376(void)

{
  uint *puVar1;
  undefined4 *puVar2;
  bool bVar3;
  int *_Memory;
  undefined4 uVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int in_ECX;
  uint *puVar10;
  uint uVar11;
  uint uVar12;
  bool bVar13;
  uint local_50;
  int local_40;
  uint local_3c;
  int *local_38;
  int *local_34;
  uint local_2c;
  uint local_20;
  uint local_1c;
  uint local_18;
  uint local_14;
  uint local_8;
  
  _Memory = operator_new(*(int *)(in_ECX + 8) << 2);
  if (_Memory != (int *)0x0) {
    local_40 = 0;
    do {
      bVar3 = false;
      local_14 = 0;
      FUN_1008a979();
      FUN_1008af0b();
      local_8 = 0;
      if (*(int *)(in_ECX + 8) != 0) {
        do {
          iVar9 = *(int *)(*(int *)(in_ECX + 0x14) + local_8 * 4);
          if ((((*(int *)(iVar9 + 8) == -1) && (*(int *)(iVar9 + 0x48) != -1)) &&
              (uVar12 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar9 + 4) * 4) + 4),
              (uVar12 & 2) != 0)) && ((uVar12 & 0x20) == 0)) {
            puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar9 + 0x48) * 4);
            uVar12 = *puVar1;
            if ((0xfffffff < (uVar12 & 0xf0000000)) && ((uVar12 & 0xf0000000) < 0x40000001)) {
              uVar11 = uVar12 & 0xfff00000;
              if (uVar11 < 0x11400001) {
                if ((((uVar11 != 0x11400000) && (uVar11 != 0x10f00000)) && (uVar11 != 0x11100000))
                   && (uVar11 != 0x11200000)) {
                  bVar13 = uVar11 == 0x11300000;
LAB_1008c496:
                  if (!bVar13) {
                    local_20 = 0;
                    if (puVar1[3] != 0) {
                      puVar10 = (uint *)puVar1[4];
                      do {
                        if (local_8 == *puVar10) break;
                        local_20 = local_20 + 1;
                        puVar10 = puVar10 + 1;
                      } while (local_20 < puVar1[3]);
                    }
                    uVar12 = puVar1[1] / (uVar12 & 0xfffff);
                    uVar4 = FUN_10085469();
                    local_1c = 0;
                    if (uVar12 != 0) {
                      do {
                        iVar5 = FUN_10086ca9(puVar1,local_1c,local_20,uVar4);
                        uVar11 = uVar11 * 0x83f + iVar5;
                        local_1c = local_1c + 1;
                      } while (local_1c < uVar12);
                    }
                    *(uint *)(iVar9 + 0x40) = uVar11;
                    _Memory[local_14] = local_8;
                    local_14 = local_14 + 1;
                  }
                }
              }
              else if (((uVar11 != 0x11500000) && (uVar11 != 0x20700000)) && (uVar11 != 0x20800000))
              {
                bVar13 = uVar11 == 0x20900000;
                goto LAB_1008c496;
              }
            }
          }
          local_8 = local_8 + 1;
        } while (local_8 < *(uint *)(in_ECX + 8));
      }
      FUN_10086920(FUN_100868f2,_Memory,local_14,in_ECX);
      if (local_14 == 0) goto LAB_1008c80b;
      local_3c = 1;
      local_50 = local_14;
      local_38 = _Memory;
      do {
        iVar9 = *(int *)(*(int *)(in_ECX + 0x14) + *local_38 * 4);
        puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar9 + 0x48) * 4);
        if (*(int *)(iVar9 + 0x30) == *local_38) {
          for (local_2c = local_3c; local_2c < local_14; local_2c = local_2c + 1) {
            iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + _Memory[local_2c] * 4);
            if (*(int *)(iVar9 + 0x40) != *(int *)(iVar5 + 0x40)) break;
            if ((((*(int *)(iVar5 + 0x30) == _Memory[local_2c]) &&
                 (*(int *)(iVar9 + 0x48) != *(int *)(iVar5 + 0x48))) &&
                ((*(int *)(iVar9 + 4) == *(int *)(iVar5 + 4) &&
                 ((*(int *)(iVar9 + 0x14) == *(int *)(iVar5 + 0x14) &&
                  (*(int *)(iVar9 + 0x18) == *(int *)(iVar5 + 0x18))))))) &&
               (uVar12 = *puVar1,
               ((**(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar5 + 0x48) * 4) ^ uVar12) &
               0xfff00000) == 0)) {
              uVar12 = puVar1[1] / (uVar12 & 0xfffff);
              uVar4 = FUN_10085469();
              local_20 = 0;
LAB_1008c609:
              iVar6 = iVar5;
              if (local_20 == 0) {
                iVar6 = iVar9;
              }
              uVar11 = *(uint *)(iVar6 + 0x48);
              iVar6 = iVar9;
              if (local_20 == 0) {
                iVar6 = iVar5;
              }
              puVar2 = *(undefined4 **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar6 + 0x48) * 4);
              iVar6 = *(int *)(*(int *)(in_ECX + 0x18) + uVar11 * 4);
              local_1c = 0;
              if (puVar2[3] != 0) {
                local_34 = (int *)puVar2[4];
                do {
                  if (*(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + *local_34 * 4) + 0x54) <= uVar11)
                  break;
                  local_18 = 0;
                  if (*(int *)(iVar6 + 0xc) != 0) {
                    do {
                      local_8 = 0;
                      if (uVar12 != 0) {
                        do {
                          iVar7 = FUN_10086ca9(puVar2,local_8,local_1c,uVar4);
                          iVar8 = FUN_10086ca9(iVar6,local_8,local_18,uVar4);
                          if (iVar8 != iVar7) break;
                          local_8 = local_8 + 1;
                        } while (local_8 < uVar12);
                      }
                    } while ((local_8 != uVar12) &&
                            (local_18 = local_18 + 1, local_18 < *(uint *)(iVar6 + 0xc)));
                  }
                  if (local_18 == *(uint *)(iVar6 + 0xc)) break;
                  local_1c = local_1c + 1;
                  local_34 = local_34 + 1;
                } while (local_1c < (uint)puVar2[3]);
              }
              if (local_1c < (uint)puVar2[3]) goto code_r0x1008c6ea;
              local_1c = 0;
              if (puVar2[3] != 0) {
                do {
                  local_20 = 0;
                  if (*(int *)(iVar6 + 0xc) != 0) {
                    do {
                      local_8 = 0;
                      if (uVar12 != 0) {
                        do {
                          iVar5 = FUN_10086ca9(iVar6,local_8,local_20,uVar4);
                          iVar7 = FUN_10086ca9(puVar2,local_8,local_1c,uVar4);
                          if (iVar5 != iVar7) break;
                          local_8 = local_8 + 1;
                        } while (local_8 < uVar12);
                      }
                    } while ((local_8 != uVar12) &&
                            (local_20 = local_20 + 1, local_20 < *(uint *)(iVar6 + 0xc)));
                  }
                  iVar5 = local_1c * 4;
                  local_1c = local_1c + 1;
                  *(undefined4 *)
                   (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar2[4] + iVar5) * 4) + 0x30) =
                       *(undefined4 *)(*(int *)(iVar6 + 0x10) + local_20 * 4);
                } while (local_1c < (uint)puVar2[3]);
              }
              *puVar2 = 0;
              bVar3 = true;
            }
LAB_1008c7a6:
          }
        }
        local_38 = local_38 + 1;
        local_3c = local_3c + 1;
        local_50 = local_50 - 1;
      } while (local_50 != 0);
      if (!bVar3) goto LAB_1008c80b;
      uVar12 = 0;
      if (*(int *)(in_ECX + 8) != 0) {
        iVar9 = *(int *)(in_ECX + 0x14);
        do {
          iVar5 = *(int *)(iVar9 + uVar12 * 4);
          while (*(int *)(iVar5 + 0x30) !=
                 *(int *)(*(int *)(iVar9 + *(int *)(iVar5 + 0x30) * 4) + 0x30)) {
            *(undefined4 *)(iVar5 + 0x30) =
                 *(undefined4 *)(*(int *)(iVar9 + *(int *)(iVar5 + 0x30) * 4) + 0x30);
            iVar9 = *(int *)(in_ECX + 0x14);
          }
          uVar12 = uVar12 + 1;
        } while (uVar12 < *(uint *)(in_ECX + 8));
      }
      FUN_1008af24();
      local_40 = local_40 + 1;
    } while( true );
  }
  uVar12 = 0x8007000e;
LAB_1008c816:
  _free(_Memory);
  return uVar12;
code_r0x1008c6ea:
  local_20 = local_20 + 1;
  if (1 < local_20) goto LAB_1008c7a6;
  goto LAB_1008c609;
LAB_1008c80b:
  uVar12 = (uint)(local_40 == 0);
  goto LAB_1008c816;
}


