// 1008e097 size=3965 FUN_1008e097

undefined4 FUN_1008e097(uint *param_1,int param_2,int param_3,uint param_4)

{
  uint **ppuVar1;
  bool bVar2;
  uint uVar3;
  uint *puVar4;
  int *piVar5;
  uint *puVar6;
  uint *puVar7;
  undefined *puVar8;
  int iVar9;
  int iVar10;
  uint *puVar11;
  int in_ECX;
  uint uVar12;
  uint uVar13;
  undefined *puVar14;
  uint *puVar15;
  uint uVar16;
  uint uVar17;
  bool bVar18;
  ushort uVar19;
  float10 fVar20;
  float10 fVar21;
  undefined4 uVar22;
  double dVar23;
  undefined8 uVar24;
  undefined8 local_50;
  uint *local_48 [5];
  uint *local_34;
  uint *local_30;
  uint *local_2c;
  uint local_28;
  int local_24;
  uint *local_20;
  int local_1c;
  uint *local_18;
  uint *local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  local_2c = (uint *)*param_1;
  iVar9 = *(int *)(in_ECX + 0x14);
  puVar7 = *(uint **)(*(int *)(iVar9 + param_3 * 4) + 0x30);
  puVar11 = *(uint **)(*(int *)(iVar9 + param_4 * 4) + 0x30);
  puVar15 = *(uint **)(iVar9 + param_2 * 4);
  local_20 = *(uint **)(iVar9 + (int)puVar7 * 4);
  local_18 = *(uint **)(iVar9 + (int)puVar11 * 4);
  uVar12 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + puVar15[1] * 4) + 4);
  if ((uVar12 & 1) == 0) {
    return 0;
  }
  if ((uVar12 & 0x1000) != 0) {
    return 0;
  }
  uVar12 = *local_20;
  uVar17 = *local_18;
  local_8 = uVar12 & 0x1f;
  local_c = uVar17 & 0x1f;
  uVar3 = *puVar15;
  local_28 = uVar3 & 0x40;
  if (((uVar3 & 0xe000000) == 0) &&
     (((((uVar16 = (uint)local_2c & 0xfff00000, uVar16 == 0x20000000 || (uVar16 == 0x20100000)) ||
        (uVar16 == 0x20400000)) || ((uVar16 == 0x20700000 || (uVar16 == 0x20800000)))) ||
      (uVar16 == 0x20900000)))) {
    uVar13 = uVar17 | uVar12;
    uVar16 = 0x8000000;
    if ((((uVar13 & 0x8000000) != 0) || (uVar16 = 0x4000000, (uVar13 & 0x4000000) != 0)) ||
       (uVar16 = 0x2000000, (uVar13 & 0x2000000) != 0)) {
      *puVar15 = uVar3 | uVar16;
    }
  }
  if (((*local_18 | *local_20) & 0x40) != 0) {
    uVar3 = (uint)local_2c & 0xfff00000;
    if (uVar3 < 0x20600001) {
      if (((uVar3 == 0x20600000) || (uVar3 == 0x20000000)) ||
         ((uVar3 == 0x20100000 || ((uVar3 == 0x20400000 || (uVar3 == 0x20500000)))))) {
LAB_1008e1d6:
        *puVar15 = *puVar15 | 0x40;
      }
    }
    else if (((uVar3 == 0x20700000) || (uVar3 == 0x20800000)) || (uVar3 == 0x20900000))
    goto LAB_1008e1d6;
  }
  local_10 = (uint)local_2c & 0xfff00000;
  if (local_10 < 0x20400001) {
    if (local_10 == 0x20400000) {
      uVar3 = local_c & local_8 & 0xe;
    }
    else if (local_10 == 0x20000000) {
      uVar3 = (local_8 | 8) & local_c | uVar12 & 8;
    }
    else {
      if (local_10 != 0x20100000) {
        if ((local_10 == 0x20200000) || (local_10 == 0x20300000)) {
          *puVar15 = *puVar15 | 0x17;
        }
        goto LAB_1008e369;
      }
      uVar3 = (local_8 | 4) & local_c | uVar12 & 4;
    }
LAB_1008e267:
    *puVar15 = *puVar15 | uVar3;
  }
  else if (local_10 == 0x20500000) {
    *puVar15 = *puVar15 | local_c & local_8 & 3;
    local_48[4] = (uint *)(uVar12 & 4);
    if (((local_48[4] != (uint *)0x0) && ((uVar17 & 4) != 0)) ||
       (((uVar12 & 8) != 0 && ((uVar17 & 8) != 0)))) {
      *puVar15 = *puVar15 | 4;
    }
    if (((local_48[4] != (uint *)0x0) && ((uVar17 & 8) != 0)) ||
       (((uVar12 & 8) != 0 && ((uVar17 & 4) != 0)))) {
      *puVar15 = *puVar15 | 8;
    }
    if (local_20 == local_18) {
      *puVar15 = *puVar15 | 4;
    }
    else if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + local_20[1] * 4) + 4) & 2) == 0) ||
            (puVar4 = *(uint **)(*(int *)(in_ECX + 0x18) + local_20[0x12] * 4),
            (*puVar4 & 0xfff00000) != 0x10100000)) {
      if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + local_18[1] * 4) + 4) & 2) != 0) &&
         ((puVar4 = *(uint **)(*(int *)(in_ECX + 0x18) + local_18[0x12] * 4),
          (*puVar4 & 0xfff00000) == 0x10100000 && (uVar3 = 0, puVar4[3] != 0)))) {
        puVar6 = (uint *)puVar4[4];
        do {
          if ((uint *)*puVar6 == puVar11) break;
          uVar3 = uVar3 + 1;
          puVar6 = puVar6 + 1;
        } while (uVar3 < puVar4[3]);
        if (uVar3 < puVar4[3]) {
          bVar18 = *(uint **)(puVar4[2] + uVar3 * 4) == puVar7;
          goto LAB_1008e364;
        }
      }
    }
    else {
      uVar3 = 0;
      if (puVar4[3] != 0) {
        puVar6 = (uint *)puVar4[4];
        do {
          if ((uint *)*puVar6 == puVar7) break;
          uVar3 = uVar3 + 1;
          puVar6 = puVar6 + 1;
        } while (uVar3 < puVar4[3]);
        if (uVar3 < puVar4[3]) {
          bVar18 = *(uint **)(puVar4[2] + uVar3 * 4) == puVar11;
LAB_1008e364:
          if (bVar18) {
            *puVar15 = *puVar15 | 8;
          }
        }
      }
    }
  }
  else if (((local_10 == 0x20700000) || (local_10 == 0x20800000)) || (local_10 == 0x20900000)) {
    uVar3 = local_c & local_8;
    goto LAB_1008e267;
  }
LAB_1008e369:
  local_14 = puVar15;
  if (local_28 == 0) {
    if (((uVar12 & 4) == 0) || ((uVar17 & 8) == 0)) {
LAB_1008e3c7:
      if ((((uVar12 & 8) != 0) && ((uVar17 & 4) != 0)) &&
         ((puVar4 = puVar7, local_10 == 0x20000000 || (puVar4 = puVar11, local_10 == 0x20100000))))
      goto LAB_1008eafc;
      goto LAB_1008e3e5;
    }
    puVar4 = puVar11;
    if ((local_10 == 0x20000000) || (puVar4 = puVar7, local_10 == 0x20100000)) goto LAB_1008eafc;
    if (local_10 == 0x20200000) {
      dVar23 = 0.0;
    }
    else {
      if (local_10 != 0x20300000) goto LAB_1008e3c7;
      dVar23 = 1.0;
    }
LAB_1008e3a4:
    puVar4 = (uint *)FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,dVar23);
LAB_1008eafc:
    puVar15[0xc] = (uint)puVar4;
    return 0;
  }
LAB_1008e3e5:
  local_24 = *(int *)(in_ECX + 0x10);
  local_48[4] = *(uint **)(*(int *)(local_24 + local_20[1] * 4) + 4);
  uVar3 = (uint)local_48[4] & 0x100;
  if ((((uVar3 != 0) && (local_20[2] == 0xffffffff)) &&
      ((*(uint *)(*(int *)(local_24 + local_18[1] * 4) + 4) & 0x100) != 0)) &&
     (local_18[2] == 0xffffffff)) {
    fVar20 = (float10)*(double *)(local_20 + 8);
    dVar23 = *(double *)(local_18 + 8);
    if (local_10 == 0x20000000) {
      if ((float10)dVar23 <= fVar20) {
LAB_1008e4c5:
        fVar20 = (float10)dVar23;
      }
    }
    else {
      if (local_10 != 0x20100000) {
        if (local_10 == 0x20200000) {
          if (fVar20 < (float10)dVar23) goto LAB_1008e6c8;
        }
        else {
          if (local_10 != 0x20300000) {
            if (local_10 == 0x20400000) {
              fVar20 = fVar20 + (float10)dVar23;
            }
            else if (local_10 == 0x20500000) {
              fVar20 = fVar20 * (float10)dVar23;
            }
            else {
              if (local_10 != 0x20600000) {
                return 0;
              }
              fVar20 = (float10)fpatan(fVar20,(float10)dVar23);
            }
            goto LAB_1008e4ca;
          }
          if ((float10)dVar23 <= fVar20) goto LAB_1008e6c8;
        }
        goto LAB_1008e59c;
      }
      if (fVar20 < (float10)dVar23) goto LAB_1008e4c5;
    }
    goto LAB_1008e4ca;
  }
  if ((local_28 == 0) &&
     (((uVar3 != 0 && (local_20[2] == 0xffffffff)) ||
      (((*(uint *)(*(int *)(local_24 + local_18[1] * 4) + 4) & 0x100) != 0 &&
       (local_18[2] == 0xffffffff)))))) {
    if ((uVar3 == 0) || (local_20[2] != 0xffffffff)) {
      dVar23 = *(double *)(local_18 + 8);
      uVar12 = local_8;
      puVar4 = puVar7;
    }
    else {
      dVar23 = *(double *)(local_20 + 8);
      uVar12 = local_c;
      puVar4 = puVar11;
    }
    fVar20 = (float10)dVar23;
    if (local_10 == 0x20000000) {
      if (((float10)1.0 <= fVar20) && ((uVar12 & 1) != 0)) goto LAB_1008e7e4;
      if (fVar20 < (float10)0.0 == (fVar20 == (float10)0.0)) {
        return 0;
      }
      if ((uVar12 & 4) == 0) {
        return 0;
      }
    }
    else {
      if (local_10 != 0x20100000) {
        if (local_10 == 0x20200000) {
          fVar21 = (float10)0.0;
          if (puVar4 == puVar11) {
            if ((fVar20 < fVar21) && ((uVar12 & 4) != 0)) {
LAB_1008e6c8:
              fVar20 = (float10)1;
              goto LAB_1008e4ca;
            }
            if (((fVar20 < (float10)0.0) || ((uVar12 & 8) == 0)) &&
               ((fVar20 < (float10)1.0 || ((uVar12 & 1) == 0)))) {
              fVar21 = (float10)0.0;
LAB_1008e6f9:
              if (fVar20 != fVar21) {
                return 0;
              }
              uVar12 = uVar12 & 1;
              goto LAB_1008e70d;
            }
          }
          else if ((fVar20 < fVar21 == (fVar20 == fVar21)) || ((uVar12 & 4) == 0)) {
            if ((fVar20 <= (float10)0.0) || ((uVar12 & 8) == 0)) {
              uVar19 = (ushort)(fVar20 < (float10)1.0) << 8 |
                       (ushort)(fVar20 == (float10)1.0) << 0xe;
LAB_1008e78d:
              if (uVar19 != 0) {
                return 0;
              }
              if ((uVar12 & 1) == 0) {
                return 0;
              }
            }
            goto LAB_1008e6c8;
          }
LAB_1008e59c:
          fVar20 = (float10)0;
          goto LAB_1008e4ca;
        }
        if (local_10 == 0x20300000) {
          fVar21 = (float10)0.0;
          if (puVar4 == puVar11) {
            if ((fVar20 >= fVar21) || ((uVar12 & 4) == 0)) {
              if ((fVar20 < (float10)0.0) || ((uVar12 & 8) == 0)) {
                uVar19 = (ushort)(fVar20 < (float10)1.0) << 8;
                goto LAB_1008e78d;
              }
              goto LAB_1008e6c8;
            }
          }
          else {
            if ((fVar20 < fVar21 != (fVar20 == fVar21)) && ((uVar12 & 4) != 0)) goto LAB_1008e6c8;
            if (((fVar20 <= (float10)0.0) || ((uVar12 & 8) == 0)) &&
               ((fVar20 <= (float10)1.0 || ((uVar12 & 1) == 0)))) {
              fVar21 = (float10)1.0;
              goto LAB_1008e6f9;
            }
          }
          goto LAB_1008e59c;
        }
        if (local_10 == 0x20400000) {
          if (fVar20 != (float10)0.0) {
            return 0;
          }
          goto LAB_1008e7e4;
        }
        if (local_10 != 0x20500000) {
          if (local_10 != 0x20600000) {
            return 0;
          }
          if (fVar20 != (float10)0.0) {
            return 0;
          }
          if (puVar4 != puVar7) {
            return 0;
          }
          goto LAB_1008e59c;
        }
        if (fVar20 == (float10)0.0) goto LAB_1008e59c;
        if (fVar20 == (float10)1.0) goto LAB_1008e7e4;
        if (fVar20 != (float10)0.5) {
          return 0;
        }
        iVar9 = *(int *)(in_ECX + 0x14);
        iVar10 = *(int *)(iVar9 + (int)puVar4 * 4);
        if ((*(byte *)(*(int *)(local_24 + *(int *)(iVar10 + 4) * 4) + 4) & 2) == 0) {
          return 0;
        }
        puVar7 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar10 + 0x48) * 4);
        if ((*puVar7 & 0xfff00000) != 0x20400000) {
          return 0;
        }
        uVar12 = puVar7[3];
        uVar17 = 0;
        if (uVar12 != 0) {
          puVar11 = (uint *)puVar7[4];
          do {
            if ((uint *)*puVar11 == puVar4) break;
            uVar17 = uVar17 + 1;
            puVar11 = puVar11 + 1;
          } while (uVar17 < uVar12);
        }
        if (uVar12 <= uVar17) {
          return 0;
        }
        uVar3 = puVar7[2];
        if (*(int *)(uVar3 + uVar17 * 4) != *(int *)(uVar3 + (uVar12 + uVar17) * 4)) {
          return 0;
        }
        iVar10 = *(int *)(uVar17 * 4 + uVar3);
LAB_1008e658:
        puVar11 = *(uint **)(*(int *)(iVar9 + iVar10 * 4) + 0x30);
        goto LAB_1008f005;
      }
      if ((fVar20 < (float10)1.0) || ((uVar12 & 1) == 0)) {
        if (fVar20 < (float10)0.0 == (fVar20 == (float10)0.0)) {
          return 0;
        }
        uVar12 = uVar12 & 4;
LAB_1008e70d:
        if (uVar12 == 0) {
          return 0;
        }
LAB_1008e7e4:
        puVar15[0xc] = (uint)puVar4;
        return 0;
      }
    }
LAB_1008e4ca:
    dVar23 = (double)fVar20;
    goto LAB_1008e3a4;
  }
  if (local_20 == local_18) {
    puVar4 = puVar7;
    if ((local_10 == 0x20000000) || (local_10 == 0x20100000)) goto LAB_1008eafc;
    if (local_10 != 0x20200000) {
      if (local_10 == 0x20300000) {
        if (local_28 != 0) {
          return 0;
        }
        dVar23 = 1.0;
        goto LAB_1008e3a4;
      }
      if ((local_10 == 0x20500000) && ((uVar12 & 1) != 0)) goto LAB_1008eafc;
      goto LAB_1008e856;
    }
    if (local_28 != 0) {
      return 0;
    }
LAB_1008e907:
    dVar23 = 0.0;
    goto LAB_1008e3a4;
  }
LAB_1008e856:
  uVar12 = 0;
  if (local_28 != 0) {
    return 0;
  }
  uVar3 = 0;
  if (local_10 == 0x20400000) {
    if ((((*(byte *)(*(int *)(local_24 + local_18[1] * 4) + 4) & 2) != 0) &&
        (puVar4 = *(uint **)(*(int *)(in_ECX + 0x18) + local_18[0x12] * 4),
        (*puVar4 & 0xfff00000) == 0x10100000)) && (puVar4[3] != 0)) {
      puVar6 = (uint *)puVar4[4];
      do {
        if ((uint *)*puVar6 == puVar11) break;
        uVar12 = uVar12 + 1;
        puVar6 = puVar6 + 1;
      } while (uVar12 < puVar4[3]);
      if ((uVar12 < puVar4[3]) && (puVar7 == *(uint **)(puVar4[2] + uVar12 * 4))) goto LAB_1008e907;
    }
    if ((((uint)local_48[4] & 2) != 0) &&
       ((puVar4 = *(uint **)(*(int *)(in_ECX + 0x18) + local_20[0x12] * 4),
        (*puVar4 & 0xfff00000) == 0x10100000 && (uVar12 = 0, puVar4[3] != 0)))) {
      puVar6 = (uint *)puVar4[4];
      do {
        if ((uint *)*puVar6 == puVar7) break;
        uVar12 = uVar12 + 1;
        puVar6 = puVar6 + 1;
      } while (uVar12 < puVar4[3]);
      if ((uVar12 < puVar4[3]) && (puVar11 == *(uint **)(puVar4[2] + uVar12 * 4)))
      goto LAB_1008e907;
    }
    local_8 = 0;
    local_28 = 0;
    do {
      local_2c = puVar11;
      local_30 = puVar7;
      if ((local_8 & 4) != 0) {
        local_2c = puVar7;
        local_30 = puVar11;
      }
      local_48[1] = (uint *)(local_8 & 2);
      if (local_48[1] == (uint *)0x0) {
LAB_1008e9ce:
        iVar9 = *(int *)(*(int *)(in_ECX + 0x14) + (int)local_30 * 4);
        if (((*(byte *)(*(int *)(local_24 + *(int *)(iVar9 + 4) * 4) + 4) & 2) != 0) &&
           (puVar4 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar9 + 0x48) * 4),
           (*puVar4 & 0xfff00000) == 0x20400000)) {
          uVar12 = puVar4[3];
          uVar3 = 0;
          if (uVar12 != 0) {
            puVar6 = (uint *)puVar4[4];
            do {
              if (local_30 == (uint *)*puVar6) {
                uVar16 = puVar4[2];
                if ((local_8 & 1) == 0) {
                  iVar9 = *(int *)(uVar16 + (uVar3 + uVar12) * 4);
                }
                else {
                  iVar9 = *(int *)(uVar16 + uVar3 * 4);
                  uVar3 = uVar3 + uVar12;
                }
                local_48[4] = *(uint **)(*(int *)(*(int *)(in_ECX + 0x14) + iVar9 * 4) + 0x30);
                local_50 = (ulonglong)
                           *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                             *(int *)(uVar16 + uVar3 * 4) * 4) + 0x30) << 0x20;
                break;
              }
              uVar3 = uVar3 + 1;
              puVar6 = puVar6 + 1;
            } while (uVar3 < uVar12);
          }
          if (local_48[1] == (uint *)0x0) {
            iVar9 = *(int *)(*(int *)(in_ECX + 0x14) + (int)local_48[4] * 4);
            if (((*(byte *)(*(int *)(local_24 + *(int *)(iVar9 + 4) * 4) + 4) & 2) == 0) ||
               (puVar4 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar9 + 0x48) * 4),
               (*puVar4 & 0xfff00000) != 0x10100000)) goto LAB_1008eabf;
            uVar12 = 0;
            if (puVar4[3] != 0) {
              puVar6 = (uint *)puVar4[4];
              do {
                if (local_48[4] == (uint *)*puVar6) {
                  local_48[4] = *(uint **)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                   *(int *)(puVar4[2] + uVar12 * 4) * 4) + 0x30);
                  break;
                }
                uVar12 = uVar12 + 1;
                puVar6 = puVar6 + 1;
              } while (uVar12 < puVar4[3]);
            }
          }
          if (local_2c == local_48[4]) {
            puVar4 = local_50._4_4_;
            goto LAB_1008eafc;
          }
        }
      }
      else {
        iVar9 = *(int *)(*(int *)(in_ECX + 0x14) + (int)local_2c * 4);
        if (((*(byte *)(*(int *)(local_24 + *(int *)(iVar9 + 4) * 4) + 4) & 2) != 0) &&
           (puVar4 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar9 + 0x48) * 4),
           (*puVar4 & 0xfff00000) == 0x10100000)) {
          local_28 = 0;
          if (puVar4[3] != 0) {
            puVar6 = (uint *)puVar4[4];
            do {
              if (local_2c == (uint *)*puVar6) {
                local_2c = *(uint **)(*(int *)(*(int *)(in_ECX + 0x14) +
                                              *(int *)(puVar4[2] + local_28 * 4) * 4) + 0x30);
                break;
              }
              local_28 = local_28 + 1;
              puVar6 = puVar6 + 1;
              local_48[3] = puVar6;
            } while (local_28 < puVar4[3]);
          }
          goto LAB_1008e9ce;
        }
      }
LAB_1008eabf:
      local_8 = local_8 + 1;
      uVar3 = local_28;
    } while (local_8 < 8);
  }
  local_28 = uVar3;
  if (local_10 == 0x20500000) {
    uVar12 = 0;
    local_48[0] = puVar7;
    local_48[1] = puVar11;
    local_30 = (uint *)0x0;
    local_34 = (uint *)0x0;
    local_48[3] = (uint *)0x0;
    local_48[2] = (uint *)0x0;
    do {
      iVar9 = *(int *)((int)local_48 + uVar12);
      while (iVar10 = *(int *)(*(int *)(in_ECX + 0x14) + iVar9 * 4),
            (*(byte *)(*(int *)(local_24 + *(int *)(iVar10 + 4) * 4) + 4) & 2) != 0) {
        puVar15 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar10 + 0x48) * 4);
        if ((undefined *)(*puVar15 & 0xfff00000) == (undefined *)0x10100000) {
          ppuVar1 = &local_34;
        }
        else {
          if ((undefined *)(*puVar15 & 0xfff00000) != &DAT_10300000) break;
          ppuVar1 = local_48 + 2;
        }
        *(uint *)((int)ppuVar1 + uVar12) = (uint)(*(uint *)((int)ppuVar1 + uVar12) == 0);
        local_48[4] = (uint *)puVar15[3];
        puVar4 = (uint *)0x0;
        if (local_48[4] != (uint *)0x0) {
          piVar5 = (int *)puVar15[4];
          do {
            if (*piVar5 == iVar9) {
              iVar9 = *(int *)(puVar15[2] + (int)puVar4 * 4);
              break;
            }
            puVar4 = (uint *)((int)puVar4 + 1);
            piVar5 = piVar5 + 1;
          } while (puVar4 < local_48[4]);
        }
        if (local_48[4] <= puVar4) {
          return 0x80004005;
        }
      }
      *(int *)((int)local_48 + uVar12) = iVar9;
      uVar12 = uVar12 + 4;
    } while (uVar12 < 8);
    if ((local_48[0] != local_48[1]) || (local_48[2] == local_48[3])) goto LAB_1008ebca;
    if (local_34 == local_30) {
      uVar24 = 0x3ff0000000000000;
    }
    else {
      uVar24 = 0xbff0000000000000;
    }
    uVar22 = *(undefined4 *)(in_ECX + 0x78);
  }
  else {
LAB_1008ebca:
    if ((local_10 == 0x20200000) &&
       (((iVar9 = *(int *)(*(int *)(in_ECX + 0x14) + (int)puVar7 * 4),
         (*(byte *)(*(int *)(local_24 + *(int *)(iVar9 + 4) * 4) + 4) & 2) != 0 &&
         ((uVar17 & 1) != 0)) &&
        (puVar15 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar9 + 0x48) * 4),
        (*puVar15 & 0xfff00000) == 0x10100000)))) {
      uVar12 = 0;
      if (puVar15[3] != 0) {
        puVar4 = (uint *)puVar15[4];
        do {
          if ((uint *)*puVar4 == puVar7) break;
          uVar12 = uVar12 + 1;
          puVar4 = puVar4 + 1;
        } while (uVar12 < puVar15[3]);
      }
      if (*(uint **)(puVar15[2] + uVar12 * 4) == puVar11) goto LAB_1008f005;
    }
    iVar9 = *(int *)(*(int *)(in_ECX + 0x14) + (int)puVar7 * 4);
    if ((*(byte *)(*(int *)(local_24 + *(int *)(iVar9 + 4) * 4) + 4) & 2) == 0) {
      return 0;
    }
    if ((*(byte *)(*(int *)(local_24 +
                           *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + (int)puVar11 * 4) + 4) * 4) +
                  4) & 2) == 0) {
      return 0;
    }
    if (((local_10 == 0x20500000) || (local_10 == 0x20200000)) || (local_10 == 0x20300000)) {
      puVar15 = *(uint **)(*(int *)(in_ECX + 0x18) +
                          *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + (int)puVar7 * 4) + 0x48) * 4);
      puVar4 = *(uint **)(*(int *)(in_ECX + 0x18) +
                         *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + (int)puVar11 * 4) + 0x48) * 4);
      if (((*puVar15 & 0xfff00000) == 0x10100000) && ((*puVar4 & 0xfff00000) == 0x10100000)) {
        local_2c = (uint *)0x0;
        if (param_1[3] != 0) {
          piVar5 = (int *)param_1[4];
          do {
            if (param_2 == *piVar5) break;
            local_2c = (uint *)((int)local_2c + 1);
            piVar5 = piVar5 + 1;
          } while (local_2c < param_1[3]);
        }
        uVar12 = 0;
        if (puVar15[3] != 0) {
          puVar6 = (uint *)puVar15[4];
          do {
            if (puVar7 == (uint *)*puVar6) break;
            uVar12 = uVar12 + 1;
            puVar6 = puVar6 + 1;
          } while (uVar12 < puVar15[3]);
        }
        uVar17 = 0;
        if (puVar4[3] != 0) {
          puVar7 = (uint *)puVar4[4];
          do {
            if (puVar11 == (uint *)*puVar7) break;
            uVar17 = uVar17 + 1;
            puVar7 = puVar7 + 1;
          } while (uVar17 < puVar4[3]);
        }
        if (local_10 == 0x20500000) {
          iVar9 = *(int *)(puVar15[2] + uVar12 * 4);
          iVar10 = *(int *)(puVar4[2] + uVar17 * 4);
        }
        else {
          iVar9 = *(int *)(puVar4[2] + uVar17 * 4);
          iVar10 = *(int *)(puVar15[2] + uVar12 * 4);
        }
        *(undefined4 *)(param_1[2] + (int)local_2c * 4) =
             *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar9 * 4) + 0x30);
        *(undefined4 *)(param_1[2] + (param_1[3] + (int)local_2c) * 4) =
             *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar10 * 4) + 0x30);
        return 0;
      }
    }
    if (local_10 != 0x20500000) {
      return 0;
    }
    if (puVar7 == puVar11) {
      puVar15 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar9 + 0x48) * 4);
      puVar8 = (undefined *)(*puVar15 & 0xfff00000);
      if ((puVar8 == &DAT_10300000) || (puVar8 == &DAT_10700000)) {
        uVar12 = 0;
        if (puVar15[3] != 0) {
          puVar4 = (uint *)puVar15[4];
          do {
            if ((uint *)*puVar4 == puVar7) break;
            uVar12 = uVar12 + 1;
            puVar4 = puVar4 + 1;
          } while (uVar12 < puVar15[3]);
        }
        iVar9 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(uVar12 * 4 + puVar15[2]) * 4);
        if (((*(byte *)(*(int *)(local_24 + *(int *)(iVar9 + 4) * 4) + 4) & 2) != 0) &&
           (*(int *)(iVar9 + 8) == -1)) {
          puVar4 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar9 + 0x48) * 4);
          puVar14 = (undefined *)(*puVar4 & 0xfff00000);
          if (((puVar14 == &DAT_10300000) || (puVar14 == &DAT_10700000)) && (puVar8 != puVar14)) {
            param_4 = 0;
            if (puVar4[3] != 0) {
              uVar17 = puVar4[4];
              do {
                *(undefined4 *)(uVar17 + param_4 * 4) = *(undefined4 *)(uVar12 * 4 + puVar15[2]);
                uVar17 = puVar4[4];
                if (*(int *)(uVar17 + param_4 * 4) != 0) break;
                param_4 = param_4 + 1;
              } while (param_4 < puVar4[3]);
            }
            iVar10 = *(int *)(puVar4[2] + param_4 * 4);
            iVar9 = *(int *)(in_ECX + 0x14);
            goto LAB_1008e658;
          }
        }
      }
    }
    local_50._4_4_ = (uint *)(*local_20 & 1);
    local_1c = in_ECX;
    if (((*local_20 & 1) != 0) && (iVar9 = FUN_10087a5d(puVar7,puVar11), iVar9 != 0))
    goto LAB_1008f005;
    local_48[3] = (uint *)(*local_18 & 1);
    if ((local_48[3] != (uint *)0x0) && (iVar9 = FUN_10087a5d(puVar11,puVar7), iVar9 != 0)) {
      local_14[0xc] = (uint)puVar7;
      return 0;
    }
    bVar18 = false;
    bVar2 = false;
    local_2c = (uint *)0x1;
    local_28 = 1;
    uVar12 = local_14[6];
    uVar17 = local_14[5];
    if (uVar17 == 0xffffffff) {
      return 0;
    }
    do {
      local_48[4] = (uint *)(uVar17 * 4);
      iVar9 = *(int *)(*(int *)(local_1c + 0x18) +
                      *(int *)(*(int *)((int)local_48[4] + *(int *)(local_1c + 0x14)) + 0x48) * 4);
      uVar3 = 0;
      if (*(uint *)(iVar9 + 0xc) != 0) {
        puVar15 = *(uint **)(iVar9 + 0x10);
        do {
          if (*puVar15 == uVar17) break;
          uVar3 = uVar3 + 1;
          puVar15 = puVar15 + 1;
        } while (uVar3 < *(uint *)(iVar9 + 0xc));
      }
      if (local_50._4_4_ != (uint *)0x0) {
        local_48[1] = *(uint **)(*(int *)(iVar9 + 8) + uVar3 * 4);
        uVar17 = FUN_10087a5d(puVar7,local_48[1]);
        if ((uVar12 & uVar17) != 0) {
          bVar18 = true;
        }
        if ((uVar12 == 0) && (iVar10 = FUN_10087a5d(local_48[1],puVar7), iVar10 != 0)) {
          local_2c = (uint *)0x0;
          bVar18 = true;
        }
      }
      iVar10 = local_1c;
      if (local_48[3] != (uint *)0x0) {
        uVar22 = *(undefined4 *)(*(int *)(iVar9 + 8) + uVar3 * 4);
        uVar17 = FUN_10087a5d(puVar11,uVar22);
        iVar10 = local_1c;
        if ((uVar12 & uVar17) != 0) {
          bVar2 = true;
        }
        if ((uVar12 == 0) && (iVar9 = FUN_10087a5d(uVar22,puVar11), iVar9 != 0)) {
          local_28 = 0;
          bVar2 = true;
        }
      }
      iVar9 = *(int *)(*(int *)(iVar10 + 0x14) + (int)local_48[4]);
      uVar12 = *(uint *)(iVar9 + 0x18);
      uVar17 = *(uint *)(iVar9 + 0x14);
    } while (uVar17 != 0xffffffff);
    if (bVar18) {
      if (!bVar2) {
LAB_1008efbf:
        if (local_2c != (uint *)0x0) goto LAB_1008efc4;
        goto LAB_1008efce;
      }
      if (local_2c == (uint *)0x0) goto LAB_1008efce;
      if (local_28 == 0) goto LAB_1008efbf;
      uVar24 = 0x3ff0000000000000;
    }
    else {
LAB_1008efc4:
      if ((!bVar2) || (local_28 != 0)) {
        if ((bVar18) && (local_2c != (uint *)0x0)) {
          local_14[0xc] = (uint)puVar11;
          return 0;
        }
        if (!bVar2) {
          return 0;
        }
        puVar11 = puVar7;
        if (local_28 == 0) {
          return 0;
        }
        goto LAB_1008f005;
      }
LAB_1008efce:
      uVar24 = 0;
    }
    uVar22 = *(undefined4 *)(iVar10 + 0x78);
  }
  puVar11 = (uint *)FUN_10086139(uVar22,0,0,uVar24);
LAB_1008f005:
  local_14[0xc] = (uint)puVar11;
  return 0;
}


