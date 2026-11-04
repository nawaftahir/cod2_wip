// 100c7c92 size=2410 FUN_100c7c92

int FUN_100c7c92(void)

{
  byte bVar1;
  int iVar2;
  int *piVar3;
  float fVar4;
  short sVar5;
  uint uVar6;
  int iVar7;
  char *_Format;
  undefined4 *puVar8;
  undefined4 *puVar9;
  int *in_ECX;
  int iVar10;
  byte *pbVar11;
  uint uVar12;
  byte *pbVar13;
  byte *pbVar14;
  bool bVar15;
  char *pcVar16;
  undefined4 uVar17;
  char local_180 [254];
  undefined1 local_82;
  undefined4 local_80;
  undefined4 uStack_7c;
  undefined4 uStack_78;
  undefined4 local_74;
  undefined1 local_70 [4];
  int local_6c;
  int local_68;
  undefined1 local_64 [4];
  int local_60;
  undefined1 local_5c [4];
  int local_58;
  undefined1 local_54 [16];
  undefined4 *local_44;
  undefined4 *local_40;
  undefined4 *local_3c;
  uint local_38;
  int *local_34;
  undefined4 *local_30;
  int local_2c;
  byte *local_28;
  byte *local_24;
  uint local_20;
  byte *local_1c;
  byte *local_18;
  byte *local_14;
  undefined4 *local_10;
  uint local_c;
  byte *local_8;
  
  local_34 = in_ECX;
  FUN_10084086((-(uint)(in_ECX[0x56] != 0) & 0x40cf503) + 0x42415443);
  puVar8 = &local_74;
  for (iVar10 = 7; iVar10 != 0; iVar10 = iVar10 + -1) {
    *puVar8 = 0;
    puVar8 = puVar8 + 1;
  }
  local_6c = in_ECX[0x32];
  local_60 = in_ECX[0x33];
  local_74 = 0x1c;
  local_30 = (undefined4 *)0x0;
  local_10 = (undefined4 *)0x0;
  local_44 = (undefined4 *)0x0;
  local_3c = (undefined4 *)0x0;
  local_40 = (undefined4 *)0x0;
  local_28 = (byte *)0x0;
  iVar10 = FUN_100840db(&local_74,0x1c,1,0);
  piVar3 = local_34;
  if (iVar10 < 0) goto LAB_100c85ba;
  pbVar14 = (byte *)0x0;
  pbVar11 = (byte *)0x0;
  local_18 = (byte *)0x0;
  local_8 = (byte *)0x0;
  if (local_34[2] != 0) {
    local_14 = (byte *)local_34[5];
    local_1c = (byte *)local_34[2];
    do {
      local_c = *(uint *)(*(int *)(local_34[4] + *(int *)(*(int *)local_14 + 4) * 4) + 4);
      if (((local_c & 0x200) != 0) && ((local_c & 0x100) == 0)) {
        pbVar13 = *(byte **)(*(int *)local_14 + 0xc);
        if ((local_c & 0x80) == 0) {
          if ((local_c & 0x2000) == 0) {
            if ((local_c & 0x40000) == 0) {
              if (pbVar11 <= pbVar13) {
                pbVar11 = pbVar13 + 1;
              }
            }
            else if (local_8 <= pbVar13) {
              local_8 = pbVar13 + 1;
            }
          }
          else if (local_18 <= pbVar13) {
            local_18 = pbVar13 + 1;
          }
        }
        else if (pbVar14 <= pbVar13) {
          pbVar14 = pbVar13 + 1;
        }
      }
      local_14 = (byte *)((int)local_14 + 4);
      local_1c = local_1c + -1;
    } while (local_1c != (byte *)0x0);
  }
  local_24 = pbVar11 + (int)local_18;
  local_14 = pbVar14 + (int)pbVar11 + (int)local_18;
  pbVar14 = local_8 + (int)pbVar14 + (int)pbVar11 + (int)local_18;
  local_10 = operator_new((int)pbVar14 * 4);
  if ((local_10 == (undefined4 *)0x0) ||
     (local_28 = operator_new((int)pbVar14 * 4), local_28 == (byte *)0x0)) {
LAB_100c8599:
    iVar10 = -0x7ff8fff2;
  }
  else {
    local_c = 0;
    puVar8 = local_10;
    for (uVar12 = (uint)pbVar14 & 0x3fffffff; uVar12 != 0; uVar12 = uVar12 - 1) {
      *puVar8 = 0;
      puVar8 = puVar8 + 1;
    }
    for (iVar10 = 0; iVar10 != 0; iVar10 = iVar10 + -1) {
      *(undefined1 *)puVar8 = 0;
      puVar8 = (undefined4 *)((int)puVar8 + 1);
    }
    if (piVar3[2] != 0) {
      do {
        iVar10 = *(int *)(piVar3[5] + local_c * 4);
        if ((((*(int *)(iVar10 + 0x60) != 0) && (*(int *)(iVar10 + 8) == -1)) &&
            (uVar12 = *(uint *)(*(int *)(piVar3[4] + *(int *)(iVar10 + 4) * 4) + 4),
            (uVar12 & 0x200) != 0)) && ((uVar12 & 0x100) == 0)) {
          pbVar11 = local_24;
          if (-1 < (char)uVar12) {
            if ((uVar12 & 0x2000) == 0) {
              pbVar11 = local_14;
              if ((uVar12 & 0x40000) == 0) {
                pbVar11 = local_18;
              }
            }
            else {
              pbVar11 = (byte *)0x0;
            }
          }
          iVar7 = *(int *)(iVar10 + 0xc);
          uVar12 = *(uint *)(iVar10 + 0x70);
          pbVar13 = pbVar11 + iVar7 + 1;
          while (pbVar11 + (iVar7 - (uVar12 >> 2)) < pbVar13) {
            pbVar13 = pbVar13 + -1;
            if (local_10[(int)pbVar13] != 0) break;
            local_10[(int)pbVar13] = iVar10;
          }
        }
        local_c = local_c + 1;
      } while (local_c < (uint)piVar3[2]);
    }
    pbVar13 = (byte *)0x0;
    pbVar11 = (byte *)0x0;
    local_1c = (byte *)0x0;
    if (pbVar14 != (byte *)0x0) {
      do {
        if (local_10[(int)pbVar11] != 0) {
          local_10[(int)local_1c] = local_10[(int)pbVar11];
          local_1c = local_1c + 1;
        }
        pbVar11 = pbVar11 + 1;
      } while (pbVar11 < pbVar14);
    }
    iVar10 = 0;
    local_20 = 0;
    if (local_1c != (byte *)0x0) {
      do {
        if (((((iVar10 == 0) || (*(int *)(local_10[(int)pbVar13] + 4) != *(int *)(iVar10 + 4))) ||
             ((*(int *)(local_10[(int)pbVar13] + 0x60) != *(int *)(iVar10 + 0x60) ||
              (*(int *)(local_10[(int)pbVar13] + 0xc) -
               (*(uint *)(local_10[(int)pbVar13] + 0x70) >> 2) !=
               *(int *)(iVar10 + 0xc) - (*(uint *)(iVar10 + 0x70) >> 2))))) &&
            (((iVar10 = local_10[(int)pbVar13], iVar10 != 0 &&
              (iVar7 = *(int *)(iVar10 + 0x60), *(int *)(iVar7 + 4) == 6)) &&
             ((iVar2 = *(int *)(iVar7 + 0x14), iVar2 != 0 &&
              (((*(int *)(iVar2 + 4) == 3 && (*(int *)(iVar7 + 0x18) != 0)) &&
               (*(int *)(*(int *)(iVar7 + 0x18) + 4) == 0xb)))))))) &&
           ((*(int *)(iVar2 + 0x10) == 9 && (*(int *)(iVar2 + 0x18) != 0)))) {
          *(byte **)(local_28 + local_20 * 4) = pbVar13;
          local_20 = local_20 + 1;
        }
        pbVar13 = pbVar13 + 1;
      } while (pbVar13 < local_1c);
    }
    local_c = 0;
    if (local_20 != 0) {
      do {
        local_8 = *(byte **)(local_28 + local_c * 4);
        local_14 = (byte *)local_10[(int)local_8];
        local_24 = *(byte **)(*(int *)(*(int *)(local_14 + 0x60) + 0x14) + 0x18);
        uVar12 = 0;
        if (local_c != 0) {
          do {
            pbVar14 = *(byte **)(*(int *)(*(int *)(local_10[*(int *)(local_28 + uVar12 * 4)] + 0x60)
                                         + 0x14) + 0x18);
            pbVar11 = local_24;
            do {
              bVar1 = *pbVar11;
              bVar15 = bVar1 < *pbVar14;
              if (bVar1 != *pbVar14) {
LAB_100c7f8c:
                iVar10 = (1 - (uint)bVar15) - (uint)(bVar15 != 0);
                goto LAB_100c7f91;
              }
              if (bVar1 == 0) break;
              bVar1 = pbVar11[1];
              bVar15 = bVar1 < pbVar14[1];
              if (bVar1 != pbVar14[1]) goto LAB_100c7f8c;
              pbVar11 = pbVar11 + 2;
              pbVar14 = pbVar14 + 2;
            } while (bVar1 != 0);
            iVar10 = 0;
LAB_100c7f91:
          } while (((-1 < iVar10) &&
                   ((0 < iVar10 ||
                    (*(uint *)(local_10[*(int *)(local_28 + uVar12 * 4)] + 4) <=
                     *(uint *)(local_14 + 4))))) && (uVar12 = uVar12 + 1, uVar12 < local_c));
          uVar6 = local_c;
          if (uVar12 < local_c) {
            do {
              *(undefined4 *)(local_28 + uVar6 * 4) = *(undefined4 *)(local_28 + uVar6 * 4 + -4);
              uVar6 = uVar6 - 1;
            } while (uVar12 < uVar6);
            *(byte **)(local_28 + uVar12 * 4) = local_8;
          }
        }
        local_c = local_c + 1;
      } while (local_c < local_20);
    }
    iVar7 = (**(code **)(*local_34 + 0x8c))();
    iVar7 = iVar7 + local_20;
    if (iVar7 != 0) {
      local_30 = operator_new(iVar7 * 0x14);
      if (local_30 == (undefined4 *)0x0) goto LAB_100c8599;
      puVar8 = local_30;
      for (uVar12 = iVar7 * 5 & 0x3fffffff; uVar12 != 0; uVar12 = uVar12 - 1) {
        *puVar8 = 0;
        puVar8 = puVar8 + 1;
      }
      for (iVar10 = 0; iVar10 != 0; iVar10 = iVar10 + -1) {
        *(undefined1 *)puVar8 = 0;
        puVar8 = (undefined4 *)((int)puVar8 + 1);
      }
      iVar10 = FUN_100840db(local_30,iVar7 * 0x14,1,local_64);
      if (iVar10 < 0) goto LAB_100c85ba;
      local_c = 0;
      local_68 = iVar7;
      if (local_20 != 0) {
        pbVar14 = (byte *)(local_30 + 1);
        pbVar11 = local_28;
        do {
          iVar10 = *(int *)(local_10[*(int *)pbVar11] + 0x60);
          local_2c = *(int *)(iVar10 + 0x18);
          pcVar16 = *(char **)(*(int *)(iVar10 + 0x14) + 0x18);
          local_38 = *(uint *)(local_34[4] + *(int *)(local_10[*(int *)pbVar11] + 4) * 4);
          local_18 = pbVar14;
          local_14 = pbVar11;
          if (local_34[0x56] == 0) {
            uVar17 = 7;
          }
          else {
            uVar12 = *(uint *)(local_38 + 4);
            _Format = "c_%s";
            if ((uVar12 & 0x2000) == 0) {
              if ((uVar12 & 0x40000) == 0) {
                if ((char)uVar12 < '\0') {
                  _Format = "s_%s";
                }
              }
              else {
                _Format = "i_%s";
              }
            }
            else {
              _Format = "b_%s";
            }
            __snprintf(local_180,0xff,_Format,pcVar16);
            uVar17 = 6;
            pcVar16 = local_180;
            local_82 = 0;
          }
          iVar10 = FUN_100840db(pcVar16,0xffffffff,uVar17,pbVar14 + -4);
          if (iVar10 < 0) goto LAB_100c85ba;
          pbVar13 = (byte *)(*(int *)pbVar11 + 1);
          iVar10 = 1;
          if (pbVar13 < local_1c) {
            local_58 = *(int *)(local_10[*(int *)pbVar11] + 4);
            local_24 = (byte *)(local_10 + *(int *)pbVar11 + 1);
            local_8 = pbVar13;
            do {
              if (((local_58 != *(int *)(*(int *)local_24 + 4)) ||
                  (*(int *)(local_10[*(int *)pbVar11] + 0x60) !=
                   *(int *)(local_10[*(int *)pbVar11 + iVar10] + 0x60))) ||
                 (*(int *)(local_10[*(int *)pbVar11] + 0xc) -
                  (*(uint *)(local_10[*(int *)pbVar11] + 0x70) >> 2) !=
                  *(int *)(local_10[*(int *)pbVar11 + iVar10] + 0xc) -
                  (*(uint *)(local_10[*(int *)pbVar11 + iVar10] + 0x70) >> 2))) break;
              local_24 = local_24 + 4;
              iVar10 = iVar10 + 1;
              local_8 = local_8 + 1;
            } while (local_8 < local_1c);
          }
          uVar12 = *(uint *)(local_38 + 4);
          if ((char)uVar12 < '\0') {
            sVar5 = 3;
          }
          else if ((uVar12 & 0x2000) == 0) {
            sVar5 = 2 - (ushort)((uVar12 & 0x40000) != 0);
          }
          else {
            sVar5 = 0;
          }
          *(short *)pbVar14 = sVar5;
          *(short *)(pbVar14 + 2) =
               *(short *)(local_10[*(int *)pbVar11] + 0xc) -
               (short)(*(uint *)(local_10[*(int *)pbVar11] + 0x70) >> 2);
          *(short *)(pbVar14 + 4) = (short)iVar10;
          if (((*(int *)(local_2c + 0x20) != 0) &&
              (iVar10 = FUN_100c3e06(local_54,*(int *)(local_2c + 0x20),1,
                                     *(uint *)(local_10[*(int *)pbVar11] + 0x3c) & 0xe00000,
                                     pbVar14 + 8), iVar10 < 0)) ||
             ((*(int *)(local_2c + 0x30) != 0 &&
              (iVar10 = (**(code **)(*local_34 + 0x94))(local_2c,pbVar14 + -4), iVar10 < 0))))
          goto LAB_100c85ba;
          iVar10 = *(int *)(local_2c + 0x34);
          if (iVar10 != 0) {
            sVar5 = *(short *)pbVar14;
            if (sVar5 == 1) {
              local_24 = (byte *)((iVar10 + 3U & 0xfffffffc) << 2);
              puVar8 = operator_new((uint)local_24);
              local_40 = puVar8;
              if (puVar8 == (undefined4 *)0x0) goto LAB_100c8599;
              puVar9 = puVar8;
              for (uVar12 = (uint)local_24 >> 2; uVar12 != 0; uVar12 = uVar12 - 1) {
                *puVar9 = 0;
                puVar9 = puVar9 + 1;
              }
              uVar6 = iVar10 + 3U >> 2;
              for (uVar12 = (uint)local_24 & 3; uVar12 != 0; uVar12 = uVar12 - 1) {
                *(undefined1 *)puVar9 = 0;
                puVar9 = (undefined4 *)((int)puVar9 + 1);
              }
              if (uVar6 != 0) {
                puVar9 = puVar8 + 2;
                do {
                  *puVar9 = 1;
                  puVar9 = puVar9 + 4;
                  uVar6 = uVar6 - 1;
                } while (uVar6 != 0);
              }
              local_8 = (byte *)0x0;
              iVar10 = local_2c;
              if (*(int *)(local_2c + 0x34) != 0) {
                do {
                  pbVar14 = local_8;
                  piVar3 = *(int **)((int)local_8 * 4 + *(int *)(iVar10 + 0x38));
                  if (piVar3 != (int *)0x0) {
                    iVar7 = *piVar3;
                    if (iVar7 == 0) {
                      puVar8[(int)local_8] = (uint)(piVar3[2] != 0);
                    }
                    else if ((iVar7 == 1) || (iVar7 == 2)) {
                      puVar8[(int)local_8] = piVar3[2];
                    }
                    else if (iVar7 == 3) {
                      uVar17 = __ftol();
                      puVar8[(int)pbVar14] = uVar17;
                      iVar10 = local_2c;
                    }
                  }
                  local_8 = local_8 + 1;
                } while (local_8 < *(byte **)(iVar10 + 0x34));
              }
              iVar10 = FUN_100840db(puVar8,local_24,0xb,local_18 + 0xc);
              if (iVar10 < 0) goto LAB_100c85ba;
              local_40 = (undefined4 *)0x0;
              pbVar14 = local_18;
              pbVar11 = local_14;
            }
            else if (sVar5 == 2) {
              local_38 = (iVar10 + 3U & 0xfffffffc) << 2;
              local_44 = operator_new(local_38);
              if (local_44 == (undefined4 *)0x0) goto LAB_100c8599;
              puVar8 = local_44;
              for (uVar12 = iVar10 + 3U & 0x3ffffffc; uVar12 != 0; uVar12 = uVar12 - 1) {
                *puVar8 = 0;
                puVar8 = puVar8 + 1;
              }
              for (iVar10 = 0; iVar10 != 0; iVar10 = iVar10 + -1) {
                *(undefined1 *)puVar8 = 0;
                puVar8 = (undefined4 *)((int)puVar8 + 1);
              }
              uVar12 = 0;
              if (*(int *)(local_2c + 0x34) != 0) {
                do {
                  piVar3 = *(int **)(uVar12 * 4 + *(int *)(local_2c + 0x38));
                  if (piVar3 != (int *)0x0) {
                    iVar10 = *piVar3;
                    if (iVar10 == 0) {
                      if (piVar3[2] == 0) {
                        fVar4 = 0.0;
                      }
                      else {
                        fVar4 = 1.0;
                      }
                    }
                    else if (iVar10 == 1) {
                      fVar4 = (float)piVar3[2];
                    }
                    else if (iVar10 == 2) {
                      local_58 = piVar3[2];
                      fVar4 = (float)local_58;
                      if (local_58 < 0) {
                        fVar4 = fVar4 + 4.2949673e+09;
                      }
                    }
                    else {
                      if (iVar10 != 3) goto LAB_100c838f;
                      fVar4 = (float)*(double *)(piVar3 + 2);
                    }
                    local_44[uVar12] = fVar4;
                  }
LAB_100c838f:
                  uVar12 = uVar12 + 1;
                } while (uVar12 < *(uint *)(local_2c + 0x34));
              }
              iVar10 = FUN_100840db(local_44,local_38,0xb,local_18 + 0xc);
              if (iVar10 < 0) goto LAB_100c85ba;
              local_44 = (undefined4 *)0x0;
              pbVar14 = local_18;
              pbVar11 = local_14;
            }
            else if (sVar5 == 0) {
              uVar12 = *(uint *)(local_2c + 0x14);
              local_38 = uVar12 << 2;
              local_3c = operator_new(local_38);
              if (local_3c == (undefined4 *)0x0) goto LAB_100c8599;
              puVar8 = local_3c;
              for (uVar12 = uVar12 & 0x3fffffff; uVar12 != 0; uVar12 = uVar12 - 1) {
                *puVar8 = 0;
                puVar8 = puVar8 + 1;
              }
              for (iVar10 = 0; iVar10 != 0; iVar10 = iVar10 + -1) {
                *(undefined1 *)puVar8 = 0;
                puVar8 = (undefined4 *)((int)puVar8 + 1);
              }
              local_8 = (byte *)0x0;
              if (*(int *)(local_2c + 0x14) != 0) {
                do {
                  piVar3 = *(int **)((int)local_8 * 4 + *(int *)(local_2c + 0x3c));
                  if (piVar3 != (int *)0x0) {
                    iVar10 = *piVar3;
                    if (((iVar10 == 0) || (iVar10 == 1)) || (iVar10 == 2)) {
                      local_3c[(int)local_8] = (uint)(piVar3[2] != 0);
                    }
                    else if (iVar10 == 3) {
                      local_3c[(int)local_8] = (uint)(*(double *)(piVar3 + 2) != 0.0);
                    }
                  }
                  local_8 = local_8 + 1;
                } while (local_8 < *(byte **)(local_2c + 0x14));
              }
              iVar10 = FUN_100840db(local_3c,local_38,0xb,local_18 + 0xc);
              if (iVar10 < 0) goto LAB_100c85ba;
              local_3c = (undefined4 *)0x0;
              pbVar14 = local_18;
              pbVar11 = local_14;
            }
          }
          local_c = local_c + 1;
          pbVar11 = pbVar11 + 4;
          pbVar14 = pbVar14 + 0x14;
          local_18 = pbVar14;
          local_14 = pbVar11;
        } while (local_c < local_20);
      }
    }
    iVar10 = (**(code **)(*local_34 + 0x90))(local_54,local_30,local_20);
    if (-1 < iVar10) {
      local_80 = 0;
      uStack_7c = 0;
      uStack_78 = 0;
      iVar10 = FUN_10063814(local_34[0x42],0,&local_80);
      if (((-1 < iVar10) && (iVar10 = FUN_100840db(local_80,0xffffffff,5,local_5c), -1 < iVar10)) &&
         (iVar10 = FUN_100840db("Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904",0xffffffff,5,
                                local_70), -1 < iVar10)) {
        uVar12 = FUN_10084214();
        if (uVar12 < 0x8001) {
          iVar10 = FUN_100c40ff(uVar12);
          if (-1 < iVar10) {
            _memmove((void *)(local_34[0x43] + 4 + uVar12 * 4),(void *)(local_34[0x43] + 4),
                     local_34[0x44] * 4 - 4);
            iVar10 = FUN_10084220(local_34[0x43] + 4,uVar12);
            if (-1 < iVar10) {
              local_34[0x44] = local_34[0x44] + uVar12;
              local_34[0x48] = local_34[0x48] + uVar12;
              local_34[0x47] = local_34[0x44];
              iVar10 = 0;
            }
          }
        }
        else {
          FUN_1008b0b5(local_34,0,0x11c4,"constant table info exceeds maximum comment size");
          iVar10 = -0x7fffbffb;
        }
      }
    }
  }
LAB_100c85ba:
  _free(local_30);
  _free(local_10);
  _free(local_44);
  _free(local_3c);
  _free(local_40);
  _free(local_28);
  FUN_100840a3();
  return iVar10;
}


