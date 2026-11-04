// 1006c8ca size=3274 FUN_1006c8ca

undefined4 FUN_1006c8ca(uint param_1,double *param_2)

{
  double dVar1;
  uint *puVar2;
  int iVar3;
  uint *puVar4;
  float10 fVar5;
  int iVar6;
  uint uVar7;
  int iVar8;
  int in_ECX;
  int *piVar9;
  uint uVar10;
  uint uVar11;
  undefined *puVar12;
  undefined4 uVar13;
  float10 fVar14;
  undefined4 uVar15;
  double local_58;
  double local_50;
  double local_48;
  double local_40;
  double local_38;
  double local_30;
  double local_28;
  double local_20;
  double local_18;
  undefined8 local_10;
  int local_8;
  
  iVar6 = *(int *)(in_ECX + 8);
  puVar2 = *(uint **)(*(int *)(iVar6 + 0x14) + param_1 * 4);
  if ((*puVar2 & 0x100) != 0) {
    if (param_2 == (double *)0x0) {
      return 0;
    }
    *param_2 = *(double *)(puVar2 + 8);
    dVar1 = *(double *)(puVar2 + 10);
LAB_1006c910:
    param_2[1] = dVar1;
    return 0;
  }
  if ((char)*puVar2 < '\0') {
    if (param_2 == (double *)0x0) {
      return 0;
    }
    *param_2 = *(double *)(puVar2 + 8);
    dVar1 = *(double *)(puVar2 + 8);
    goto LAB_1006c910;
  }
  local_38 = *(double *)(in_ECX + 0xa8);
  local_30 = *(double *)(in_ECX + 0xa0);
  local_8 = in_ECX;
  if (puVar2[2] == 0xffffffff) {
    if (((*(byte *)(*(int *)(*(int *)(iVar6 + 0x10) + puVar2[1] * 4) + 4) & 2) != 0) &&
       (puVar2[0x12] != 0xffffffff)) {
      puVar4 = *(uint **)(*(int *)(iVar6 + 0x18) + puVar2[0x12] * 4);
      uVar7 = *puVar4;
      uVar11 = puVar2[4];
      if ((uVar7 & 0xf0000000) == 0x10000000) {
        uVar7 = uVar7 & 0xfff00000;
        if (((((uVar7 != 0x10f00000) && (uVar7 != 0x11000000)) && (uVar7 != 0x11100000)) &&
            ((uVar7 != 0x11200000 && (uVar7 != 0x11300000)))) &&
           ((uVar7 != 0x11400000 && (uVar7 != 0x11500000)))) {
          iVar6 = FUN_1006c8ca(*(undefined4 *)(puVar4[2] + uVar11 * 4),&local_28);
          if (iVar6 < 0) goto LAB_1006d388;
          puVar12 = (undefined *)(*puVar4 & 0xfff00000);
          uVar13 = SUB84(local_28,0);
          uVar15 = (undefined4)((ulonglong)local_28 >> 0x20);
          if (puVar12 < &DAT_10700001) {
            if (puVar12 == &DAT_10700000) {
              if (local_28 < 0.0) goto LAB_1006d3f0;
              local_38 = 1.0 / SQRT(local_20);
              fVar14 = (float10)1.0 / SQRT((float10)local_28);
            }
            else if (puVar12 == (undefined *)0x10000000) {
LAB_1006d1d3:
              local_38 = local_28;
LAB_1006d220:
              fVar14 = (float10)local_20;
            }
            else if (puVar12 == (undefined *)0x10100000) {
              local_38 = -local_20;
              fVar14 = -(float10)local_28;
            }
            else if (puVar12 == &DAT_10200000) {
              if (0.0 <= local_28) {
                if (local_28 == 0.0) {
                  local_38 = 0.0;
                }
                else {
                  local_38 = local_28 + *(double *)(local_8 + 0xb0);
                }
              }
              else {
                local_38 = local_28 - *(double *)(local_8 + 0xb0);
              }
              if (0.0 <= local_20) {
                if (local_20 == 0.0) goto LAB_1006d364;
                fVar14 = (float10)local_20 + (float10)*(double *)(local_8 + 0xb0);
              }
              else {
                fVar14 = (float10)local_20 - (float10)*(double *)(local_8 + 0xb0);
              }
            }
            else if (puVar12 == &DAT_10300000) {
              if ((local_28 <= 0.0) && (0.0 <= local_20)) goto LAB_1006d3f0;
              local_38 = 1.0 / local_20;
              fVar14 = (float10)1 / (float10)local_28;
            }
            else {
              if (puVar12 == &DAT_10400000) {
                if (local_28 != local_20) goto LAB_1006cf14;
                iVar6 = FUN_100f8c58(uVar13,uVar15);
                if (iVar6 != 0) {
                  fVar14 = (float10)FUN_100f6670(SUB84(local_20,0),
                                                 (int)((ulonglong)local_20 >> 0x20));
                  fVar14 = (float10)local_28 - fVar14;
                  goto LAB_1006d3d3;
                }
                goto LAB_1006cd0e;
              }
              if (puVar12 == &DAT_10500000) {
                fVar14 = (float10)FUN_100f8f20();
LAB_1006d312:
                local_38 = (double)fVar14;
                fVar14 = (float10)FUN_100f8f20();
              }
              else {
                if (puVar12 != &DAT_10600000) goto LAB_1006d3f0;
                if (local_28 <= 0.0) {
                  fVar14 = (float10)*(double *)(local_8 + 0xa8);
                }
                else {
                  fVar14 = (float10)log2((float10)local_28);
                  fVar5 = (float10)log2((float10)2.0);
                  fVar14 = ((float10)0.6931471805599453 * fVar14) /
                           ((float10)0.6931471805599453 * fVar5);
                }
                local_38 = (double)fVar14;
                if (0.0 < local_20) {
                  fVar14 = (float10)log2((float10)local_20);
                  fVar5 = (float10)log2((float10)2.0);
                  fVar14 = ((float10)0.6931471805599453 * fVar14) /
                           ((float10)0.6931471805599453 * fVar5);
                }
                else {
                  fVar14 = (float10)*(double *)(local_8 + 0xa8);
                }
              }
            }
            goto LAB_1006d3ed;
          }
          if (puVar12 == (undefined *)0x10800000) {
            if ((local_28 != local_20) ||
               (iVar6 = FUN_100f8c58(uVar13,uVar15), dVar1 = local_28, iVar6 == 0)) {
LAB_1006d3e2:
              local_38 = -1.0;
              goto LAB_1006d3e8;
            }
LAB_1006d3d1:
            fVar14 = (float10)fsin((float10)dVar1);
          }
          else {
            if (puVar12 != (undefined *)0x10900000) {
              if (puVar12 == (undefined *)0x10a00000) {
                if ((local_28 < -1.0) || (local_20 < 1.0 == (local_20 == 1.0))) goto LAB_1006cdc5;
                fVar14 = (float10)FUN_100f8d40();
                local_38 = (double)fVar14;
                fVar14 = (float10)FUN_100f8d40();
              }
              else if (puVar12 == (undefined *)0x10b00000) {
                if ((local_28 < -1.0) || (local_20 < 1.0 == (local_20 == 1.0))) {
                  local_38 = 0.0;
                  goto LAB_1006d015;
                }
                fVar14 = (float10)FUN_100f8e10();
                local_38 = (double)fVar14;
                fVar14 = (float10)FUN_100f8e10();
              }
              else {
                if (puVar12 != (undefined *)0x10c00000) {
                  if ((((puVar12 == (undefined *)0x10d00000) || (puVar12 == (undefined *)0x10e00000)
                       ) && (local_28 == local_20)) &&
                     (iVar6 = FUN_100f8c58(uVar13,uVar15), iVar6 != 0)) goto LAB_1006cd0e;
                  goto LAB_1006d3f0;
                }
                if ((local_28 == local_20) && (iVar6 = FUN_100f8c58(uVar13,uVar15), iVar6 != 0)) {
                  fVar14 = (float10)1;
                  local_18 = local_28;
                  goto LAB_1006cd47;
                }
LAB_1006cdc5:
                local_38 = -1.5707963705062866;
                fVar14 = (float10)1.5707963705062866;
              }
              goto LAB_1006d3ed;
            }
            if ((local_28 != local_20) ||
               (iVar6 = FUN_100f8c58(uVar13,uVar15), dVar1 = local_28, iVar6 == 0))
            goto LAB_1006d3e2;
LAB_1006d3de:
            fVar14 = (float10)fcos((float10)dVar1);
          }
LAB_1006d3d3:
          local_30 = (double)fVar14;
          local_38 = (double)fVar14;
        }
      }
      else if ((uVar7 & 0xf0000000) == 0x20000000) {
        if ((uVar7 & 0xfff00000) != 0x20900000) {
          iVar6 = FUN_1006c8ca(*(undefined4 *)(puVar4[2] + uVar11 * 4),&local_18);
          if ((iVar6 < 0) ||
             (iVar6 = FUN_1006c8ca(*(undefined4 *)(puVar4[2] + (puVar4[3] + uVar11) * 4),&local_28),
             iVar6 < 0)) goto LAB_1006d388;
          uVar7 = *puVar4 & 0xfff00000;
          if (uVar7 < 0x20400001) {
            if (uVar7 == 0x20400000) {
              local_38 = local_28 + local_18;
              fVar14 = (float10)local_20 + (float10)local_10;
            }
            else {
              if (uVar7 == 0x20000000) {
                local_38 = local_28;
                if (local_18 < local_28) {
                  local_38 = local_18;
                }
                if (local_20 <= local_10) goto LAB_1006d220;
              }
              else {
                if (uVar7 != 0x20100000) {
                  if (uVar7 == 0x20200000) {
                    if (local_18 < local_20) {
                      if (local_10 < local_28) goto LAB_1006ceef;
LAB_1006cf14:
                      local_38 = 0.0;
                      goto LAB_1006d3e8;
                    }
                  }
                  else {
                    if (uVar7 != 0x20300000) goto LAB_1006d3f0;
                    if (local_28 <= local_10) {
                      if (local_18 < local_20) goto LAB_1006cf14;
                      goto LAB_1006ceef;
                    }
                  }
                  goto LAB_1006cd0e;
                }
                local_38 = local_18;
                if (local_18 <= local_28) {
LAB_1006cfa1:
                  local_38 = local_28;
                }
LAB_1006cfa4:
                if (local_10 <= local_20) goto LAB_1006d220;
              }
              fVar14 = (float10)local_10;
            }
LAB_1006d3ed:
            local_30 = (double)fVar14;
          }
          else if (uVar7 == 0x20500000) {
            FUN_1006c827(&local_38,&local_18,&local_28,*puVar2);
          }
          else {
            if (uVar7 == 0x20600000) {
              if ((((local_18 == local_10) &&
                   (iVar6 = FUN_100f8c58(SUB84(local_18,0),(int)((ulonglong)local_18 >> 0x20)),
                   iVar6 != 0)) && (local_28 == local_20)) &&
                 (iVar6 = FUN_100f8c58(SUB84(local_28,0),(int)((ulonglong)local_28 >> 0x20)),
                 iVar6 != 0)) {
                fVar14 = (float10)local_28;
LAB_1006cd47:
                fVar14 = (float10)fpatan((float10)local_18,fVar14);
                goto LAB_1006d3d3;
              }
              local_38 = -3.1415927410125732;
LAB_1006d015:
              fVar14 = (float10)3.1415927410125732;
              goto LAB_1006d3ed;
            }
            if ((uVar7 == 0x20700000) || (uVar7 == 0x20800000)) {
              local_38 = local_18;
              if (local_28 <= local_18) goto LAB_1006cfa1;
              goto LAB_1006cfa4;
            }
          }
        }
      }
      else {
        uVar10 = uVar7 & 0xfff00000;
        if (uVar10 == 0x50000000) {
          local_38 = 0.0;
          local_10 = (double)(CONCAT44(uVar7,(undefined4)local_10) & 0xfffffffffffff);
          local_30 = 0.0;
          uVar11 = 0;
          if ((uVar7 & 0xfffff) != 0) {
            param_1 = (uVar7 & 0xfffff) << 2;
            do {
              iVar6 = FUN_1006c8ca(*(undefined4 *)(puVar4[2] + uVar11 * 4),&local_28);
              if ((iVar6 < 0) ||
                 (iVar6 = FUN_1006c8ca(*(undefined4 *)(param_1 + puVar4[2]),&local_48), iVar6 < 0))
              goto LAB_1006d388;
              FUN_1006c827(&local_58,&local_28,&local_48,*puVar2);
              local_38 = local_58 + local_38;
              param_1 = param_1 + 4;
              uVar11 = uVar11 + 1;
              local_30 = local_50 + local_30;
            } while (uVar11 < local_10._4_4_);
          }
        }
        else {
          if (uVar10 == 0x30000000) {
            uVar7 = puVar4[2];
            iVar6 = *(int *)(uVar7 + uVar11 * 4);
            iVar3 = *(int *)(uVar7 + (uVar11 + puVar4[3] * 2) * 4);
            local_10 = (double)CONCAT44(*(undefined4 *)(uVar7 + (puVar4[3] + uVar11) * 4),
                                        (undefined4)local_10);
            iVar8 = FUN_1006c8ca(iVar6,&local_58);
            if (-1 < iVar8) {
              iVar8 = FUN_1006c8ca(local_10._4_4_,&local_28);
              if ((-1 < iVar8) && (iVar8 = FUN_1006c8ca(iVar3,&local_48), -1 < iVar8)) {
                if ((*puVar4 & 0xfff00000) == 0x30000000) {
                  if (iVar6 == local_10._4_4_) {
                    if (local_28 < 0.0) {
                      local_28 = 0.0;
                    }
                    if (local_20 < 0.0) {
                      local_20 = 0.0;
                    }
                  }
                  if (iVar6 == iVar3) {
                    if (0.0 < local_48) {
                      local_48 = 0.0;
                    }
                    fVar14 = (float10)local_40;
                    if ((float10)0.0 < fVar14) {
                      fVar14 = (float10)0;
                    }
                  }
                  else {
                    fVar14 = (float10)local_40;
                  }
                  if (0.0 <= local_58) goto LAB_1006d1d3;
                  if (0.0 <= local_50) {
                    local_38 = local_48;
                    if (local_28 < local_48) {
                      local_38 = local_28;
                    }
                    if (fVar14 < (float10)local_20) goto LAB_1006d220;
                  }
                  else {
                    local_38 = local_48;
                  }
                  goto LAB_1006d3ed;
                }
                goto LAB_1006d3f0;
              }
            }
            goto LAB_1006d388;
          }
          if (uVar10 == 0x50100000) {
            if (uVar11 != 0) {
              if (uVar11 == 1) {
                iVar6 = FUN_1006c8ca(*(undefined4 *)puVar4[2],&local_48);
                if (iVar6 < 0) goto LAB_1006d388;
                if (local_48 <= 0.0) {
                  local_38 = 0.0;
                  if (local_40 < 0.0 != (local_40 == 0.0)) goto LAB_1006d364;
                }
                else {
                  local_38 = local_48;
                }
                fVar14 = (float10)local_40;
                goto LAB_1006d3ed;
              }
              if (uVar11 == 2) {
                iVar6 = FUN_1006c8ca(*(undefined4 *)puVar4[2],&local_48);
                if (-1 < iVar6) {
                  if (local_40 < 0.0 != (local_40 == 0.0)) {
LAB_1006cd0e:
                    local_38 = 0.0;
LAB_1006d364:
                    fVar14 = (float10)0;
                    goto LAB_1006d3ed;
                  }
                  iVar6 = FUN_1006c8ca(*(undefined4 *)(puVar4[2] + 4),&local_28);
                  if (-1 < iVar6) {
                    if (local_20 < 0.0 != (local_20 == 0.0)) goto LAB_1006cd0e;
                    iVar6 = FUN_1006c8ca(*(undefined4 *)(puVar4[2] + 0xc),&local_58);
                    if (-1 < iVar6) {
                      fVar14 = (float10)FUN_100f8f20();
                      local_10 = local_50;
                      if (local_20 < 1.0) {
                        local_10 = local_58;
                      }
                      goto LAB_1006d312;
                    }
                  }
                }
LAB_1006d388:
                local_38 = *(double *)(local_8 + 0xa8);
                uVar13 = 0x80004005;
                local_30 = *(double *)(local_8 + 0xa0);
                goto LAB_1006d3f2;
              }
              if (uVar11 != 3) goto LAB_1006d3f0;
            }
LAB_1006ceef:
            local_38 = 1.0;
LAB_1006d3e8:
            fVar14 = (float10)1;
            goto LAB_1006d3ed;
          }
          if (uVar10 == 0x50300000) {
            iVar6 = FUN_1006c8ca(*(undefined4 *)puVar4[2],&local_48);
            if (iVar6 < 0) goto LAB_1006d388;
            if ((local_48 != local_40) ||
               (iVar6 = FUN_100f8c58(SUB84(local_48,0),(int)((ulonglong)local_48 >> 0x20)),
               iVar6 == 0)) goto LAB_1006d3e2;
            dVar1 = local_48;
            if (uVar11 == 0) goto LAB_1006d3de;
            if (uVar11 == 1) goto LAB_1006d3d1;
          }
        }
      }
    }
  }
  else {
    iVar6 = FUN_1006e16c(puVar2[2],&local_20);
    if (-1 < iVar6) {
      iVar6 = __ftol();
      uVar7 = *(uint *)(*(int *)(in_ECX + 8) + 8);
      param_1 = 0;
      local_10 = (double)CONCAT44(uVar7,(undefined4)local_10);
      if (uVar7 != 0) {
        piVar9 = *(int **)(*(int *)(in_ECX + 8) + 0x14);
        do {
          iVar3 = *piVar9;
          if ((((*(uint *)(iVar3 + 4) == puVar2[1]) && (*(int *)(iVar3 + 8) == -1)) &&
              (*(int *)(iVar3 + 0xc) == iVar6 + puVar2[3])) &&
             (*(uint *)(iVar3 + 0x10) == puVar2[4])) {
            iVar6 = FUN_1006c8ca(param_1,&local_38);
            if (iVar6 < 0) goto LAB_1006d388;
            break;
          }
          param_1 = param_1 + 1;
          piVar9 = piVar9 + 1;
        } while (param_1 < uVar7);
      }
    }
  }
LAB_1006d3f0:
  uVar13 = 0;
LAB_1006d3f2:
  if ((*puVar2 & 4) == 0) {
    if (0.0 <= local_38) {
      *puVar2 = *puVar2 | 4;
    }
  }
  else {
    if (0.0 > local_38 || local_38 == 0.0) {
      local_38 = 0.0;
    }
    if (local_30 <= 0.0) {
      local_30 = 0.0;
    }
  }
  if ((*puVar2 & 8) == 0) {
    if (local_30 < 0.0 != (local_30 == 0.0)) {
      *puVar2 = *puVar2 | 8;
    }
  }
  else {
    if (0.0 <= local_38) {
      local_38 = 0.0;
    }
    if (0.0 <= local_30) {
      local_30 = 0.0;
    }
  }
  if ((*puVar2 & 0x10) == 0) {
    if ((-1.0 <= local_38) && (local_30 < 1.0 != (local_30 == 1.0))) {
      *puVar2 = *puVar2 | 0x10;
    }
  }
  else {
    if (-1.0 > local_38 || local_38 == -1.0) {
      local_38 = -1.0;
    }
    if (local_30 <= -1.0) {
      local_30 = -1.0;
    }
    if (1.0 <= local_38) {
      local_38 = 1.0;
    }
    if (1.0 <= local_30) {
      local_30 = 1.0;
    }
  }
  if ((local_38 == local_30) &&
     (iVar6 = FUN_100f8c58(SUB84(local_38,0),(int)((ulonglong)local_38 >> 0x20)), iVar6 != 0)) {
    *(byte *)puVar2 = (byte)*puVar2 | 0x80;
    if ((local_38 == 0.0) || (local_38 == 1.0)) {
      *puVar2 = *puVar2 | 1;
    }
    iVar6 = __ftol();
    if (ABS(local_38 - (double)iVar6) < 1e-06) {
      *puVar2 = *puVar2 | 2;
    }
  }
  *(double *)(puVar2 + 8) = local_38;
  *(byte *)((int)puVar2 + 1) = *(byte *)((int)puVar2 + 1) | 1;
  *(double *)(puVar2 + 10) = local_30;
  if (param_2 != (double *)0x0) {
    *param_2 = local_38;
    param_2[1] = local_30;
    return uVar13;
  }
  return uVar13;
}


