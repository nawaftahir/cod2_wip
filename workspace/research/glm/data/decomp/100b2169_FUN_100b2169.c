// 100b2169 size=2723 FUN_100b2169

int FUN_100b2169(void)

{
  uint *puVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  int iVar4;
  void *pvVar5;
  int *piVar6;
  int in_ECX;
  uint uVar7;
  int iVar8;
  uint uVar9;
  undefined4 *puVar10;
  int local_24;
  uint local_20;
  uint local_1c;
  uint local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  uVar2 = FUN_100860e0(&DAT_1010e914,0x311,1,4);
  uVar3 = FUN_10086139(uVar2,0,0,0);
  *(undefined4 *)(in_ECX + 0x440) = uVar3;
  uVar2 = FUN_10086139(uVar2,0,1,0x3ff0000000000000);
  *(undefined4 *)(in_ECX + 0x444) = uVar2;
  *(undefined4 *)(in_ECX + 0x44c) = 0;
  if ((*(uint *)(in_ECX + 200) & 0xffff) == 0x104) {
    uVar9 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        *(uint *)(in_ECX + 0xfc) = uVar9;
        puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar9 * 4);
        *(uint **)(in_ECX + 0x100) = puVar1;
        if (((*puVar1 & 0xfff00000) == 0x60700000) && (iVar4 = FUN_100a70a7(), iVar4 < 0)) {
          return iVar4;
        }
        uVar9 = uVar9 + 1;
      } while (uVar9 < *(uint *)(in_ECX + 0xc));
    }
    FUN_100ba843();
    FUN_1008bec4();
  }
  local_10 = 0;
  local_c = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      local_8 = 0;
      if (puVar1[1] != 0) {
        piVar6 = (int *)puVar1[2];
        do {
          iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar6 * 4);
          uVar9 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar4 + 4) * 4) + 4);
          if (((((uVar9 & 0x10) != 0) && ((uVar9 & 0x200) == 0)) && (*(int *)(iVar4 + 0x10) == 3))
             && ((*(char *)(iVar4 + 0x6c) == '\x03' &&
                 (((*puVar1 & 0xfff00000) != 0x60700000 || (local_8 != 7)))))) {
            local_10 = 1;
            FUN_1008b0b5();
            break;
          }
          local_8 = local_8 + 1;
          piVar6 = piVar6 + 1;
        } while (local_8 < *(uint *)(*(int *)(in_ECX + 0x100) + 4));
      }
      uVar9 = **(uint **)(in_ECX + 0x100) & 0xfff00000;
      if (((uVar9 == 0x60600000) || (uVar9 == 0x60b00000)) ||
         ((uVar9 == 0x60100000 || (uVar9 == 0x61000000)))) {
        FUN_1008b0b5();
        local_10 = 1;
      }
      local_c = local_c + 1;
    } while (local_c < *(uint *)(in_ECX + 0xc));
    if (local_10 != 0) {
      return -0x7fffbffb;
    }
  }
  uVar9 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar9 * 4) + 0x38) = 0xffffffff;
      puVar10 = *(undefined4 **)(*(int *)(in_ECX + 0x14) + uVar9 * 4);
      if (puVar10[1] == *(int *)(in_ECX + 0x80)) {
        if (*(char *)(puVar10 + 0x1b) == '\x01') {
          *puVar10 = 0x14;
        }
        if (((*(uint *)(in_ECX + 200) & 0xffff) < 0x104) &&
           (puVar10 = *(undefined4 **)(*(int *)(in_ECX + 0x14) + uVar9 * 4),
           *(char *)(puVar10 + 0x1b) == '\x03')) {
          *puVar10 = 0x14;
        }
      }
      uVar9 = uVar9 + 1;
    } while (uVar9 < *(uint *)(in_ECX + 8));
  }
  uVar9 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar9;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar9 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      uVar7 = *puVar1 & 0xfff00000;
      if (((((uVar7 == 0x60000000) || (uVar7 == 0x60500000)) || (uVar7 == 0x60a00000)) ||
          (uVar7 == 0x60f00000)) && (uVar7 = 0, puVar1[3] != 0)) {
        do {
          **(undefined4 **)
            (*(int *)(in_ECX + 0x14) +
            *(int *)(*(int *)(*(int *)(in_ECX + 0x100) + 0x10) + uVar7 * 4) * 4) = 0x14;
          uVar7 = uVar7 + 1;
        } while (uVar7 < *(uint *)(*(int *)(in_ECX + 0x100) + 0xc));
      }
      uVar9 = uVar9 + 1;
      *(undefined4 *)(*(int *)(in_ECX + 0x100) + 0x24) = 0;
    } while (uVar9 < *(uint *)(in_ECX + 0xc));
  }
  uVar9 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar9;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar9 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      uVar7 = *puVar1 & 0xfff00000;
      if ((((uVar7 == 0x20000000) || (uVar7 == 0x20100000)) || (uVar7 == 0x30000000)) &&
         (iVar4 = FUN_100bc34f(), iVar4 < 0)) {
        return iVar4;
      }
      uVar9 = uVar9 + 1;
    } while (uVar9 < *(uint *)(in_ECX + 0xc));
  }
  uVar9 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar9;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar9 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      uVar7 = *puVar1 & 0xfff00000;
      if (uVar7 == 0x10000000) {
        iVar4 = FUN_100a7509();
LAB_100b2494:
        if (iVar4 < 0) {
          return iVar4;
        }
      }
      else if (uVar7 == 0x10100000) {
        iVar4 = FUN_100a7635();
        goto LAB_100b2494;
      }
      uVar9 = uVar9 + 1;
    } while (uVar9 < *(uint *)(in_ECX + 0xc));
  }
  FUN_100ba843();
  uVar9 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar9;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar9 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      uVar7 = *puVar1 & 0xfff00000;
      if (uVar7 == 0x10100000) {
        FUN_100c6123();
LAB_100b2528:
        iVar4 = FUN_100c7450();
LAB_100b252f:
        if (iVar4 < 0) {
          return iVar4;
        }
      }
      else {
        if (uVar7 == 0x20400000) {
          FUN_100c74f0();
          FUN_100c6e69();
          FUN_100c72c8();
          iVar4 = FUN_100c7166();
          goto LAB_100b252f;
        }
        if (uVar7 == 0x20500000) {
          FUN_100c7166();
          goto LAB_100b2528;
        }
        if (uVar7 == 0x50000000) {
          iVar4 = FUN_100be188();
          goto LAB_100b252f;
        }
      }
      uVar9 = uVar9 + 1;
    } while (uVar9 < *(uint *)(in_ECX + 0xc));
  }
  FUN_100ba843();
  uVar9 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar9;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar9 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      uVar7 = *puVar1 & 0xfff00000;
      if (((uVar7 == 0x20400000) || (uVar7 == 0x20500000)) && (iVar4 = FUN_100a995f(), iVar4 < 0)) {
        return iVar4;
      }
      uVar9 = uVar9 + 1;
    } while (uVar9 < *(uint *)(in_ECX + 0xc));
  }
  FUN_100ba843();
  uVar9 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar9;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar9 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      if ((*puVar1 & 0xfff00000) == 0x60f00000) {
        iVar4 = FUN_100a8ea3();
        if (iVar4 < 0) {
          return iVar4;
        }
        iVar4 = FUN_100a8ea3();
        if (iVar4 < 0) {
          return iVar4;
        }
      }
      uVar9 = uVar9 + 1;
    } while (uVar9 < *(uint *)(in_ECX + 0xc));
  }
  FUN_100ba843();
  uVar9 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar9;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar9 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      if (((*puVar1 & 0xfff00000) == 0x20400000) && (iVar4 = FUN_100a9583(), iVar4 < 0)) {
        return iVar4;
      }
      uVar9 = uVar9 + 1;
    } while (uVar9 < *(uint *)(in_ECX + 0xc));
  }
  FUN_100ba843();
  uVar9 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar9;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar9 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      if ((*puVar1 & 0xfff00000) == 0x70300000) {
        FUN_100c768d();
        iVar4 = FUN_100c19e8();
        if (iVar4 < 0) {
          return iVar4;
        }
      }
      uVar9 = uVar9 + 1;
    } while (uVar9 < *(uint *)(in_ECX + 0xc));
  }
  uVar9 = *(uint *)(in_ECX + 0xc);
  uVar7 = 0;
  if (uVar9 != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar7;
      *(undefined4 *)(in_ECX + 0x100) = *(undefined4 *)(*(int *)(in_ECX + 0x18) + uVar7 * 4);
      iVar4 = FUN_100a88e8();
      if (iVar4 < 0) {
        return iVar4;
      }
      uVar7 = uVar7 + 1;
    } while (uVar7 < uVar9);
  }
  FUN_100ba843();
  iVar4 = FUN_100c2620();
  if (iVar4 < 0) {
    return iVar4;
  }
  iVar4 = FUN_100a9330();
  if (iVar4 < 0) {
    return iVar4;
  }
  iVar4 = FUN_100a7c24();
  if (iVar4 < 0) {
    return iVar4;
  }
  if ((*(uint *)(in_ECX + 200) & 0xffff) == 0x104) {
    pvVar5 = operator_new(0x800);
    *(void **)(in_ECX + 0x22c) = pvVar5;
    if (pvVar5 != (void *)0x0) {
      pvVar5 = operator_new(0x800);
      *(void **)(in_ECX + 0x230) = pvVar5;
      if (pvVar5 != (void *)0x0) {
        *(undefined4 *)(in_ECX + 0x224) = 0;
        *(undefined4 *)(in_ECX + 0x220) = 0;
        puVar10 = *(undefined4 **)(in_ECX + 0x22c);
        for (iVar4 = 0x200; iVar4 != 0; iVar4 = iVar4 + -1) {
          *puVar10 = 0;
          puVar10 = puVar10 + 1;
        }
        puVar10 = *(undefined4 **)(in_ECX + 0x230);
        for (iVar4 = 0x200; iVar4 != 0; iVar4 = iVar4 + -1) {
          *puVar10 = 0;
          puVar10 = puVar10 + 1;
        }
        iVar4 = FUN_100ab286();
        if (iVar4 < 0) {
          return iVar4;
        }
        iVar4 = FUN_100ab7e6();
        if (iVar4 < 0) {
          return iVar4;
        }
        iVar4 = FUN_100ab94e();
        if (iVar4 != 0) {
          return -0x7fffbffb;
        }
        uVar9 = FUN_100ab874();
        if (uVar9 != 0xffffffff) {
          FUN_100ab0e0();
          local_10 = 0;
          piVar6 = (int *)(in_ECX + 0x304);
          do {
            iVar4 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0,0,0);
            *piVar6 = iVar4;
            if (iVar4 == -1) {
              return -0x7ff8fff2;
            }
            local_10 = local_10 + 1;
            piVar6 = piVar6 + 1;
            *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4) + 0x3c) = 0;
          } while (local_10 < 0x40);
          local_14 = 0xffffffff;
          local_20 = 0xffffffff;
          puVar10 = (undefined4 *)(in_ECX + 0x2c4);
          for (iVar4 = 0x10; iVar4 != 0; iVar4 = iVar4 + -1) {
            *puVar10 = 0;
            puVar10 = puVar10 + 1;
          }
          local_8 = 0;
          if (uVar9 != 0) {
            do {
              puVar10 = *(undefined4 **)(in_ECX + 0x22c);
              for (iVar4 = 0x200; iVar4 != 0; iVar4 = iVar4 + -1) {
                *puVar10 = 0;
                puVar10 = puVar10 + 1;
              }
              puVar10 = *(undefined4 **)(in_ECX + 0x230);
              for (iVar4 = 0x200; iVar4 != 0; iVar4 = iVar4 + -1) {
                *puVar10 = 0;
                puVar10 = puVar10 + 1;
              }
              *(undefined4 *)(in_ECX + 0x220) = 0;
              *(undefined4 *)(in_ECX + 0x224) = 0;
              iVar4 = FUN_100abbf7(local_8,1);
              if (iVar4 != 0) {
                *(undefined4 *)(in_ECX + 0x408) = 0;
                *(undefined4 *)(in_ECX + 0x404) = 0;
                FUN_100ab1d9();
                FUN_100b06a6(*(undefined4 *)(in_ECX + 0x22c),6,*(undefined4 *)(in_ECX + 0x220),
                             &local_1c);
                FUN_100b06a6(*(undefined4 *)(in_ECX + 0x230),6,*(undefined4 *)(in_ECX + 0x224),
                             &local_10);
                piVar6 = (int *)(in_ECX + 0x2c4);
                local_c = 0x10;
                do {
                  if (*piVar6 != 0) {
                    FUN_1006c418();
                  }
                  *piVar6 = 0;
                  piVar6 = piVar6 + 1;
                  local_c = local_c - 1;
                } while (local_c != 0);
                iVar4 = FUN_100b174b();
                if (iVar4 < 0) {
                  return iVar4;
                }
                if (((iVar4 != 1) && (iVar4 = FUN_100ac03e(), -1 < iVar4)) &&
                   (iVar4 = FUN_100ad8f8(1,1), -1 < iVar4)) {
                  FUN_100b06a6(*(undefined4 *)(in_ECX + 0x22c),6,*(undefined4 *)(in_ECX + 0x220),
                               &local_1c);
                  FUN_100b06a6(*(undefined4 *)(in_ECX + 0x230),6,*(undefined4 *)(in_ECX + 0x224),
                               &local_10);
                  piVar6 = *(int **)(in_ECX + 0x230);
                  iVar8 = 0;
                  local_c = 0;
                  iVar4 = *(int *)(in_ECX + 0x22c) - (int)piVar6;
                  local_18 = 6;
                  do {
                    if (*(int *)(iVar4 + (int)piVar6) != 0) {
                      iVar8 = iVar8 + 1;
                    }
                    if (*piVar6 != 0) {
                      local_c = local_c + 1;
                    }
                    piVar6 = piVar6 + 1;
                    local_18 = local_18 + -1;
                  } while (local_18 != 0);
                  local_18 = local_1c;
                  if (local_1c <= (uint)(iVar8 * 2)) {
                    local_18 = iVar8 * 2;
                  }
                  uVar7 = local_10;
                  if (local_10 <= local_c * 2) {
                    uVar7 = local_c * 2;
                  }
                  uVar7 = (-(uint)(iVar8 + local_1c != 0) & 10) + uVar7 + local_18;
                  if (8 < local_1c) {
                    uVar7 = uVar7 + 0x14;
                  }
                  if (8 < local_10) {
                    uVar7 = uVar7 + 0x14;
                  }
                  if (uVar7 < local_20) {
                    local_14 = local_8;
                    local_20 = uVar7;
                  }
                  *(undefined4 *)(in_ECX + 0x404) = 0;
                }
              }
              local_8 = local_8 + 1;
            } while (local_8 < uVar9);
          }
          puVar10 = *(undefined4 **)(in_ECX + 0x22c);
          for (iVar4 = 0x200; iVar4 != 0; iVar4 = iVar4 + -1) {
            *puVar10 = 0;
            puVar10 = puVar10 + 1;
          }
          puVar10 = *(undefined4 **)(in_ECX + 0x230);
          for (iVar4 = 0x200; iVar4 != 0; iVar4 = iVar4 + -1) {
            *puVar10 = 0;
            puVar10 = puVar10 + 1;
          }
          *(undefined4 *)(in_ECX + 0x220) = 0;
          *(undefined4 *)(in_ECX + 0x224) = 0;
          piVar6 = (int *)(in_ECX + 0x2c4);
          local_24 = 0xc;
          do {
            if (*piVar6 != 0) {
              FUN_1006c418();
            }
            *piVar6 = 0;
            piVar6 = piVar6 + 1;
            local_24 = local_24 + -1;
          } while (local_24 != 0);
          if (local_14 != 0xffffffff) {
            FUN_100abbf7(local_14,0);
            FUN_100ab1d9();
            FUN_100b174b();
            iVar4 = FUN_100ac03e();
            if (iVar4 < 0) {
              return iVar4;
            }
            iVar4 = FUN_100ad8f8(0,0);
            if (iVar4 < 0) {
              return iVar4;
            }
            piVar6 = *(int **)(in_ECX + 0x22c);
            uVar9 = 0;
            do {
              if (*piVar6 != 0) break;
              uVar9 = uVar9 + 1;
              piVar6 = piVar6 + 1;
            } while (uVar9 < 6);
            if ((*(int *)(in_ECX + 0x220) == 6) && (uVar9 == 6)) {
              *(undefined4 *)(in_ECX + 0x220) = 0;
            }
            goto LAB_100b2b84;
          }
        }
        FUN_1008b0b5();
        return -0x7fffbffb;
      }
    }
    return -0x7ff8fff2;
  }
  if (0x80 < *(uint *)(in_ECX + 0xc)) {
    FUN_1008b0b5();
    return -0x7fffbffb;
  }
  iVar4 = FUN_100aab2a();
  if (iVar4 < 0) {
    return iVar4;
  }
  if (*(int *)(in_ECX + 0x22c) != 0) {
    iVar4 = FUN_100a7a71();
    if (iVar4 < 0) {
      return iVar4;
    }
    if (((*(int *)(in_ECX + 0x22c) != 0) && ((*(uint *)(in_ECX + 200) & 0xffff) != 0x104)) &&
       (iVar4 = FUN_100b1b2e(), iVar4 < 0)) {
      return iVar4;
    }
  }
  if ((*(int *)(in_ECX + 0x230) != 0) && ((*(uint *)(in_ECX + 200) & 0xffff) != 0x104)) {
    iVar4 = FUN_100a7f9b();
    if (iVar4 < 0) {
      return iVar4;
    }
    iVar4 = FUN_100b0e3d();
    if (iVar4 < 0) {
      return iVar4;
    }
    iVar4 = FUN_100a8370();
    if (iVar4 < 0) {
      return iVar4;
    }
  }
  *(undefined4 *)(in_ECX + 0xdc) = 0;
  iVar4 = FUN_100ad8f8(0,0);
  if (iVar4 < 0) {
    return iVar4;
  }
LAB_100b2b84:
  *(undefined4 *)(in_ECX + 0xdc) = 1;
  iVar4 = FUN_100accd2();
  if (iVar4 < 0) {
    return iVar4;
  }
  iVar4 = FUN_100b06a6(*(undefined4 *)(in_ECX + 0x22c),0,*(undefined4 *)(in_ECX + 0x220),0);
  if (iVar4 < 0) {
    return iVar4;
  }
  iVar4 = FUN_100b06a6(*(undefined4 *)(in_ECX + 0x230),0,*(undefined4 *)(in_ECX + 0x224),0);
  if (iVar4 < 0) {
    return iVar4;
  }
  iVar4 = FUN_100a782f();
  if (-1 < iVar4) {
    if (((*(int *)(in_ECX + 0x230) != 0) && ((*(uint *)(in_ECX + 200) & 0xffff) != 0x104)) &&
       (iVar4 = FUN_100a6fc8(), iVar4 < 0)) {
      return iVar4;
    }
    return 0;
  }
  return iVar4;
}


