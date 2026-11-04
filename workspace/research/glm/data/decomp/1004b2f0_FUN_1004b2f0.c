// 1004b2f0 size=1606 FUN_1004b2f0

int FUN_1004b2f0(int param_1,int param_2)

{
  ushort uVar1;
  ushort uVar2;
  ushort uVar3;
  ushort uVar4;
  ushort uVar5;
  int iVar6;
  int iVar7;
  ushort *puVar8;
  code *pcVar9;
  bool bVar10;
  int iVar11;
  int iVar12;
  int iVar13;
  int iVar14;
  int iVar15;
  uint uVar16;
  int iVar17;
  uint uVar18;
  int iVar19;
  int iVar20;
  int iVar21;
  short *psVar22;
  int iVar23;
  uint uVar24;
  undefined4 *puVar25;
  int local_10c;
  uint uStack_108;
  undefined4 *local_f0;
  int iStack_ec;
  short *psStack_e8;
  uint uStack_e4;
  int iStack_e0;
  int iStack_dc;
  short *psStack_d8;
  int iStack_d4;
  short *psStack_d0;
  int local_cc;
  int iStack_c8;
  int local_c4;
  int iStack_bc;
  int iStack_b8;
  int iStack_b0;
  int iStack_98;
  undefined4 uStack_88;
  short sStack_84;
  short sStack_78;
  short sStack_76;
  short sStack_68;
  
  iVar6 = *(int *)(param_1 + 400);
  iVar7 = *(int *)(param_1 + 0x124);
  if (*(int *)(param_1 + 0x84) <= *(int *)(param_1 + 0x8c)) {
    do {
      if ((*(char *)((int)*(undefined4 **)(param_1 + 0x198) + 0x11) != '\0') ||
         ((*(int *)(param_1 + 0x84) == *(int *)(param_1 + 0x8c) &&
          ((uint)(*(int *)(param_1 + 0x174) == 0) + *(int *)(param_1 + 0x90) <
           *(uint *)(param_1 + 0x88))))) break;
      iVar13 = (*(code *)**(undefined4 **)(param_1 + 0x198))(param_1);
      if (iVar13 == 0) {
        return 0;
      }
    } while (*(int *)(param_1 + 0x84) <= *(int *)(param_1 + 0x8c));
  }
  local_10c = *(int *)(param_1 + 0xcc);
  local_cc = 0;
  if (0 < *(int *)(param_1 + 0x2c)) {
    local_f0 = (undefined4 *)(iVar6 + 0x48);
    local_c4 = 0;
    do {
      if (*(char *)(local_10c + 0x30) != '\0') {
        uVar24 = *(uint *)(param_1 + 0x90);
        uVar16 = *(uint *)(local_10c + 0xc);
        if (uVar24 < iVar7 - 1U) {
          uVar18 = uVar16 * 2;
          bVar10 = false;
          uStack_108 = uVar16;
        }
        else {
          uVar18 = *(uint *)(local_10c + 0x20) % uVar16;
          if (uVar18 == 0) {
            uVar18 = uVar16;
          }
          bVar10 = true;
          uStack_108 = uVar18;
        }
        if (uVar24 == 0) {
          iStack_98 = (**(code **)(*(int *)(param_1 + 4) + 0x20))(param_1,*local_f0,0,uVar18,0);
        }
        else {
          iStack_98 = (**(code **)(*(int *)(param_1 + 4) + 0x20))
                                (param_1,*local_f0,(uVar24 - 1) * uVar16,uVar18 + uVar16);
          iStack_98 = iStack_98 + *(int *)(local_10c + 0xc) * 4;
        }
        iVar13 = *(int *)(iVar6 + 0x70) + local_c4;
        puVar8 = *(ushort **)(local_10c + 0x4c);
        uVar16 = (uint)*puVar8;
        uVar1 = puVar8[1];
        uVar2 = puVar8[8];
        uVar3 = puVar8[0x10];
        uVar4 = puVar8[9];
        uVar5 = puVar8[2];
        pcVar9 = *(code **)((*(int *)(param_1 + 0x1a4) - iVar6) + -0x44 + (int)local_f0);
        iStack_ec = *(int *)(param_2 + local_cc * 4);
        iStack_d4 = 0;
        if (0 < (int)uStack_108) {
          do {
            psStack_d0 = *(short **)(iStack_98 + iStack_d4 * 4);
            if ((uVar24 != 0) || (psStack_d8 = psStack_d0, iStack_d4 != 0)) {
              psStack_d8 = *(short **)(iStack_98 + -4 + iStack_d4 * 4);
            }
            if ((!bVar10) || (psStack_e8 = psStack_d0, iStack_d4 != uStack_108 - 1)) {
              psStack_e8 = *(short **)(iStack_98 + 4 + iStack_d4 * 4);
            }
            iStack_dc = (int)*psStack_d8;
            iStack_e0 = (int)*psStack_e8;
            uVar18 = *(int *)(local_10c + 0x1c) - 1;
            iStack_b0 = 0;
            uStack_e4 = 0;
            iVar17 = (int)*psStack_d0;
            iStack_c8 = (int)*psStack_d0;
            iStack_bc = iStack_dc;
            iStack_b8 = iStack_e0;
            do {
              iVar21 = iVar17;
              iVar12 = iStack_dc;
              iVar11 = iStack_e0;
              psStack_d8 = psStack_d8 + 0x40;
              psStack_e8 = psStack_e8 + 0x40;
              psVar22 = psStack_d0;
              puVar25 = &uStack_88;
              for (iVar17 = 0x20; iVar17 != 0; iVar17 = iVar17 + -1) {
                *puVar25 = *(undefined4 *)psVar22;
                psVar22 = psVar22 + 2;
                puVar25 = puVar25 + 1;
              }
              iVar17 = iVar21;
              if (uStack_e4 < uVar18) {
                iStack_dc = (int)*psStack_d8;
                iVar17 = (int)psStack_d0[0x40];
                iStack_e0 = (int)*psStack_e8;
              }
              iVar20 = *(int *)(iVar13 + 4);
              if ((iVar20 != 0) && (uStack_88._2_2_ == 0)) {
                iVar14 = (iStack_c8 - iVar17) * uVar16;
                iVar19 = iVar14 * 0x24;
                iVar23 = (uint)uVar1 << 8;
                iVar15 = (uint)uVar1 * 0x80;
                if (iVar19 < 0) {
                  iVar23 = (iVar15 + iVar14 * -0x24) / iVar23;
                  if ((0 < iVar20) && (iVar20 = 1 << ((byte)iVar20 & 0x1f), iVar20 <= iVar23)) {
                    iVar23 = iVar20 + -1;
                  }
                  iVar23 = -iVar23;
                }
                else {
                  iVar23 = (iVar15 + iVar19) / iVar23;
                  if ((0 < iVar20) && (iVar20 = 1 << ((byte)iVar20 & 0x1f), iVar20 <= iVar23)) {
                    iVar23 = iVar20 + -1;
                  }
                }
                uStack_88._2_2_ = (short)iVar23;
              }
              iVar20 = *(int *)(iVar13 + 8);
              if ((iVar20 != 0) && (sStack_78 == 0)) {
                iVar14 = (iVar12 - iVar11) * uVar16;
                iVar19 = iVar14 * 0x24;
                iVar23 = (uint)uVar2 << 8;
                iVar15 = (uint)uVar2 * 0x80;
                if (iVar19 < 0) {
                  iVar23 = (iVar15 + iVar14 * -0x24) / iVar23;
                  if ((0 < iVar20) && (iVar20 = 1 << ((byte)iVar20 & 0x1f), iVar20 <= iVar23)) {
                    iVar23 = iVar20 + -1;
                  }
                  iVar23 = -iVar23;
                }
                else {
                  iVar23 = (iVar15 + iVar19) / iVar23;
                  if ((0 < iVar20) && (iVar20 = 1 << ((byte)iVar20 & 0x1f), iVar20 <= iVar23)) {
                    iVar23 = iVar20 + -1;
                  }
                }
                sStack_78 = (short)iVar23;
              }
              iVar20 = *(int *)(iVar13 + 0xc);
              if ((iVar20 != 0) && (sStack_68 == 0)) {
                iVar15 = (iVar11 + iVar21 * -2 + iVar12) * uVar16;
                iVar14 = iVar15 * 9;
                iVar23 = (uint)uVar3 << 8;
                iVar19 = (uint)uVar3 * 0x80;
                if (iVar14 < 0) {
                  iVar23 = (iVar19 + iVar15 * -9) / iVar23;
                  if ((0 < iVar20) && (iVar20 = 1 << ((byte)iVar20 & 0x1f), iVar20 <= iVar23)) {
                    iVar23 = iVar20 + -1;
                  }
                  iVar23 = -iVar23;
                }
                else {
                  iVar23 = (iVar19 + iVar14) / iVar23;
                  if ((0 < iVar20) && (iVar20 = 1 << ((byte)iVar20 & 0x1f), iVar20 <= iVar23)) {
                    iVar23 = iVar20 + -1;
                  }
                }
                sStack_68 = (short)iVar23;
              }
              iVar20 = *(int *)(iVar13 + 0x10);
              if ((iVar20 != 0) && (sStack_76 == 0)) {
                iVar15 = (((iStack_e0 - iStack_b8) - iStack_dc) + iStack_bc) * uVar16;
                iVar14 = iVar15 * 5;
                iVar23 = (uint)uVar4 << 8;
                iVar19 = (uint)uVar4 * 0x80;
                if (iVar14 < 0) {
                  iVar23 = (iVar19 + iVar15 * -5) / iVar23;
                  if ((0 < iVar20) && (iVar20 = 1 << ((byte)iVar20 & 0x1f), iVar20 <= iVar23)) {
                    iVar23 = iVar20 + -1;
                  }
                  iVar23 = -iVar23;
                }
                else {
                  iVar23 = (iVar19 + iVar14) / iVar23;
                  if ((0 < iVar20) && (iVar20 = 1 << ((byte)iVar20 & 0x1f), iVar20 <= iVar23)) {
                    iVar23 = iVar20 + -1;
                  }
                }
                sStack_76 = (short)iVar23;
              }
              iVar20 = *(int *)(iVar13 + 0x14);
              if ((iVar20 != 0) && (sStack_84 == 0)) {
                iVar15 = (iVar17 + iVar21 * -2 + iStack_c8) * uVar16;
                iVar14 = iVar15 * 9;
                iVar23 = (uint)uVar5 << 8;
                iVar19 = (uint)uVar5 * 0x80;
                if (iVar14 < 0) {
                  iVar23 = (iVar19 + iVar15 * -9) / iVar23;
                  if ((0 < iVar20) && (iVar20 = 1 << ((byte)iVar20 & 0x1f), iVar20 <= iVar23)) {
                    iVar23 = iVar20 + -1;
                  }
                  iVar23 = -iVar23;
                }
                else {
                  iVar23 = (iVar19 + iVar14) / iVar23;
                  if ((0 < iVar20) && (iVar20 = 1 << ((byte)iVar20 & 0x1f), iVar20 <= iVar23)) {
                    iVar23 = iVar20 + -1;
                  }
                }
                sStack_84 = (short)iVar23;
              }
              (*pcVar9)(param_1,local_10c,&uStack_88,iStack_ec,iStack_b0);
              iStack_bc = iVar12;
              iStack_b8 = iVar11;
              psStack_d0 = psStack_d0 + 0x40;
              iStack_b0 = iStack_b0 + *(int *)(local_10c + 0x24);
              uStack_e4 = uStack_e4 + 1;
              iStack_c8 = iVar21;
            } while (uStack_e4 <= uVar18);
            iStack_ec = iStack_ec + *(int *)(local_10c + 0x24) * 4;
            iStack_d4 = iStack_d4 + 1;
          } while (iStack_d4 < (int)uStack_108);
        }
      }
      local_10c = local_10c + 0x54;
      local_cc = local_cc + 1;
      local_c4 = local_c4 + 0x18;
      local_f0 = local_f0 + 1;
    } while (local_cc < *(int *)(param_1 + 0x2c));
  }
  uVar24 = *(int *)(param_1 + 0x90) + 1;
  *(uint *)(param_1 + 0x90) = uVar24;
  return 4 - (uint)(uVar24 < *(uint *)(param_1 + 0x124));
}


