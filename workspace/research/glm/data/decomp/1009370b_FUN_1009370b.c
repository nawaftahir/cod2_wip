// 1009370b size=1281 FUN_1009370b

int FUN_1009370b(void)

{
  uint *puVar1;
  uint *puVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  void *pvVar6;
  uint uVar7;
  int iVar8;
  int iVar9;
  undefined4 uVar10;
  int in_ECX;
  uint uVar11;
  int iVar12;
  int *piVar13;
  uint local_24;
  uint local_20;
  uint local_1c;
  uint local_18;
  int local_14;
  int local_10;
  int local_c;
  uint local_8;
  
  if (((*(uint *)(in_ECX + 0xcc) & 0x100) == 0) && ((*(uint *)(in_ECX + 0xcc) & 4) == 0)) {
    iVar5 = FUN_1008d61e();
    if (-1 < iVar5) {
      pvVar6 = operator_new(0x1fc);
      if (pvVar6 == (void *)0x0) {
        iVar5 = 0;
      }
      else {
        iVar5 = FUN_100b85f2();
      }
      *(int *)(in_ECX + 0xe0) = iVar5;
      if (iVar5 == 0) {
LAB_10093c05:
        iVar5 = -0x7ff8fff2;
      }
      else {
        iVar5 = FUN_1008b5d4(in_ECX,0x46580201,*(uint *)(in_ECX + 0xcc) | 0x100);
        if (((-1 < iVar5) && (iVar5 = FUN_10086f48(), -1 < iVar5)) &&
           (iVar5 = FUN_10087159(), -1 < iVar5)) {
          uVar7 = 0;
          if (*(int *)(in_ECX + 8) != 0) {
            do {
              *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar7 * 4) + 0x30) = 0xffffffff;
              *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar7 * 4) + 0x44) = 0xffffffff;
              uVar7 = uVar7 + 1;
            } while (uVar7 < *(uint *)(in_ECX + 8));
          }
          local_10 = -1;
          local_c = 0;
          local_18 = 0;
          if (*(int *)(in_ECX + 0xc) != 0) {
            do {
              puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_18 * 4);
              if ((*puVar1 & 0xfff00000) != 0) {
                uVar7 = puVar1[1];
                uVar11 = *puVar1 & 0xfffff;
                local_24 = 0;
                if (uVar7 / uVar11 != 0) {
                  local_14 = 0;
                  do {
                    local_8 = 0;
                    if (uVar11 != 0) {
                      piVar13 = (int *)(puVar1[2] + local_14);
                      local_20 = uVar11;
                      do {
                        if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                                *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                                 *piVar13 * 4) + 4) * 4) + 4) & 2)
                             != 0) && (iVar5 = FUN_10086f0d(), iVar5 == 0)) {
                          local_8 = local_8 + 1;
                        }
                        piVar13 = piVar13 + 1;
                        local_20 = local_20 - 1;
                      } while (local_20 != 0);
                      if (local_8 != 0) {
                        if (((local_10 == -1) &&
                            (local_10 = FUN_100860e0(&DAT_1010e914,0x80251,0xffffffff,4),
                            local_10 == -1)) ||
                           (iVar5 = FUN_10086199(local_8 & 0xfffff | 0x10000000,local_8,local_8),
                           iVar5 == -1)) goto LAB_10093c05;
                        puVar2 = *(uint **)(*(int *)(*(int *)(in_ECX + 0xe0) + 0x18) + iVar5 * 4);
                        FUN_100853b0();
                        local_8 = 0;
                        local_1c = 0;
                        iVar5 = local_14;
                        do {
                          uVar3 = puVar1[2];
                          iVar4 = *(int *)(uVar3 + iVar5);
                          iVar12 = iVar4 * 4;
                          iVar9 = *(int *)(iVar12 + *(int *)(in_ECX + 0x14));
                          if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                                   *(int *)(iVar9 + 4) * 4) + 4) & 2) != 0) &&
                              (iVar8 = FUN_10086f0d(), iVar8 == 0)) &&
                             ((*(int *)(iVar9 + 0x48) == -1 ||
                              ((**(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar9 + 0x48) * 4) &
                               0xfff00000) != 0x10100000)))) {
                            if (*(int *)(iVar9 + 0x30) == -1) {
                              iVar9 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 0xe0) + 0x84),
                                                   local_c,local_8,0);
                              if (iVar9 == -1) goto LAB_10093c05;
                              *(int *)(local_8 * 4 + puVar2[4]) = iVar9;
                              *(int *)(local_8 * 4 + puVar2[2]) = iVar4;
                              uVar10 = FUN_10086139(local_10,local_c,local_8,0);
                              *(undefined4 *)(iVar5 + puVar1[2]) = uVar10;
                              if (*(int *)(iVar5 + puVar1[2]) == -1) goto LAB_10093c05;
                              iVar4 = *(int *)(*(int *)(in_ECX + 0x14) +
                                              *(int *)(iVar5 + puVar1[2]) * 4);
                              FUN_10085d21();
                              *(undefined4 *)(iVar4 + 0x60) = 0;
                              *(undefined4 *)(iVar4 + 100) = 0;
                              local_8 = local_8 + 1;
                              *(int *)(iVar4 + 0x44) = iVar9;
                              *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar12) + 0x30) =
                                   *(undefined4 *)(iVar5 + puVar1[2]);
                            }
                            else {
                              *(int *)(uVar3 + iVar5) = *(int *)(iVar9 + 0x30);
                            }
                          }
                          local_1c = local_1c + 1;
                          iVar5 = iVar5 + 4;
                        } while (local_1c < uVar11);
                        local_c = local_c + 1;
                        *puVar2 = -(uint)(local_8 != 0) & (local_8 & 0xfffff | 0x10000000);
                        puVar2[3] = local_8;
                        puVar2[1] = local_8;
                      }
                    }
                    local_24 = local_24 + 1;
                    local_14 = local_14 + uVar11 * 4;
                  } while (local_24 < uVar7 / uVar11);
                }
              }
              local_18 = local_18 + 1;
            } while (local_18 < *(uint *)(in_ECX + 0xc));
          }
          local_18 = 0;
          if (*(int *)(in_ECX + 8) != 0) {
            do {
              iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + local_18 * 4);
              if (((*(int *)(iVar5 + 8) != -1) &&
                  (iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar5 + 8) * 4),
                  (*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar4 + 4) * 4) + 4) & 2)
                  != 0)) && (iVar9 = FUN_10086f0d(), iVar9 == 0)) {
                if (*(int *)(iVar4 + 0x30) == -1) {
                  if (((local_10 == -1) &&
                      (local_10 = FUN_100860e0(&DAT_1010e914,0x80251,0xffffffff,4), local_10 == -1))
                     || (iVar9 = FUN_10086199(0x10000001,1,1), iVar9 == -1)) goto LAB_10093c05;
                  iVar9 = *(int *)(*(int *)(*(int *)(in_ECX + 0xe0) + 0x18) + iVar9 * 4);
                  FUN_100853b0();
                  **(undefined4 **)(iVar9 + 8) = *(undefined4 *)(iVar5 + 8);
                  uVar10 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 0xe0) + 0x84),local_c,0,0)
                  ;
                  **(undefined4 **)(iVar9 + 0x10) = uVar10;
                  if (**(int **)(iVar9 + 0x10) == -1) goto LAB_10093c05;
                  iVar12 = FUN_10086139(local_10,local_c,0,0);
                  *(int *)(iVar4 + 0x30) = iVar12;
                  if (iVar12 == -1) goto LAB_10093c05;
                  iVar12 = *(int *)(*(int *)(in_ECX + 0x14) + iVar12 * 4);
                  FUN_10085d21();
                  uVar10 = **(undefined4 **)(iVar9 + 0x10);
                  *(undefined4 *)(iVar12 + 0x60) = 0;
                  *(undefined4 *)(iVar12 + 100) = 0;
                  local_c = local_c + 1;
                  *(undefined4 *)(iVar12 + 0x44) = uVar10;
                }
                *(undefined4 *)(iVar5 + 8) = *(undefined4 *)(iVar4 + 0x30);
              }
              local_18 = local_18 + 1;
            } while (local_18 < *(uint *)(in_ECX + 8));
          }
          iVar5 = FUN_1008bec4();
          if ((iVar5 == 0) || (-1 < iVar5)) {
            iVar5 = FUN_10086eae();
            if ((iVar5 == 0) || (-1 < iVar5)) {
              FUN_1008a979();
              iVar5 = FUN_1008bec4();
              if ((iVar5 == 0) || (-1 < iVar5)) {
                iVar5 = FUN_10086eae();
                if ((iVar5 == 0) || (-1 < iVar5)) {
                  iVar5 = FUN_1008d525();
                  if ((iVar5 == 0) || (-1 < iVar5)) {
                    iVar5 = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else {
    iVar5 = 1;
  }
  return iVar5;
}


