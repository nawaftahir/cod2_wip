// 1006ad34 size=1332 FUN_1006ad34

int FUN_1006ad34(int param_1,int param_2)

{
  byte bVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  undefined4 *in_ECX;
  uint uVar5;
  byte *pbVar6;
  byte *pbVar7;
  byte *pbVar8;
  bool bVar9;
  char *pcVar10;
  byte local_40 [16];
  int local_30;
  undefined4 local_2c;
  int local_28;
  int local_24;
  byte *local_20;
  byte *local_1c;
  byte *local_18;
  undefined4 local_14;
  undefined4 *local_10;
  int local_c;
  uint local_8;
  
  pbVar6 = *(byte **)(param_1 + 8);
  bVar1 = *pbVar6;
  local_c = 0;
  local_8 = 0;
  local_14 = 0;
  local_2c = 0;
  local_30 = 1;
  local_24 = 0;
  local_28 = 0;
  local_1c = pbVar6;
  local_18 = pbVar6;
  local_20 = pbVar6;
  while (bVar1 != 0) {
    while ((*pbVar6 != 0 && (*pbVar6 != 0x5f))) {
      pbVar6 = pbVar6 + 1;
      local_18 = pbVar6;
    }
    uVar2 = (int)pbVar6 - (int)local_20;
    if (0xf < uVar2) goto LAB_1006b10a;
    pbVar7 = local_20;
    pbVar8 = local_40;
    local_10 = in_ECX;
    for (uVar5 = uVar2 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
      *(undefined4 *)pbVar8 = *(undefined4 *)pbVar7;
      pbVar7 = pbVar7 + 4;
      pbVar8 = pbVar8 + 4;
    }
    bVar1 = *pbVar6;
    for (uVar5 = uVar2 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
      *pbVar8 = *pbVar7;
      pbVar7 = pbVar7 + 1;
      pbVar8 = pbVar8 + 1;
    }
    local_40[uVar2] = 0;
    if (bVar1 != 0) {
      pbVar6 = pbVar6 + 1;
      local_18 = pbVar6;
    }
    local_20 = pbVar6;
    if (local_30 != 0) {
      pbVar6 = local_40;
      if (local_40[0] == 0) {
LAB_1006ae34:
        local_8 = 0xffffffff;
      }
      else {
        do {
          iVar4 = _isalpha((int)(char)*pbVar6);
          if (iVar4 == 0) break;
          pbVar6 = pbVar6 + 1;
        } while (*pbVar6 != 0);
        if (*pbVar6 == 0) goto LAB_1006ae34;
        local_8 = _atol((char *)pbVar6);
      }
      if (*pbVar6 != 0) {
        *pbVar6 = 0;
        pbVar6 = pbVar6 + 1;
      }
      bVar1 = *pbVar6;
      if (bVar1 != 0) {
        do {
          iVar4 = _isdigit((int)(char)bVar1);
          if (iVar4 == 0) break;
          pbVar6 = pbVar6 + 1;
          bVar1 = *pbVar6;
        } while (bVar1 != 0);
        in_ECX = local_10;
        if (*pbVar6 != 0) goto LAB_1006b10a;
      }
      iVar4 = 0;
      uVar2 = 0;
      do {
        pbVar7 = *(byte **)((int)&PTR_DAT_1010e2d0 + uVar2);
        pbVar6 = local_40;
        do {
          bVar1 = *pbVar6;
          bVar9 = bVar1 < *pbVar7;
          if (bVar1 != *pbVar7) {
LAB_1006ae95:
            iVar3 = (1 - (uint)bVar9) - (uint)(bVar9 != 0);
            goto LAB_1006ae9c;
          }
          if (bVar1 == 0) break;
          bVar1 = pbVar6[1];
          bVar9 = bVar1 < pbVar7[1];
          if (bVar1 != pbVar7[1]) goto LAB_1006ae95;
          pbVar6 = pbVar6 + 2;
          pbVar7 = pbVar7 + 2;
        } while (bVar1 != 0);
        iVar3 = 0;
LAB_1006ae9c:
        if (iVar3 == 0) break;
        uVar2 = uVar2 + 0x48;
        iVar4 = iVar4 + 1;
      } while (uVar2 < 0x5e8);
      in_ECX = local_10;
      if (iVar4 != 0x15) {
        iVar3 = local_10[0xe];
        uVar2 = *(uint *)(&DAT_1010e2d8 + (iVar3 + iVar4 * 0x12) * 4);
        if (uVar2 != 0xffffffff) {
          if ((int)uVar2 < 0) {
            if (local_8 == 0xffffffff) {
              if (param_2 == 0) goto LAB_1006b10a;
              local_8 = *(uint *)(param_2 + 0x18);
            }
            else if (param_2 != 0) {
              local_8 = local_8 + *(int *)(param_2 + 0x18);
            }
            uVar2 = -uVar2;
          }
          else if (param_2 != 0) goto LAB_1006b10a;
          if (local_8 == 0xffffffff) {
            if (uVar2 == 0) {
              local_8 = 0;
LAB_1006af2f:
              local_c = (&DAT_1010e2d4)[iVar4 * 0x12];
              local_2c = (&DAT_1010e314)[iVar4 * 0x12];
              if (local_c == 2) {
                uVar2 = local_8 & 0x1fff;
                if (uVar2 < 0x800) {
                  local_c = 2;
                }
                else if (uVar2 < 0x1000) {
                  local_c = 0xb;
                }
                else if (uVar2 < 0x1800) {
                  local_c = 0xc;
                }
                else if (uVar2 < 0x2000) {
                  local_c = 0xd;
                }
                local_8 = local_8 & 0x7ff;
              }
              else if (local_c == -3) {
                local_c = 4;
LAB_1006afac:
                local_8 = 0;
              }
              else if (local_c == -4) {
                local_c = 4;
                local_8 = 2;
              }
              else {
                if (local_c == -5) {
                  local_c = 4;
                }
                else {
                  if (local_c == -6) {
                    local_c = 0x11;
                    goto LAB_1006afac;
                  }
                  if (local_c != -7) goto LAB_1006aff1;
                  local_c = 0x11;
                }
                local_8 = 1;
              }
LAB_1006aff1:
              local_30 = 0;
              if ((5 < iVar3) && (iVar3 < 10)) {
                local_24 = 1;
              }
              pbVar6 = local_18;
              if (((3 < iVar3) && (iVar3 < 6)) || ((0xc < iVar3 && (iVar3 < 0xf)))) {
                local_28 = 1;
              }
              goto LAB_1006b023;
            }
          }
          else if (((param_2 != 0) && (*(int *)(param_2 + 0x28) != 0)) || (local_8 < uVar2))
          goto LAB_1006af2f;
        }
      }
LAB_1006b10a:
      if (in_ECX[0x1e] != 0) {
        iVar4 = FUN_1006a8c3(*in_ECX,in_ECX[0x1f],param_1,local_1c,param_2,&local_c,&local_14,
                             &local_8);
        if (iVar4 < 0) goto LAB_1006b229;
        goto LAB_1006b139;
      }
      if (param_2 == 0) {
        pcVar10 = "invalid register \'%s\'";
      }
      else {
        if (*(int *)(param_2 + 0x28) == 0) {
          FUN_10067c3e(*in_ECX,param_1,0x7d5,"invalid register \'%s[%u]\'",local_1c,
                       *(undefined4 *)(param_2 + 0x18));
          goto LAB_1006b229;
        }
        if (*(int *)(*(int *)(param_2 + 0x28) + 0x10) == -1) goto LAB_1006b229;
        pcVar10 = "invalid register \'%s[...]\'";
      }
      FUN_10067c3e(*in_ECX,param_1,0x7d5,pcVar10,local_1c);
      goto LAB_1006b229;
    }
    if (local_24 == 0) {
LAB_1006b0df:
      in_ECX = local_10;
      if (local_28 != 0) {
        iVar4 = 4;
        bVar9 = true;
        pbVar7 = local_40;
        pbVar8 = &DAT_1010eaa0;
        do {
          if (iVar4 == 0) break;
          iVar4 = iVar4 + -1;
          bVar9 = *pbVar7 == *pbVar8;
          pbVar7 = pbVar7 + 1;
          pbVar8 = pbVar8 + 1;
        } while (bVar9);
        if (bVar9) {
          local_14 = 0xb000000;
          local_28 = 0;
          goto LAB_1006b023;
        }
      }
      goto LAB_1006b10a;
    }
    iVar4 = 5;
    bVar9 = true;
    pbVar7 = local_40;
    pbVar8 = &DAT_1010f404;
    do {
      if (iVar4 == 0) break;
      iVar4 = iVar4 + -1;
      bVar9 = *pbVar7 == *pbVar8;
      pbVar7 = pbVar7 + 1;
      pbVar8 = pbVar8 + 1;
    } while (bVar9);
    if (bVar9) {
      local_14 = 0x2000000;
    }
    else {
      iVar4 = 4;
      bVar9 = true;
      pbVar7 = local_40;
      pbVar8 = &DAT_1010f400;
      do {
        if (iVar4 == 0) break;
        iVar4 = iVar4 + -1;
        bVar9 = *pbVar7 == *pbVar8;
        pbVar7 = pbVar7 + 1;
        pbVar8 = pbVar8 + 1;
      } while (bVar9);
      if (bVar9) {
        local_14 = 0x4000000;
      }
      else {
        iVar4 = 3;
        bVar9 = true;
        pbVar7 = local_40;
        pbVar8 = &DAT_1010ece0;
        do {
          if (iVar4 == 0) break;
          iVar4 = iVar4 + -1;
          bVar9 = *pbVar7 == *pbVar8;
          pbVar7 = pbVar7 + 1;
          pbVar8 = pbVar8 + 1;
        } while (bVar9);
        if (bVar9) {
          local_14 = 0x7000000;
        }
        else {
          iVar4 = 3;
          bVar9 = true;
          pbVar7 = local_40;
          pbVar8 = &DAT_1010f3fc;
          do {
            if (iVar4 == 0) break;
            iVar4 = iVar4 + -1;
            bVar9 = *pbVar7 == *pbVar8;
            pbVar7 = pbVar7 + 1;
            pbVar8 = pbVar8 + 1;
          } while (bVar9);
          if (!bVar9) {
            iVar4 = 3;
            bVar9 = true;
            pbVar7 = local_40;
            pbVar8 = &DAT_1010f3f8;
            do {
              if (iVar4 == 0) break;
              iVar4 = iVar4 + -1;
              bVar9 = *pbVar7 == *pbVar8;
              pbVar7 = pbVar7 + 1;
              pbVar8 = pbVar8 + 1;
            } while (bVar9);
            if (!bVar9) {
              iVar4 = 3;
              bVar9 = true;
              pbVar7 = local_40;
              pbVar8 = &DAT_1010f3f4;
              do {
                if (iVar4 == 0) break;
                iVar4 = iVar4 + -1;
                bVar9 = *pbVar7 == *pbVar8;
                pbVar7 = pbVar7 + 1;
                pbVar8 = pbVar8 + 1;
              } while (bVar9);
              if (!bVar9) {
                iVar4 = 3;
                bVar9 = true;
                pbVar7 = local_40;
                pbVar8 = &DAT_1010f3f0;
                do {
                  if (iVar4 == 0) break;
                  iVar4 = iVar4 + -1;
                  bVar9 = *pbVar7 == *pbVar8;
                  pbVar7 = pbVar7 + 1;
                  pbVar8 = pbVar8 + 1;
                } while (bVar9);
                if (!bVar9) goto LAB_1006b0df;
              }
              local_14 = 0xa000000;
              goto LAB_1006b0d7;
            }
          }
          local_14 = 0x9000000;
        }
      }
    }
LAB_1006b0d7:
    local_24 = 0;
LAB_1006b023:
    in_ECX = local_10;
    bVar1 = *pbVar6;
  }
  if (in_ECX[0x1e] == 0) {
LAB_1006b139:
    iVar4 = FUN_1006506e(0x2c);
    if (iVar4 == 0) {
      iVar4 = 0;
    }
    else {
      iVar4 = FUN_10085208(local_c,local_14,local_8,local_2c,0);
    }
    if (iVar4 != 0) {
      if (param_2 == 0) {
        return iVar4;
      }
      *(undefined4 *)(iVar4 + 0x28) = *(undefined4 *)(param_2 + 0x28);
      *(undefined4 *)(param_2 + 0x28) = 0;
      return iVar4;
    }
  }
  else {
    if (*(int *)(in_ECX[0x1e] + 0xb0) == 0) {
      if ((((((local_c == 3) || (local_c == 5)) || (local_c == 6)) ||
           ((local_c == 8 || (local_c == 9)))) ||
          ((local_c == 4 || ((local_c == 0xf || (local_c == 0x12)))))) || (local_c == 0x13))
      goto LAB_1006b139;
      pcVar10 = "temporary and constant registers are not allowed in assembly fragments";
    }
    else {
      if ((((local_c == 3) || (local_c == 0xf)) || (local_c == 0x12)) || (local_c == 0x13))
      goto LAB_1006b139;
      pcVar10 = 
      "temporary, constant, and output registers are not allowed in vs_3_0 assembly fragments";
    }
    FUN_10067c3e(*in_ECX,param_1,0x7d5,pcVar10);
LAB_1006b229:
    in_ECX[0x13] = 1;
    iVar4 = FUN_1006506e(0x2c);
    if (iVar4 != 0) {
      iVar4 = FUN_10085208(0xffffffff,0,0,0,0);
      return iVar4;
    }
  }
  return 0;
}


