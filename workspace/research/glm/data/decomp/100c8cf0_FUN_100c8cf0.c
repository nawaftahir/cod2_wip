// 100c8cf0 size=3009 FUN_100c8cf0

int FUN_100c8cf0(uint *param_1)

{
  int iVar1;
  HMODULE hModule;
  FARPROC pFVar2;
  int *piVar3;
  void *pvVar4;
  uint uVar5;
  undefined4 uVar6;
  int iVar7;
  undefined4 *puVar8;
  int *in_ECX;
  int *piVar9;
  int *piVar10;
  int *piVar11;
  uint uVar12;
  undefined4 *puVar13;
  bool bVar14;
  undefined1 local_4c [12];
  void *local_40;
  int *local_3c;
  undefined4 *local_38;
  undefined4 *local_34;
  int *local_30;
  undefined4 *local_2c;
  uint local_28;
  undefined4 *local_24;
  int *local_20;
  int *local_1c;
  int *local_18;
  int *local_14;
  int *local_10;
  undefined4 *local_c;
  uint local_8;
  
  in_ECX[0x41] = 0;
  local_14 = (int *)0x0;
  local_10 = (int *)0x0;
  local_3c = (int *)0x0;
  local_28 = 0;
  local_38 = (undefined4 *)0x0;
  local_24 = (undefined4 *)0x0;
  local_1c = (int *)0x0;
  local_18 = (int *)0x0;
  local_30 = (int *)0x0;
  local_40 = (void *)0x0;
  local_20 = (int *)0x0;
  local_2c = (undefined4 *)0x0;
  local_34 = (undefined4 *)0x0;
  iVar1 = FUN_1009935c();
  if (iVar1 < 0) goto LAB_100c9800;
  iVar1 = FUN_100860e0(&DAT_1010e8ec,0x40311,0xffffffff,4);
  in_ECX[0x61] = iVar1;
  if (iVar1 == -1) goto LAB_100c8d5e;
  iVar1 = (**(code **)(*in_ECX + 0xa0))();
  if (iVar1 == 0) {
    in_ECX[0x43] = 0;
    in_ECX[0x44] = 0;
    in_ECX[0x45] = 0;
    in_ECX[0x47] = 0;
    in_ECX[0x48] = 0;
    if ((int *)in_ECX[0x6c] != (int *)0x0) {
      (**(code **)(*(int *)in_ECX[0x6c] + 8))();
      in_ECX[0x6c] = 0;
    }
    if (((*(byte *)(in_ECX + 0x33) & 2) == 0) &&
       (((hModule = GetModuleHandleA("d3d9.dll"), hModule != (HMODULE)0x0 ||
         (hModule = LoadLibraryA("d3d9.dll"), hModule != (HMODULE)0x0)) &&
        (pFVar2 = GetProcAddress(hModule,"Direct3DShaderValidatorCreate9"), pFVar2 != (FARPROC)0x0))
       )) {
      piVar3 = (int *)(*pFVar2)();
      in_ECX[0x6c] = (int)piVar3;
      if ((piVar3 != (int *)0x0) &&
         (iVar1 = (**(code **)(*piVar3 + 0xc))(piVar3,FUN_100c4d4d), iVar1 < 0)) goto LAB_100c9800;
    }
    if ((*(byte *)(in_ECX + 0x33) & 1) != 0) {
      pvVar4 = operator_new(in_ECX[3] * 0x30);
      in_ECX[0x49] = (int)pvVar4;
      if (pvVar4 == (void *)0x0) goto LAB_100c8d5e;
      in_ECX[0x4a] = 0;
      in_ECX[0x4b] = in_ECX[3] << 1;
    }
    in_ECX[0x4e] = -1;
    uVar5 = 0;
    in_ECX[0x53] = 0;
    if (in_ECX[2] != 0) {
      do {
        iVar1 = uVar5 * 4;
        uVar5 = uVar5 + 1;
        *(undefined4 *)(*(int *)(in_ECX[5] + iVar1) + 0x30) = 0;
      } while (uVar5 < (uint)in_ECX[2]);
    }
    local_8 = 0;
    local_c = (undefined4 *)0x0;
    if (in_ECX[2] != 0) {
      do {
        iVar1 = *(int *)(in_ECX[5] + (int)local_c * 4);
        iVar7 = *(int *)(in_ECX[4] + *(int *)(iVar1 + 4) * 4);
        uVar5 = *(uint *)(iVar7 + 4);
        if ((((uVar5 & 0x10) != 0) && ((uVar5 & 0x200) == 0)) || ((uVar5 & 0x20) != 0)) {
          (**(code **)(*in_ECX + 4))(iVar1);
        }
        if ((*(byte *)(iVar7 + 4) & 0x80) != 0) {
          local_8 = local_8 + 1;
        }
        local_c = (undefined4 *)((int)local_c + 1);
      } while (local_c < (undefined4 *)in_ECX[2]);
    }
    if (local_8 <= (uint)in_ECX[0x13]) {
      if ((((in_ECX[0x32] & 0xffff0000U) == 0xfffe0000) &&
          (iVar1 = FUN_100ba1bc(in_ECX[0x20],in_ECX[10],0x10,0x204,0x76), iVar1 < 0)) ||
         (((in_ECX[0x32] & 0xffff0000U) == 0xffff0000 &&
          (iVar1 = FUN_100ba1bc(0xffffffff,in_ECX[0x13],0x80,0,0x73), iVar1 < 0))))
      goto LAB_100c9800;
      if (in_ECX[2] != 0) {
        local_1c = (int *)in_ECX[2];
        piVar3 = (int *)in_ECX[5];
        do {
          iVar1 = *piVar3;
          iVar7 = *(int *)(iVar1 + 4);
          piVar11 = local_10;
          if (((in_ECX[0x22] != iVar7) ||
              (piVar9 = (int *)(*(int *)(iVar1 + 0xc) + 1), piVar10 = local_14, piVar9 <= local_3c))
             && ((((piVar9 = local_3c, in_ECX[0x20] != iVar7 ||
                   (piVar10 = (int *)(*(int *)(iVar1 + 0xc) + 1), piVar10 <= local_14)) &&
                  (((in_ECX[0x21] != iVar7 ||
                    (piVar11 = (int *)(*(int *)(iVar1 + 0xc) + 1), piVar10 = local_14,
                    piVar11 <= local_10)) &&
                   (piVar10 = local_14, piVar11 = local_10,
                   (*(byte *)(*(int *)(in_ECX[4] + iVar7 * 4) + 4) & 0x80) != 0)))) &&
                 (uVar5 = *(int *)(iVar1 + 0xc) + 1, local_28 < uVar5)))) {
            local_28 = uVar5;
          }
          local_10 = piVar11;
          local_14 = piVar10;
          local_3c = piVar9;
          piVar3 = piVar3 + 1;
          local_1c = (int *)((int)local_1c + -1);
        } while (local_1c != (int *)0x0);
      }
      local_8 = (int)local_14 << 2;
      local_1c = operator_new(local_8);
      if (local_1c != (int *)0x0) {
        piVar3 = (int *)((int)local_10 << 2);
        local_3c = piVar3;
        local_18 = operator_new((uint)piVar3);
        if (local_18 != (int *)0x0) {
          local_c = (undefined4 *)(local_28 << 2);
          local_30 = operator_new((uint)local_c);
          if (((local_30 != (int *)0x0) &&
              (local_40 = operator_new(local_8), local_40 != (void *)0x0)) &&
             (local_20 = operator_new((uint)piVar3), local_20 != (int *)0x0)) {
            piVar3 = local_1c;
            for (uVar5 = local_8 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
              *piVar3 = 0;
              piVar3 = piVar3 + 1;
            }
            for (uVar5 = local_8 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
              *(undefined1 *)piVar3 = 0;
              piVar3 = (int *)((int)piVar3 + 1);
            }
            piVar3 = local_18;
            for (uVar5 = (uint)local_3c >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
              *piVar3 = 0;
              piVar3 = piVar3 + 1;
            }
            for (uVar5 = (uint)local_3c & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
              *(undefined1 *)piVar3 = 0;
              piVar3 = (int *)((int)piVar3 + 1);
            }
            piVar3 = local_30;
            for (uVar5 = (uint)local_c >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
              *piVar3 = 0;
              piVar3 = piVar3 + 1;
            }
            for (uVar5 = (uint)local_c & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
              *(undefined1 *)piVar3 = 0;
              piVar3 = (int *)((int)piVar3 + 1);
            }
            uVar5 = 0;
            if (in_ECX[2] != 0) {
              do {
                iVar1 = *(int *)(in_ECX[5] + uVar5 * 4);
                iVar7 = *(int *)(iVar1 + 4);
                if (in_ECX[0x21] == iVar7) {
                  piVar3 = local_18;
                  if (*(int *)(iVar1 + 0x6c) == -1) goto LAB_100c98a3;
LAB_100c90ef:
                  piVar3[*(int *)(iVar1 + 0xc)] = iVar1;
                }
                else {
                  if (in_ECX[0x20] == iVar7) {
                    piVar3 = local_1c;
                    if (*(int *)(iVar1 + 0x6c) != -1) goto LAB_100c90ef;
                    goto LAB_100c98a3;
                  }
                  piVar3 = local_30;
                  if ((*(byte *)(*(int *)(in_ECX[4] + iVar7 * 4) + 4) & 0x80) != 0)
                  goto LAB_100c90ef;
                }
                uVar5 = uVar5 + 1;
              } while (uVar5 < (uint)in_ECX[2]);
            }
            local_c = (undefined4 *)0x0;
            if (in_ECX[2] != 0) {
              do {
                iVar1 = *(int *)(in_ECX[5] + (int)local_c * 4);
                if ((in_ECX[0x20] == *(int *)(iVar1 + 4)) &&
                   (piVar3 = (int *)0x0, local_14 != (int *)0x0)) {
                  do {
                    if ((local_1c[(int)piVar3] != 0) &&
                       (*(int *)(iVar1 + 0x6c) == *(int *)(local_1c[(int)piVar3] + 0x6c))) {
                      *(int **)(iVar1 + 0xc) = piVar3;
                    }
                    piVar3 = (int *)((int)piVar3 + 1);
                  } while (piVar3 < local_14);
                }
                local_c = (undefined4 *)((int)local_c + 1);
              } while (local_c < (undefined4 *)in_ECX[2]);
            }
            piVar3 = local_1c;
            for (uVar5 = local_8 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
              *piVar3 = 0;
              piVar3 = piVar3 + 1;
            }
            uVar12 = 0;
            for (uVar5 = local_8 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
              *(undefined1 *)piVar3 = 0;
              piVar3 = (int *)((int)piVar3 + 1);
            }
            if (in_ECX[2] != 0) {
              do {
                iVar1 = *(int *)(in_ECX[5] + uVar12 * 4);
                uVar5 = *(uint *)(*(int *)(in_ECX[4] + *(int *)(iVar1 + 4) * 4) + 4);
                if (((uVar5 & 0x10) != 0) && ((uVar5 & 0x204) == 0)) {
                  local_1c[*(int *)(iVar1 + 0xc)] = iVar1;
                }
                uVar12 = uVar12 + 1;
              } while (uVar12 < (uint)in_ECX[2]);
            }
            piVar3 = (int *)0x0;
            local_3c = (int *)0x0;
            if (local_14 != (int *)0x0) {
              do {
                if (local_1c[(int)piVar3] != 0) {
                  local_3c = (int *)((int)local_3c + 1);
                }
                piVar3 = (int *)((int)piVar3 + 1);
              } while (piVar3 < local_14);
            }
            iVar1 = FUN_100c5932();
            if (((iVar1 < 0) || (iVar1 = (**(code **)(*in_ECX + 0x2c))(), iVar1 < 0)) ||
               ((((*(byte *)(in_ECX + 0x33) & 4) == 0 ||
                 ((*(byte *)((int)in_ECX + 0x6e) & 0x20) != 0)) &&
                ((iVar1 = FUN_100ba843(), iVar1 < 0 ||
                 (iVar1 = (**(code **)(*in_ECX + 0x28))(), iVar1 < 0)))))) goto LAB_100c9800;
            if (in_ECX[99] != 0) {
              local_c = (undefined4 *)FUN_100860e0(&DAT_1010e8c0,0x351,0xffffffff,4);
              if (local_c == (undefined4 *)0xffffffff) goto LAB_100c8d5e;
              uVar5 = 0;
              piVar3 = in_ECX + 100;
              do {
                iVar1 = FUN_10086139(local_c,uVar5 >> 2,uVar5 & 3,(&DAT_1011a708)[uVar5]);
                *piVar3 = iVar1;
                if (iVar1 == -1) goto LAB_100c8d5e;
                uVar5 = uVar5 + 1;
                piVar3 = piVar3 + 1;
              } while (uVar5 < 8);
            }
            iVar1 = FUN_100ba1bc(in_ECX[0x1f],in_ECX[0xe],0x200,0x42080,99);
            if (((iVar1 < 0) ||
                (iVar1 = FUN_100ba1bc(in_ECX[0x27],in_ECX[0x18],0x2200,0x80,0x62), iVar1 < 0)) ||
               (iVar1 = FUN_100ba1bc(in_ECX[0x2c],in_ECX[0x10],0x40200,0x80,0x69), iVar1 < 0))
            goto LAB_100c9800;
            uVar5 = 0;
            in_ECX[0x41] = 0;
            if (in_ECX[3] == 0) {
              iVar1 = 0;
            }
            else {
              iVar1 = *(int *)in_ECX[6];
            }
            in_ECX[0x40] = iVar1;
            in_ECX[0x3f] = 0;
            iVar1 = (**(code **)(*in_ECX + 0x38))();
            if (iVar1 < 0) goto LAB_100c9800;
            local_8 = 0;
            if (in_ECX[2] != 0) {
              local_2c = (undefined4 *)in_ECX[2];
              piVar3 = (int *)in_ECX[5];
              do {
                uVar12 = *(uint *)(*(int *)(in_ECX[4] + *(int *)(*piVar3 + 4) * 4) + 4);
                if ((((uVar12 & 0x100) != 0) && (*(int *)(*piVar3 + 8) == -1)) &&
                   (((uVar12 & 0x800) == 0 || (in_ECX[0x56] != 0)))) {
                  uVar5 = uVar5 + 1;
                }
                piVar3 = piVar3 + 1;
                local_2c = (undefined4 *)((int)local_2c + -1);
              } while (local_2c != (undefined4 *)0x0);
            }
            local_2c = operator_new(uVar5 << 4);
            if (local_2c != (undefined4 *)0x0) {
              local_38 = operator_new(uVar5 << 2);
              if (local_38 != (undefined4 *)0x0) {
                puVar13 = local_2c;
                for (iVar1 = (uVar5 & 0xfffffff) << 2; iVar1 != 0; iVar1 = iVar1 + -1) {
                  *puVar13 = 0;
                  puVar13 = puVar13 + 1;
                }
                for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
                  *(undefined1 *)puVar13 = 0;
                  puVar13 = (undefined4 *)((int)puVar13 + 1);
                }
                puVar13 = local_38;
                for (uVar5 = uVar5 & 0x3fffffff; uVar5 != 0; uVar5 = uVar5 - 1) {
                  *puVar13 = 0;
                  puVar13 = puVar13 + 1;
                }
                for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
                  *(undefined1 *)puVar13 = 0;
                  puVar13 = (undefined4 *)((int)puVar13 + 1);
                }
                uVar5 = 0;
                if (in_ECX[2] != 0) {
                  do {
                    iVar1 = *(int *)(in_ECX[5] + uVar5 * 4);
                    uVar12 = *(uint *)(*(int *)(in_ECX[4] + *(int *)(iVar1 + 4) * 4) + 4);
                    if ((((uVar12 & 0x100) != 0) && (*(int *)(iVar1 + 8) == -1)) &&
                       (((*(int *)(iVar1 + 0x38) == -1 && ((uVar12 & 0x40000) == 0)) &&
                        (((uVar12 & 0x800) == 0 || (in_ECX[0x56] != 0)))))) {
                      uVar12 = 0;
                      if (local_8 != 0) {
                        do {
                          if (local_38[uVar12] == *(int *)(iVar1 + 0xc)) break;
                          uVar12 = uVar12 + 1;
                        } while (uVar12 < local_8);
                      }
                      if (uVar12 == local_8) {
                        local_8 = local_8 + 1;
                        local_38[uVar12] = *(undefined4 *)(iVar1 + 0xc);
                      }
                      local_2c[*(int *)(iVar1 + 0x10) + uVar12 * 4] =
                           (float)*(double *)(iVar1 + 0x20);
                    }
                    uVar5 = uVar5 + 1;
                  } while (uVar5 < (uint)in_ECX[2]);
                }
                uVar5 = 0;
                if (local_8 != 0) {
                  local_c = local_2c;
                  do {
                    iVar1 = (**(code **)(*in_ECX + 0x3c))(local_38[uVar5]);
                    if (iVar1 < 0) goto LAB_100c9800;
                    local_c = local_c + 4;
                    uVar5 = uVar5 + 1;
                  } while (uVar5 < local_8);
                }
                local_34 = (undefined4 *)0x0;
                local_8 = 0;
                if (in_ECX[2] != 0) {
                  piVar3 = (int *)in_ECX[5];
                  iVar1 = in_ECX[2];
                  do {
                    if (((*(byte *)(*(int *)(in_ECX[4] + *(int *)(*piVar3 + 4) * 4) + 5) & 1) != 0)
                       && (*(int *)(*piVar3 + 8) == -1)) {
                      local_34 = (undefined4 *)((int)local_34 + 1);
                    }
                    piVar3 = piVar3 + 1;
                    iVar1 = iVar1 + -1;
                  } while (iVar1 != 0);
                }
                puVar13 = local_34;
                local_34 = operator_new((int)local_34 << 4);
                if (local_34 == (undefined4 *)0x0) goto LAB_100c8d5e;
                local_24 = operator_new((int)puVar13 << 2);
                if (local_24 != (undefined4 *)0x0) {
                  local_c = (undefined4 *)0x0;
                  puVar8 = local_34;
                  for (iVar1 = ((uint)puVar13 & 0xfffffff) << 2; iVar1 != 0; iVar1 = iVar1 + -1) {
                    *puVar8 = 0;
                    puVar8 = puVar8 + 1;
                  }
                  for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
                    *(undefined1 *)puVar8 = 0;
                    puVar8 = (undefined4 *)((int)puVar8 + 1);
                  }
                  uVar5 = (uint)puVar13 & 0x3fffffff;
                  puVar13 = local_24;
                  for (; uVar5 != 0; uVar5 = uVar5 - 1) {
                    *puVar13 = 0;
                    puVar13 = puVar13 + 1;
                  }
                  for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
                    *(undefined1 *)puVar13 = 0;
                    puVar13 = (undefined4 *)((int)puVar13 + 1);
                  }
                  if (in_ECX[2] != 0) {
                    do {
                      iVar1 = *(int *)(in_ECX[5] + (int)local_c * 4);
                      uVar5 = *(uint *)(*(int *)(in_ECX[4] + *(int *)(iVar1 + 4) * 4) + 4);
                      if (((((uVar5 & 0x100) != 0) && (*(int *)(iVar1 + 8) == -1)) &&
                          (*(int *)(iVar1 + 0x38) == -1)) && ((uVar5 & 0x40000) != 0)) {
                        uVar5 = 0;
                        bVar14 = local_8 == 0;
                        if (local_8 != 0) {
                          do {
                            if (local_24[uVar5] == *(int *)(iVar1 + 0xc)) break;
                            uVar5 = uVar5 + 1;
                          } while (uVar5 < local_8);
                          bVar14 = uVar5 == local_8;
                        }
                        if (bVar14) {
                          local_8 = local_8 + 1;
                          local_24[uVar5] = *(undefined4 *)(iVar1 + 0xc);
                        }
                        uVar6 = __ftol();
                        local_34[*(int *)(iVar1 + 0x10) + uVar5 * 4] = uVar6;
                      }
                      local_c = (undefined4 *)((int)local_c + 1);
                    } while (local_c < (undefined4 *)in_ECX[2]);
                  }
                  uVar5 = 0;
                  if (local_8 != 0) {
                    local_c = local_34;
                    do {
                      iVar1 = (**(code **)(*in_ECX + 0x40))(local_24[uVar5]);
                      if (iVar1 < 0) goto LAB_100c9800;
                      local_c = local_c + 4;
                      uVar5 = uVar5 + 1;
                    } while (uVar5 < local_8);
                  }
                  if ((int *)in_ECX[0x11] < local_3c) {
LAB_100c98a3:
                    FUN_1008b0b5();
                  }
                  else {
                    local_c = (undefined4 *)0x0;
                    if (local_14 != (int *)0x0) {
                      local_3c = local_14;
                      piVar3 = local_1c;
                      do {
                        if ((*piVar3 != 0) &&
                           (iVar1 = (**(code **)(*in_ECX + 0x44))(*piVar3), iVar1 < 0)) {
                          local_c = (undefined4 *)0x1;
                        }
                        piVar3 = piVar3 + 1;
                        local_3c = (int *)((int)local_3c - 1);
                      } while (local_3c != (int *)0x0);
                    }
                    iVar1 = (**(code **)(*in_ECX + 0x4c))();
                    uVar5 = 0;
                    if (iVar1 < 0) goto LAB_100c9800;
                    if (local_28 != 0) {
                      do {
                        if ((local_30[uVar5] != 0) &&
                           (iVar1 = (**(code **)(*in_ECX + 0x48))(), iVar1 < 0)) {
                          local_c = (undefined4 *)0x1;
                        }
                        uVar5 = uVar5 + 1;
                      } while (uVar5 < local_28);
                    }
                    if ((*(byte *)(in_ECX + 0x1c) & 0x80) == 0) {
                      if (local_10 != (int *)0x0) {
                        iVar1 = (int)local_20 - (int)local_18;
                        local_3c = local_10;
                        piVar3 = local_18;
                        do {
                          if ((*piVar3 != 0) &&
                             (iVar7 = (**(code **)(*in_ECX + 0x6c))
                                                (*piVar3,(undefined1 *)((int)piVar3 + iVar1),0),
                             iVar7 < 0)) {
                            local_c = (undefined4 *)0x1;
                          }
                          piVar3 = piVar3 + 1;
                          local_3c = (int *)((int)local_3c - 1);
                        } while (local_3c != (int *)0x0);
                      }
                    }
                    else if (local_10 != (int *)0x0) {
                      local_3c = local_10;
                      piVar3 = local_18;
                      do {
                        if ((*piVar3 != 0) &&
                           (iVar1 = (**(code **)(*in_ECX + 0x44))(*piVar3), iVar1 < 0)) {
                          local_c = (undefined4 *)0x1;
                        }
                        piVar3 = piVar3 + 1;
                        local_3c = (int *)((int)local_3c - 1);
                      } while (local_3c != (int *)0x0);
                      local_3c = (int *)0x0;
                    }
                    iVar1 = 0;
                    if (local_c == (undefined4 *)0x0) {
                      piVar3 = (int *)0x0;
                      if (local_10 != (int *)0x0) {
                        do {
                          if ((*(int *)(iVar1 + (int)local_18) != 0) &&
                             (local_3c = (int *)0x0, iVar1 != 0)) {
                            piVar11 = local_20;
                            do {
                              if ((*(int *)(((int)local_18 - (int)local_20) + (int)piVar11) != 0) &&
                                 (*(int *)(iVar1 + (int)local_20) == *piVar11)) goto LAB_100c98a3;
                              local_3c = (int *)((int)local_3c + 1);
                              piVar11 = piVar11 + 1;
                            } while (local_3c < piVar3);
                          }
                          piVar3 = (int *)((int)piVar3 + 1);
                          iVar1 = iVar1 + 4;
                        } while (piVar3 < local_10);
                      }
                      if (((((((*(byte *)((int)in_ECX + 0x6e) & 0x40) != 0) ||
                             (iVar1 = FUN_100ba843(), -1 < iVar1)) &&
                            (iVar1 = (**(code **)(*in_ECX + 0x24))(), -1 < iVar1)) &&
                           (((in_ECX[0x38] == 0 || (iVar1 = FUN_100c7b6a(), -1 < iVar1)) &&
                            ((iVar1 = FUN_100c7c92(), -1 < iVar1 &&
                             (((*(byte *)(in_ECX + 0x33) & 1) == 0 ||
                              (iVar1 = FUN_100c85fc(), -1 < iVar1)))))))) &&
                          (iVar1 = FUN_100c7b3a(), -1 < iVar1)) &&
                         ((iVar1 = FUN_100c4cc4(), -1 < iVar1 &&
                          ((((int *)in_ECX[0x6c] == (int *)0x0 || (in_ECX[0x35] != 0)) ||
                           (iVar1 = (**(code **)(*(int *)in_ECX[0x6c] + 0x14))(), -1 < iVar1)))))) {
                        if (param_1 != (uint *)0x0) {
                          iVar1 = FUN_10081d1e(in_ECX[0x44] << 2,&local_3c);
                          if (iVar1 < 0) goto LAB_100c9800;
                          puVar13 = (undefined4 *)in_ECX[0x43];
                          local_28 = in_ECX[0x44] << 2;
                          puVar8 = (undefined4 *)(**(code **)(*local_3c + 0xc))();
                          for (uVar5 = local_28 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
                            *puVar8 = *puVar13;
                            puVar13 = puVar13 + 1;
                            puVar8 = puVar8 + 1;
                          }
                          for (uVar5 = local_28 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
                            *(undefined1 *)puVar8 = *(undefined1 *)puVar13;
                            puVar13 = (undefined4 *)((int)puVar13 + 1);
                            puVar8 = (undefined4 *)((int)puVar8 + 1);
                          }
                          *param_1 = (uint)local_3c;
                        }
                        iVar1 = 0;
                      }
                      goto LAB_100c9800;
                    }
                  }
                }
              }
              goto LAB_100c96ac;
            }
          }
        }
      }
LAB_100c8d5e:
      iVar1 = -0x7ff8fff2;
      goto LAB_100c9800;
    }
    iVar1 = FUN_10063814(in_ECX[0x32],0,local_4c);
    if (-1 < iVar1) {
      if (in_ECX[0x13] == 0) {
        FUN_1008b0b5();
      }
      else {
        FUN_1008b0b5();
      }
    }
  }
LAB_100c96ac:
  iVar1 = -0x7fffbffb;
LAB_100c9800:
  _free(local_1c);
  _free(local_18);
  _free(local_40);
  _free(local_20);
  _free((void *)0x0);
  _free(local_2c);
  _free(local_38);
  _free(local_30);
  _free(local_34);
  _free(local_24);
  _free((void *)in_ECX[0x43]);
  in_ECX[0x43] = 0;
  _free((void *)in_ECX[0x49]);
  in_ECX[0x49] = 0;
  piVar3 = (int *)in_ECX[0x6c];
  if (piVar3 != (int *)0x0) {
    (**(code **)(*piVar3 + 8))();
    in_ECX[0x6c] = 0;
  }
  return iVar1;
}


