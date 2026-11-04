// 100b174b size=995 FUN_100b174b

int FUN_100b174b(void)

{
  uint *puVar1;
  uint uVar2;
  int iVar3;
  int *piVar4;
  int in_ECX;
  int extraout_ECX;
  int extraout_ECX_00;
  int extraout_ECX_01;
  int extraout_ECX_02;
  undefined4 extraout_ECX_03;
  uint uVar5;
  bool bVar6;
  undefined8 uVar7;
  uint local_18;
  uint local_14;
  int local_10;
  uint local_c;
  uint local_8;
  
  uVar2 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x18) + uVar2 * 4) + 0x28) = 0;
      uVar2 = uVar2 + 1;
    } while (uVar2 < *(uint *)(in_ECX + 0xc));
  }
  uVar2 = 0;
  do {
    iVar3 = *(int *)(uVar2 + *(int *)(in_ECX + 0x230));
    if (iVar3 != 0) {
      FUN_100ba043(*(undefined4 *)(in_ECX + 0x18),iVar3,1);
      FUN_100ba0cf(*(undefined4 *)(in_ECX + 0x18),*(undefined4 *)(uVar2 + *(int *)(in_ECX + 0x230)),
                   2);
    }
    iVar3 = *(int *)(uVar2 + *(int *)(in_ECX + 0x22c));
    if (iVar3 != 0) {
      *(undefined4 *)(iVar3 + 0x28) = 1;
    }
    uVar2 = uVar2 + 4;
  } while (uVar2 < 0x18);
  uVar2 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      uVar7 = FUN_100a6e19(**(uint **)(*(int *)(in_ECX + 0x18) + uVar2 * 4) & 0xfff00000);
      iVar3 = (int)((ulonglong)uVar7 >> 0x20);
      if ((((int)uVar7 == 0) && (extraout_ECX != 0x72100000)) && (extraout_ECX != 0x11000000)) {
        puVar1 = (uint *)(in_ECX + 0x220);
        if (0x1ff < *puVar1) {
          return -0x7fffbffb;
        }
        if (*(int *)(iVar3 + 0x28) == 1) {
          *(int *)(*(int *)(in_ECX + 0x22c) + *puVar1 * 4) = iVar3;
          *puVar1 = *puVar1 + 1;
        }
      }
      uVar2 = uVar2 + 1;
    } while (uVar2 < *(uint *)(in_ECX + 0xc));
  }
  piVar4 = *(int **)(in_ECX + 0x22c);
  local_10 = 1;
  if ((piVar4 != (int *)0x0) && (*(int *)(in_ECX + 0x220) != 0)) {
    iVar3 = *(int *)(in_ECX + 0x220);
    do {
      if (*piVar4 != 0) {
        local_10 = 0;
      }
      piVar4 = piVar4 + 1;
      iVar3 = iVar3 + -1;
    } while (iVar3 != 0);
  }
  local_c = 0;
  do {
    local_8 = 0;
    iVar3 = FUN_100ac03e(&local_8);
    if (iVar3 < 0) {
      return iVar3;
    }
    FUN_100b06a6(*(undefined4 *)(in_ECX + 0x22c),6,*(undefined4 *)(in_ECX + 0x220),&local_14);
    uVar5 = 0;
    uVar2 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar5 * 4);
        if (puVar1 != (uint *)0x0) {
          if ((puVar1[10] == 2) || (puVar1[10] == 0)) {
            uVar7 = FUN_100a6e19(*puVar1 & 0xfff00000);
            if (((int)uVar7 == 0) &&
               ((extraout_ECX_00 != 0x11000000 && (extraout_ECX_00 != 0x72100000)))) {
              (&DAT_101ad560)[uVar2] = (int)((ulonglong)uVar7 >> 0x20);
              uVar2 = uVar2 + 1;
            }
          }
          if (0x1ff < uVar2) {
            return -0x7ff8fff2;
          }
        }
        uVar5 = uVar5 + 1;
      } while (uVar5 < *(uint *)(in_ECX + 0xc));
    }
    while ((FUN_100b06a6(&DAT_101ad560,0,uVar2,&local_18), 7 < local_8 + local_18 ||
           (((local_14 < local_18 && (local_c == 0)) && (local_10 == 0))))) {
      local_8 = 0;
      if (*(int *)(in_ECX + 0xc) != 0) {
        do {
          puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_8 * 4);
          if (puVar1[10] == 0) {
            uVar7 = FUN_100a6e19(*puVar1 & 0xfff00000);
            uVar2 = (uint)((ulonglong)uVar7 >> 0x20);
            if (((int)uVar7 == 0) && (extraout_ECX_01 != 0x72100000)) {
              bVar6 = uVar2 == puVar1[1];
              if (uVar2 < puVar1[1]) {
                piVar4 = (int *)puVar1[2];
                do {
                  if (*(char *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar4 * 4) + 0x6c) == '\x01')
                  break;
                  uVar2 = uVar2 + 1;
                  piVar4 = piVar4 + 1;
                } while (uVar2 < puVar1[1]);
                bVar6 = uVar2 == puVar1[1];
              }
              if (bVar6) {
                uVar2 = 0;
                if (local_c == 0) {
                  bVar6 = puVar1[3] == 0;
                  if (puVar1[3] != 0) {
                    piVar4 = (int *)puVar1[4];
                    do {
                      if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar4 * 4) + 0x10) == 3)
                      break;
                      uVar2 = uVar2 + 1;
                      piVar4 = piVar4 + 1;
                    } while (uVar2 < puVar1[3]);
                    bVar6 = uVar2 == puVar1[3];
                  }
                  if (!bVar6) goto LAB_100b19d6;
                }
                if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                       *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                        *(int *)puVar1[4] * 4) + 4) * 4) + 4) & 0x20
                    ) == 0) {
                  puVar1[10] = 1;
                  iVar3 = FUN_100ac840();
                  if ((iVar3 == 0) && (iVar3 = FUN_100ac974(puVar1), iVar3 == 0)) {
                    if (0x1ff < *(uint *)(in_ECX + 0x220)) {
                      return -0x7ff8fff2;
                    }
                    *(uint **)(*(int *)(in_ECX + 0x22c) + *(uint *)(in_ECX + 0x220) * 4) = puVar1;
                    *(int *)(in_ECX + 0x220) = *(int *)(in_ECX + 0x220) + 1;
                    break;
                  }
                  puVar1[10] = 0;
                }
              }
            }
          }
LAB_100b19d6:
          local_8 = local_8 + 1;
        } while (local_8 < *(uint *)(in_ECX + 0xc));
      }
      if (local_8 == *(uint *)(in_ECX + 0xc)) break;
      local_8 = 0;
      iVar3 = FUN_100ac03e(&local_8);
      if (iVar3 < 0) {
        return iVar3;
      }
      FUN_100b06a6(*(undefined4 *)(in_ECX + 0x22c),6,*(undefined4 *)(in_ECX + 0x220),&local_14);
      uVar5 = 0;
      uVar2 = 0;
      if (*(int *)(in_ECX + 0xc) != 0) {
        do {
          puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar5 * 4);
          if (puVar1 != (uint *)0x0) {
            if ((puVar1[10] == 2) || (puVar1[10] == 0)) {
              uVar7 = FUN_100a6e19(*puVar1 & 0xfff00000);
              if (((int)uVar7 == 0) &&
                 ((extraout_ECX_02 != 0x11000000 && (extraout_ECX_02 != 0x72100000)))) {
                (&DAT_101ad560)[uVar2] = (int)((ulonglong)uVar7 >> 0x20);
                uVar2 = uVar2 + 1;
              }
            }
            if (0x1ff < uVar2) {
              return -0x7ff8fff2;
            }
          }
          uVar5 = uVar5 + 1;
        } while (uVar5 < *(uint *)(in_ECX + 0xc));
      }
    }
    local_c = local_c + 1;
    if (1 < local_c) {
      uVar2 = 0;
      if (*(int *)(in_ECX + 0xc) != 0) {
        do {
          puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar2 * 4);
          if (puVar1[10] == 0) {
            puVar1[10] = 2;
          }
          uVar5 = *(uint *)(in_ECX + 0x224);
          if (0x1ff < uVar5) {
            return -0x7fffbffb;
          }
          if (puVar1[10] == 2) {
            uVar7 = FUN_100a6e19(*puVar1 & 0xfff00000);
            iVar3 = (int)((ulonglong)uVar7 >> 0x20);
            if ((((int)uVar7 == 0) && (iVar3 != 0x11000000)) && (iVar3 != 0x72100000)) {
              *(undefined4 *)(*(int *)(in_ECX + 0x230) + uVar5 * 4) = extraout_ECX_03;
              *(int *)(in_ECX + 0x224) = *(int *)(in_ECX + 0x224) + 1;
            }
          }
          uVar2 = uVar2 + 1;
        } while (uVar2 < *(uint *)(in_ECX + 0xc));
      }
      return 0;
    }
  } while( true );
}


