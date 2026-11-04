// 100ba1bc size=1666 FUN_100ba1bc

/* WARNING: Type propagation algorithm not settling */

int FUN_100ba1bc(int param_1,char *param_2,uint param_3,uint param_4,undefined4 param_5)

{
  uint *puVar1;
  uint uVar2;
  int iVar3;
  char *pcVar4;
  long lVar5;
  int *piVar6;
  int in_ECX;
  uint uVar7;
  int iVar8;
  undefined4 uVar9;
  uint uVar10;
  char *pcVar11;
  uint uVar12;
  undefined4 *puVar13;
  undefined4 *local_1c;
  char *local_18;
  int *local_14;
  int *local_10;
  undefined4 *local_c;
  char *local_8;
  
  uVar10 = 0;
  local_14 = (int *)0x0;
  local_1c = (undefined4 *)0x0;
  if (*(int *)(in_ECX + 4) != 0) {
    do {
      iVar8 = *(int *)(*(int *)(in_ECX + 0x10) + uVar10 * 4);
      uVar2 = *(uint *)(iVar8 + 4);
      *(undefined4 *)(iVar8 + 0x10) = 0;
      if ((uVar2 & 0x400) == 0) {
        uVar12 = 0;
        *(undefined4 *)(iVar8 + 8) = 0;
        if (*(int *)(in_ECX + 8) != 0) {
          do {
            iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + uVar12 * 4);
            if ((*(uint *)(iVar3 + 4) == uVar10) &&
               (uVar7 = *(int *)(iVar3 + 0xc) + 1, *(uint *)(iVar8 + 8) < uVar7)) {
              *(uint *)(iVar8 + 8) = uVar7;
            }
            uVar12 = uVar12 + 1;
          } while (uVar12 < *(uint *)(in_ECX + 8));
        }
        if (((uVar2 & 0x100) != 0) && ((uVar2 & 0x800) == 0)) {
          *(uint *)(iVar8 + 4) = uVar2 & 0xffffffbf;
        }
        uVar2 = *(uint *)(iVar8 + 4);
        if (((uVar2 & 0x10) != 0) && ((uVar2 & 0xa00) == 0)) {
          *(uint *)(iVar8 + 4) = uVar2 & 0xffffffbf;
        }
        uVar2 = *(uint *)(iVar8 + 4);
        if ((((char)uVar2 < '\0') && ((uVar2 & 0x800) == 0)) && (*(int *)(iVar8 + 8) == 1)) {
          *(uint *)(iVar8 + 4) = uVar2 & 0xffffffbf;
        }
      }
      uVar10 = uVar10 + 1;
    } while (uVar10 < *(uint *)(in_ECX + 4));
  }
  local_c = operator_new((int)param_2 << 3);
  if (local_c != (undefined4 *)0x0) {
    local_8 = (char *)0x0;
    puVar13 = local_c;
    for (iVar8 = ((uint)param_2 & 0x1fffffff) << 1; iVar8 != 0; iVar8 = iVar8 + -1) {
      *puVar13 = 0;
      puVar13 = puVar13 + 1;
    }
    for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
      *(undefined1 *)puVar13 = 0;
      puVar13 = (undefined4 *)((int)puVar13 + 1);
    }
    if (*(int *)(in_ECX + 4) != 0) {
LAB_100ba28b:
      puVar13 = *(undefined4 **)(*(int *)(in_ECX + 0x10) + (int)local_8 * 4);
      uVar10 = puVar13[1];
      if ((((uVar10 & param_3) != param_3) || ((param_4 & uVar10) != 0)) ||
         (((uVar10 & 0x40) == 0 || (((uVar10 & 0x800) == 0 || (puVar13[2] == 0))))))
      goto LAB_100ba3a5;
      puVar13[4] = 0xffffffff;
      iVar8 = FUN_100ba115(*puVar13,&local_18,param_5,local_8);
      pcVar11 = local_18;
      if (-1 < iVar8) {
        if ((local_18 != (char *)0x0) && (iVar8 = _tolower((int)*local_18), (char)param_5 == iVar8))
        {
          local_10 = (int *)(pcVar11 + 1);
          iVar8 = _isdigit((int)(char)*local_10);
          if (iVar8 != 0) {
            pcVar11 = pcVar11 + 2;
            while (iVar8 = _isdigit((int)*pcVar11), iVar8 != 0) {
              pcVar11 = pcVar11 + 1;
            }
            if ((*pcVar11 == '\0') || (*pcVar11 == ';')) {
              lVar5 = _atol((char *)local_10);
              puVar13[4] = lVar5;
            }
          }
        }
        if ((char *)puVar13[4] < param_2) {
          local_10 = (int *)0x0;
          if (puVar13[2] != 0) {
            do {
              if (param_2 <= (char *)(puVar13[4] + (int)local_10)) {
                if (((((char)param_5 == 'b') || ((char)param_5 == 'c')) || ((char)param_5 == 'i'))
                   || (((char)param_5 == 's' || ((char)param_5 == 'v')))) goto LAB_100ba7b8;
                goto LAB_100ba7c3;
              }
              puVar1 = local_c + (puVar13[4] + (int)local_10) * 2;
              if (*puVar1 != 0) {
                FUN_1008b0b5();
              }
              *puVar1 = (uint)local_8;
              puVar1[1] = (uint)local_10;
              local_10 = (int *)((int)local_10 + 1);
            } while (local_10 < (int *)puVar13[2]);
          }
          goto LAB_100ba3a5;
        }
        for (iVar8 = *(int *)(in_ECX + 8); iVar8 != 0; iVar8 = iVar8 + -1) {
        }
        FUN_1008b0b5();
        goto LAB_100ba7c3;
      }
      goto LAB_100ba81a;
    }
LAB_100ba3b4:
    iVar8 = *(int *)(in_ECX + 4);
    local_8 = (char *)0x0;
    if (iVar8 != 0) {
      piVar6 = *(int **)(in_ECX + 0x10);
      do {
        uVar10 = *(uint *)(*piVar6 + 4);
        if ((((uVar10 & param_3) == param_3) && ((param_4 & uVar10) == 0)) &&
           (((uVar10 & 0x40) != 0 && (((uVar10 & 0x800) == 0 && (*(int *)(*piVar6 + 8) != 0)))))) {
          local_8 = local_8 + 1;
        }
        piVar6 = piVar6 + 1;
        iVar8 = iVar8 + -1;
      } while (iVar8 != 0);
    }
    piVar6 = operator_new((int)local_8 << 2);
    uVar10 = 0;
    local_14 = piVar6;
    if (piVar6 != (int *)0x0) {
      local_8 = (char *)0x0;
      if (*(int *)(in_ECX + 4) != 0) {
        do {
          iVar8 = *(int *)(*(int *)(in_ECX + 0x10) + uVar10 * 4);
          uVar2 = *(uint *)(iVar8 + 4);
          if (((((uVar2 & param_3) == param_3) && ((param_4 & uVar2) == 0)) && ((uVar2 & 0x40) != 0)
              ) && (((uVar2 & 0x800) == 0 && (*(int *)(iVar8 + 8) != 0)))) {
            piVar6[(int)local_8] = uVar10;
            local_8 = local_8 + 1;
          }
          uVar10 = uVar10 + 1;
        } while (uVar10 < *(uint *)(in_ECX + 4));
      }
      FUN_10086920(FUN_100b9661,piVar6,local_8,in_ECX);
      local_18 = (char *)0x0;
      if (local_8 != (char *)0x0) {
        do {
          local_10 = piVar6;
          iVar8 = *(int *)(*(int *)(in_ECX + 0x10) + *local_10 * 4);
          pcVar11 = (char *)0x0;
          if (param_2 != (char *)0x0) {
            do {
              for (; (pcVar4 = pcVar11, pcVar11 < param_2 && (local_c[(int)pcVar11 * 2] != 0));
                  pcVar11 = pcVar11 + 1) {
              }
              for (; (pcVar4 < param_2 && (local_c[(int)pcVar4 * 2] == 0)); pcVar4 = pcVar4 + 1) {
              }
            } while (((uint)((int)pcVar4 - (int)pcVar11) < *(uint *)(iVar8 + 8)) &&
                    (pcVar11 = pcVar4, pcVar4 < param_2));
          }
          if (param_2 < pcVar11 + *(int *)(iVar8 + 8)) goto joined_r0x100ba744;
          uVar10 = 0;
          if (*(int *)(iVar8 + 8) != 0) {
            piVar6 = local_c + (int)pcVar11 * 2;
            do {
              iVar3 = *local_10;
              piVar6[1] = uVar10;
              *piVar6 = iVar3;
              uVar10 = uVar10 + 1;
              piVar6 = piVar6 + 2;
            } while (uVar10 < *(uint *)(iVar8 + 8));
          }
          local_18 = local_18 + 1;
          local_10 = local_10 + 1;
          *(char **)(iVar8 + 0x10) = pcVar11;
          piVar6 = local_10;
        } while (local_18 < local_8);
      }
      uVar10 = 0;
      if (*(int *)(in_ECX + 8) != 0) {
        do {
          iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + uVar10 * 4);
          piVar6 = (int *)(iVar8 + 0xc);
          *piVar6 = *piVar6 + *(int *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar8 + 4) * 4) +
                                      0x10);
          uVar10 = uVar10 + 1;
        } while (uVar10 < *(uint *)(in_ECX + 8));
      }
      uVar10 = 0;
      if (*(int *)(in_ECX + 4) != 0) {
        do {
          iVar8 = *(int *)(*(int *)(in_ECX + 0x10) + uVar10 * 4);
          *(int *)(iVar8 + 8) = *(int *)(iVar8 + 8) + *(int *)(iVar8 + 0x10);
          uVar10 = uVar10 + 1;
          *(undefined4 *)(iVar8 + 0x10) = 0;
        } while (uVar10 < *(uint *)(in_ECX + 4));
      }
      local_8 = (char *)0x0;
      if (*(int *)(in_ECX + 4) != 0) {
        do {
          iVar8 = *(int *)(*(int *)(in_ECX + 0x10) + (int)local_8 * 4);
          uVar10 = *(uint *)(iVar8 + 4);
          if (((((uVar10 & param_3) == param_3) && ((param_4 & uVar10) == 0)) &&
              ((uVar10 & 0x40) == 0)) && (((uVar10 & 0x800) == 0 && (*(int *)(iVar8 + 8) != 0)))) {
            local_1c = operator_new(*(int *)(iVar8 + 8) << 2);
            if (local_1c == (undefined4 *)0x0) goto LAB_100ba75d;
            puVar13 = local_1c;
            for (uVar10 = *(uint *)(iVar8 + 8) & 0x3fffffff; uVar10 != 0; uVar10 = uVar10 - 1) {
              *puVar13 = 0xffffffff;
              puVar13 = puVar13 + 1;
            }
            for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
              *(undefined1 *)puVar13 = 0xff;
              puVar13 = (undefined4 *)((int)puVar13 + 1);
            }
            local_10 = (int *)0x0;
            if (*(int *)(in_ECX + 8) != 0) {
              do {
                iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + (int)local_10 * 4);
                if (*(char **)(iVar8 + 4) == local_8) {
                  if (local_1c[*(int *)(iVar8 + 0xc)] == -1) {
                    pcVar11 = (char *)0x0;
                    if (param_2 == (char *)0x0) goto joined_r0x100ba744;
                    do {
                      if (local_c[(int)pcVar11 * 2] == 0) break;
                      pcVar11 = pcVar11 + 1;
                    } while (pcVar11 < param_2);
                    if (param_2 <= pcVar11) goto joined_r0x100ba744;
                    local_c[(int)pcVar11 * 2] = local_8;
                    (local_c + (int)pcVar11 * 2)[1] = *(uint *)(iVar8 + 0xc);
                    local_1c[*(int *)(iVar8 + 0xc)] = pcVar11;
                  }
                  *(undefined4 *)(iVar8 + 0xc) = local_1c[*(int *)(iVar8 + 0xc)];
                }
                local_10 = (int *)((int)local_10 + 1);
              } while (local_10 < *(int **)(in_ECX + 8));
            }
            _free(local_1c);
          }
          local_8 = local_8 + 1;
        } while (local_8 < *(char **)(in_ECX + 4));
      }
      local_1c = (undefined4 *)0x0;
      if (param_1 != -1) {
        uVar10 = 0;
        if (*(int *)(in_ECX + 8) != 0) {
          do {
            iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + uVar10 * 4);
            uVar2 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar8 + 4) * 4) + 4);
            if (((uVar2 & param_3) == param_3) && ((param_4 & uVar2) == 0)) {
              if ((uVar2 & 0x100) == 0) {
                *(int *)(iVar8 + 4) = param_1;
              }
              else {
                if ((uVar2 & 0x40000) == 0) {
                  if ((uVar2 & 0x800) != 0) goto LAB_100ba7da;
                  uVar9 = *(undefined4 *)(in_ECX + 0x78);
                }
                else {
                  uVar9 = *(undefined4 *)(in_ECX + 0x184);
                }
                *(undefined4 *)(iVar8 + 4) = uVar9;
              }
            }
LAB_100ba7da:
            uVar10 = uVar10 + 1;
          } while (uVar10 < *(uint *)(in_ECX + 8));
        }
        *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x10) + param_1 * 4) + 0x10) = 0;
        *(char **)(*(int *)(*(int *)(in_ECX + 0x10) + param_1 * 4) + 8) = param_2;
        if (param_1 == *(int *)(in_ECX + 0x7c)) {
          *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(in_ECX + 0x78) * 4) + 0x10) =
               0;
          *(char **)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(in_ECX + 0x78) * 4) + 8) = param_2;
        }
      }
      iVar8 = 0;
      goto LAB_100ba81a;
    }
  }
LAB_100ba75d:
  iVar8 = -0x7ff8fff2;
  goto LAB_100ba81a;
LAB_100ba3a5:
  local_8 = local_8 + 1;
  if (*(char **)(in_ECX + 4) <= local_8) goto LAB_100ba3b4;
  goto LAB_100ba28b;
joined_r0x100ba744:
  if ((((char)param_5 == 'v') || ((char)param_5 == 'c')) ||
     (((char)param_5 == 's' || (((char)param_5 == 'b' || ((char)param_5 == 'i')))))) {
LAB_100ba7b8:
    FUN_1008b0b5();
  }
LAB_100ba7c3:
  iVar8 = -0x7fffbffb;
LAB_100ba81a:
  _free(local_c);
  _free(local_14);
  _free(local_1c);
  return iVar8;
}


