// 1009acc9 size=1720 FUN_1009acc9

undefined4 FUN_1009acc9(int param_1,int *param_2,uint *param_3,int *param_4)

{
  byte bVar1;
  byte *pbVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  uint *puVar6;
  uint *puVar7;
  int iVar8;
  uint uVar9;
  uint uVar10;
  int *piVar11;
  byte *pbVar12;
  int *piVar13;
  byte *pbVar14;
  undefined4 *puVar15;
  undefined **ppuVar16;
  bool bVar17;
  uint local_14c [10];
  int local_124 [29];
  undefined1 local_b0 [20];
  undefined4 local_9c;
  undefined1 local_8c [20];
  uint local_78;
  int aiStack_68 [5];
  uint local_54 [16];
  uint local_14;
  int *local_10;
  uint local_c;
  uint local_8;
  
  if (param_3 != (uint *)0x0) {
    *param_3 = 0;
  }
  if (param_4 != (int *)0x0) {
    *param_4 = 0;
  }
  uVar9 = 0;
  iVar8 = (int)param_2;
  if (param_2 != (int *)0x0) {
    do {
      iVar5 = *(int *)(iVar8 + 8);
      if ((((iVar5 == 0) || (*(int *)(iVar5 + 4) != 0xd)) || (*(int *)(iVar5 + 0x10) == 0)) ||
         (*(int *)(*(int *)(iVar5 + 0x10) + 4) != 9)) break;
      iVar8 = *(int *)(iVar8 + 0xc);
      uVar9 = uVar9 + 1;
    } while (iVar8 != 0);
    if ((iVar8 != 0) || (4 < uVar9)) {
      return 1;
    }
  }
  pbVar2 = *(byte **)(param_1 + 8);
  local_8 = 0x5e;
  uVar9 = 0;
  do {
    local_14 = local_8 + uVar9 >> 1;
    pbVar12 = (&PTR_s_D3DCOLORtoUBYTE4_101107fc)[local_14 * 0x29];
    pbVar14 = pbVar2;
    do {
      bVar1 = *pbVar14;
      bVar17 = bVar1 < *pbVar12;
      if (bVar1 != *pbVar12) {
LAB_1009ad74:
        iVar8 = (1 - (uint)bVar17) - (uint)(bVar17 != 0);
        goto LAB_1009ad79;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar14[1];
      bVar17 = bVar1 < pbVar12[1];
      if (bVar1 != pbVar12[1]) goto LAB_1009ad74;
      pbVar14 = pbVar14 + 2;
      pbVar12 = pbVar12 + 2;
    } while (bVar1 != 0);
    iVar8 = 0;
LAB_1009ad79:
    if (iVar8 < 1) {
      local_8 = local_14;
      if (-1 < iVar8) {
        local_8 = local_14 + 1;
        if (local_14 == 0) goto LAB_1009ade4;
        puVar15 = (undefined4 *)(&UNK_10110758 + local_14 * 0xa4);
        goto LAB_1009ada9;
      }
    }
    else {
      uVar9 = local_14 + 1;
    }
    local_14 = uVar9;
    uVar9 = local_14;
  } while (local_14 < local_8);
  goto LAB_1009ae37;
  while( true ) {
    local_14 = local_14 - 1;
    puVar15 = puVar15 + -0x29;
    if (local_14 == 0) break;
LAB_1009ada9:
    pbVar12 = (byte *)*puVar15;
    pbVar14 = pbVar2;
    do {
      bVar1 = *pbVar14;
      bVar17 = bVar1 < *pbVar12;
      if (bVar1 != *pbVar12) {
LAB_1009add0:
        iVar8 = (1 - (uint)bVar17) - (uint)(bVar17 != 0);
        goto LAB_1009add5;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar14[1];
      bVar17 = bVar1 < pbVar12[1];
      if (bVar1 != pbVar12[1]) goto LAB_1009add0;
      pbVar14 = pbVar14 + 2;
      pbVar12 = pbVar12 + 2;
    } while (bVar1 != 0);
    iVar8 = 0;
LAB_1009add5:
    if (iVar8 != 0) break;
  }
LAB_1009ade4:
  if (local_8 < 0x5e) {
    ppuVar16 = &PTR_s_D3DCOLORtoUBYTE4_101107fc + local_8 * 0x29;
    do {
      pbVar12 = *ppuVar16;
      pbVar14 = pbVar2;
      do {
        bVar1 = *pbVar14;
        bVar17 = bVar1 < *pbVar12;
        if (bVar1 != *pbVar12) {
LAB_1009ae1f:
          iVar8 = (1 - (uint)bVar17) - (uint)(bVar17 != 0);
          goto LAB_1009ae24;
        }
        if (bVar1 == 0) break;
        bVar1 = pbVar14[1];
        bVar17 = bVar1 < pbVar12[1];
        if (bVar1 != pbVar12[1]) goto LAB_1009ae1f;
        pbVar14 = pbVar14 + 2;
        pbVar12 = pbVar12 + 2;
      } while (bVar1 != 0);
      iVar8 = 0;
LAB_1009ae24:
      if (iVar8 != 0) break;
      local_8 = local_8 + 1;
      ppuVar16 = ppuVar16 + 0x29;
    } while (local_8 < 0x5e);
  }
LAB_1009ae37:
  if (local_14 == local_8) {
    return 1;
  }
  if (local_14 < local_8) {
    local_10 = (int *)(&DAT_101107f8 + local_14 * 0xa4);
    do {
      piVar11 = local_10;
      local_54[0] = 0xffffffff;
      local_54[1] = 0xffffffff;
      local_54[2] = 0xffffffff;
      local_54[3] = 0xffffffff;
      local_54[4] = 0xffffffff;
      local_54[10] = 0x1e;
      local_54[0xb] = 0x1e;
      local_54[0xc] = 0x1e;
      local_54[0xd] = 0x1e;
      local_54[0xe] = 0x1e;
      local_54[5] = 5;
      local_54[6] = 5;
      local_54[7] = 5;
      local_54[8] = 5;
      local_54[9] = 5;
      FUN_10082e0f();
      FUN_10082e0f();
      local_c = 1;
      if (param_2 == (int *)0x0) {
LAB_1009afe7:
        if (piVar11[2] != 0) {
          if (local_54[piVar11[3] + 5] == 5) {
            local_54[piVar11[3] + 5] = *(uint *)piVar11[4];
          }
          if (local_54[piVar11[5] + 10] == 0x1e) {
            local_54[piVar11[5] + 10] = *(uint *)piVar11[6];
          }
        }
        local_c = 0;
        piVar11 = local_10 + 6;
        do {
          puVar6 = (uint *)piVar11[-2];
          puVar7 = local_54 + local_c + 5;
          uVar9 = *puVar7;
          if (uVar9 == 5) {
            if (puVar6 != (uint *)0x0) {
              *puVar7 = *puVar6;
            }
          }
          else {
            if ((uVar9 == 0) && ((uVar3 = *puVar6, uVar3 == 1 || (uVar3 == 2)))) {
              *puVar7 = uVar3;
            }
            else {
              for (; (*puVar6 != 5 && (uVar9 != *puVar6)); puVar6 = puVar6 + 1) {
              }
            }
            if (*puVar6 == 5) break;
          }
          puVar7 = (uint *)*piVar11;
          uVar9 = local_54[local_c + 10];
          puVar6 = puVar7;
          if (uVar9 == 0x1e) {
            if (puVar7 != (uint *)0x0) {
              uVar9 = *puVar7;
LAB_1009b077:
              local_54[local_c + 10] = uVar9;
            }
          }
          else {
            for (; (*puVar6 != 0x1e && (uVar9 != *puVar6)); puVar6 = puVar6 + 1) {
            }
            if (*puVar6 == 0x1e) {
              uVar9 = *puVar7;
              goto LAB_1009b077;
            }
          }
          if (local_54[local_c] == 0xffffffff) {
            local_54[local_c] = 1;
          }
          local_c = local_c + 1;
          piVar11 = piVar11 + 8;
        } while (local_c < 5);
        if (local_c == 5) break;
      }
      else {
        piVar11 = piVar11 + 0xb;
        iVar8 = (int)param_2;
        do {
          if ((4 < local_c) || (piVar11[-2] == 0)) break;
          iVar5 = *(int *)(*(int *)(iVar8 + 8) + 0x10);
          uVar9 = local_54[*piVar11 + 5];
          if ((uVar9 == 5) ||
             ((uVar9 == 0 && ((*(int *)(iVar5 + 0x10) == 1 || (*(int *)(iVar5 + 0x10) == 2)))))) {
            iVar4 = *piVar11;
            local_54[iVar4 + 5] = *(uint *)(iVar5 + 0x10);
            aiStack_68[iVar4] = piVar11[1];
          }
          else {
            if (*(uint *)(iVar5 + 0x10) == 0) {
              if ((uVar9 == 0) || (uVar9 == 1)) goto LAB_1009af0f;
              bVar17 = uVar9 == 2;
            }
            else {
              bVar17 = *(uint *)(iVar5 + 0x10) == uVar9;
            }
            if (!bVar17) break;
          }
LAB_1009af0f:
          iVar4 = piVar11[2];
          if (local_54[iVar4 + 10] == 0x1e) {
            local_54[iVar4 + 10] = *(uint *)(iVar5 + 0x14);
            aiStack_68[iVar4] = piVar11[3];
          }
          else {
            local_78 = local_54[iVar4 + 10];
            local_9c = *(undefined4 *)(iVar5 + 0x14);
            iVar4 = FUN_1009a02d(local_8c,local_b0,local_54 + piVar11[2] + 10);
            if (iVar4 < 0) break;
          }
          iVar4 = *(int *)(iVar5 + 0x10);
          if (iVar4 != 0) {
            uVar9 = piVar11[4];
            if ((int)uVar9 < 0) {
              if (*(uint *)(iVar5 + 0x18) < local_54[~uVar9]) {
                local_54[~uVar9] = *(uint *)(iVar5 + 0x18);
              }
            }
            else if (*(uint *)(iVar5 + 0x18) < uVar9) break;
            if (iVar4 != 0) {
              uVar9 = piVar11[5];
              if ((int)uVar9 < 0) {
                if (*(uint *)(iVar5 + 0x1c) < local_54[~uVar9]) {
                  local_54[~uVar9] = *(uint *)(iVar5 + 0x1c);
                }
              }
              else if (*(uint *)(iVar5 + 0x1c) < uVar9) break;
            }
          }
          if (((*(byte *)(piVar11 + -1) & 0x20) != 0) && (iVar5 = FUN_10099a41(iVar5), iVar5 != 0))
          break;
          iVar8 = *(int *)(iVar8 + 0xc);
          local_c = local_c + 1;
          piVar11 = piVar11 + 8;
        } while (iVar8 != 0);
        if ((iVar8 == 0) && ((piVar11 = local_10, 4 < local_c || (local_10[local_c * 8 + 1] == 0))))
        goto LAB_1009afe7;
      }
      local_14 = local_14 + 1;
      local_10 = local_10 + 0x29;
    } while (local_14 < local_8);
  }
  if (local_14 == local_8) {
    return 1;
  }
  if (param_3 != (uint *)0x0) {
    iVar8 = 5;
    do {
      FUN_10082e0f();
      iVar8 = iVar8 + -1;
    } while (iVar8 != 0);
    uVar9 = 0;
    iVar8 = local_14 * 0xa4;
    puVar7 = local_14c;
    puVar6 = (uint *)(&UNK_10110814 + iVar8);
    do {
      if (puVar6[-6] == 0) break;
      uVar3 = puVar6[-5];
      if (uVar3 != 0) {
        puVar7[-2] = local_54[puVar6[-4] + 5];
        puVar7[-1] = local_54[puVar6[-2] + 10];
        uVar10 = *puVar6;
        if ((int)uVar10 < 0) {
          uVar10 = local_54[~uVar10];
        }
        *puVar7 = uVar10;
        uVar10 = puVar6[1];
        if ((int)uVar10 < 0) {
          uVar10 = local_54[~uVar10];
        }
        puVar7[1] = uVar10;
        puVar7[2] = uVar3 & 0xc00;
        if ((uVar9 == 0) || ((uVar3 & 0x20) == 0)) {
          puVar7[2] = uVar3 & 0xc00 | 0x200;
        }
      }
      uVar9 = uVar9 + 1;
      puVar6 = puVar6 + 8;
      puVar7 = puVar7 + 9;
    } while (uVar9 < 5);
    iVar5 = FUN_1006506e(0x40);
    if (iVar5 == 0) {
      local_8 = 0;
    }
    else {
      local_8 = FUN_10082eb4();
    }
    uVar9 = local_8;
    if (local_8 == 0) {
      return 0x8007000e;
    }
    if (*(int *)(&UNK_10110800 + iVar8) != 0) {
      iVar5 = FUN_100839cd();
      *(int *)(uVar9 + 0x20) = iVar5;
      if (iVar5 == 0) {
        return 0x8007000e;
      }
    }
    piVar13 = (int *)(uVar9 + 0x24);
    param_2 = (int *)(&UNK_1011081c + iVar8);
    local_c = 1;
    piVar11 = local_124;
    do {
      local_10 = piVar13;
      if (*param_2 == 0) break;
      iVar8 = FUN_1006506e(0x14);
      if (iVar8 == 0) {
        iVar8 = 0;
      }
      else {
        iVar8 = FUN_10082872(0,0,"Decls");
      }
      *piVar13 = iVar8;
      if (iVar8 == 0) {
        return 0x8007000e;
      }
      iVar8 = FUN_1006506e(0x30);
      if (iVar8 == 0) {
        iVar8 = 0;
      }
      else {
        iVar8 = FUN_10082c4b(1,0,0,0);
      }
      if (iVar8 == 0) {
        return 0x8007000e;
      }
      *(int *)(*local_10 + 8) = iVar8;
      iVar5 = FUN_1006506e(0x30);
      if (iVar5 == 0) {
        iVar5 = 0;
      }
      else {
        iVar5 = FUN_10082a7b(param_1);
      }
      *(int *)(iVar8 + 0x14) = iVar5;
      if (iVar5 == 0) {
        return 0x8007000e;
      }
      *(int *)(iVar5 + 0x18) = *param_2;
      iVar5 = FUN_1006506e(0x40);
      if (iVar5 == 0) {
        iVar5 = 0;
      }
      else {
        iVar5 = FUN_1008300b();
      }
      if (iVar5 == 0) {
        return 0x8007000e;
      }
      *(int *)(iVar8 + 0x18) = iVar5;
      *(undefined4 *)(iVar5 + 0x10) = 0xffffffff;
      *(int *)(iVar5 + 0x14) = piVar11[-1] * *piVar11;
      *(undefined4 *)(iVar5 + 0x18) = 2;
      *(int *)(iVar5 + 0x1c) = param_2[1];
      iVar8 = FUN_100839cd();
      *(int *)(iVar5 + 0x20) = iVar8;
      if (iVar8 == 0) {
        return 0x8007000e;
      }
      param_2 = param_2 + 8;
      piVar13 = (int *)(*local_10 + 0xc);
      local_c = local_c + 1;
      piVar11 = piVar11 + 9;
      local_10 = piVar13;
    } while (local_c < 5);
    *param_3 = local_8;
  }
  uVar9 = local_14;
  iVar8 = 0;
  if (param_4 == (int *)0x0) {
    return 0;
  }
  iVar5 = FUN_1006506e(0x14);
  if (iVar5 != 0) {
    iVar8 = FUN_10082872(0,0,"Values");
  }
  if (iVar8 != 0) {
    iVar5 = FUN_1006506e(0x40);
    if (iVar5 == 0) {
      iVar5 = 0;
    }
    else {
      iVar5 = FUN_100833a3(2,*(undefined4 *)(&DAT_101107f8 + uVar9 * 0xa4),param_1);
    }
    *(int *)(iVar8 + 8) = iVar5;
    if (iVar5 != 0) {
      *param_4 = iVar8;
      return 0;
    }
  }
  return 0x8007000e;
}


