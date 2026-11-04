// 100b1d78 size=867 FUN_100b1d78

int FUN_100b1d78(int param_1,uint param_2)

{
  uint *puVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  uint uVar5;
  int iVar6;
  int in_ECX;
  uint uVar7;
  uint uVar8;
  bool bVar9;
  undefined4 uVar10;
  
  uVar8 = 0;
  if (param_2 != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar8;
      iVar6 = *(int *)(param_1 + uVar8 * 4);
      *(int *)(in_ECX + 0x100) = iVar6;
      if (iVar6 != 0) {
        iVar6 = *(int *)(iVar6 + 0x3c);
        if ((iVar6 != 0) && (*(int *)(iVar6 + 4) == 0xd)) {
          *(int *)(in_ECX + 0x104) = iVar6 + 0x30;
        }
        puVar1 = *(uint **)(in_ECX + 0x100);
        uVar7 = *puVar1;
        if (uVar7 != 0) {
          iVar6 = *(int *)(in_ECX + 0x14);
          if (*(int *)(*(int *)(iVar6 + *(int *)puVar1[2] * 4) + 8) != -1) {
            FUN_1008b0b5();
            return -0x7fffbffb;
          }
          uVar5 = uVar7 & 0xfff00000;
          if (uVar5 < 0x70300001) {
            if (uVar5 == 0x70300000) {
LAB_100b201e:
              iVar6 = FUN_100caf80();
            }
            else if (uVar5 < 0x50000001) {
              if (uVar5 == 0x50000000) {
                uVar7 = uVar7 & 0xfffff;
                if (uVar7 == 2) goto LAB_100b20b8;
                if ((uVar7 == 4) && ((*(uint *)(in_ECX + 200) & 0xffff) == 0x101)) {
LAB_100b1f52:
                  iVar6 = FUN_100af759();
                }
                else {
                  uVar5 = *(uint *)(in_ECX + 200) & 0xffff;
                  if (((uVar5 == 0x102) || (uVar5 == 0x103)) && (uVar7 == 4)) {
                    iVar2 = *(int *)(iVar6 + *(int *)puVar1[4] * 4);
                    iVar3 = *(int *)(iVar6 + *(int *)puVar1[2] * 4);
                    iVar6 = *(int *)(iVar6 + ((int *)puVar1[2])[4] * 4);
                    iVar4 = *(int *)(iVar2 + 4);
                    if (iVar4 == *(int *)(in_ECX + 0x84)) {
                      if (((*(int *)(iVar3 + 4) == *(int *)(in_ECX + 0x88)) &&
                          (*(int *)(iVar3 + 0xc) == 0)) ||
                         ((*(int *)(iVar6 + 4) == *(int *)(in_ECX + 0x88) &&
                          (*(int *)(iVar6 + 0xc) == 0)))) {
                        bVar9 = (*(uint *)(iVar2 + 0x6c) & 0xff) == 1;
LAB_100b1f50:
                        if (bVar9) goto LAB_100b1f52;
                      }
                    }
                    else {
                      if ((*(int *)(iVar3 + 4) == iVar4) &&
                         (*(int *)(iVar3 + 0xc) == *(int *)(iVar2 + 0xc))) goto LAB_100b1f52;
                      if (*(int *)(iVar6 + 4) == iVar4) {
                        bVar9 = *(int *)(iVar6 + 0xc) == *(int *)(iVar2 + 0xc);
                        goto LAB_100b1f50;
                      }
                    }
                  }
                  iVar6 = FUN_100cb84b();
                }
              }
              else {
                if (uVar5 == 0) goto LAB_100b2082;
                if (uVar5 == 0x10000000) {
                  iVar6 = FUN_100cb636();
                }
                else if (uVar5 == 0x10100000) {
                  iVar6 = FUN_100cac40();
                }
                else if (uVar5 == 0x11000000) {
                  iVar6 = FUN_100ca44c();
                }
                else if (uVar5 == 0x20400000) {
                  iVar6 = FUN_100cb82d();
                }
                else if (uVar5 == 0x20500000) {
                  iVar6 = FUN_100cb837();
                }
                else {
                  if (uVar5 != 0x30000000) goto LAB_100b20b8;
                  if ((*(uint *)(in_ECX + 200) & 0xffff) == 0x104) {
                    iVar6 = FUN_100cb908();
                  }
                  else {
                    iVar6 = -0x7fffbfff;
                  }
                }
              }
            }
            else if ((uVar5 == 0x60000000) || (uVar5 == 0x60500000)) {
LAB_100b1fb0:
              iVar6 = FUN_100afb98();
            }
            else if (uVar5 == 0x60700000) {
              iVar6 = FUN_100afac6();
            }
            else {
              if ((uVar5 == 0x60a00000) || (uVar5 == 0x60f00000)) goto LAB_100b1fb0;
              if (uVar5 != 0x70100000) goto LAB_100b20b8;
              iVar6 = FUN_100cadbf();
            }
          }
          else {
            if (uVar5 < 0x72600001) {
              if (uVar5 != 0x72600000) {
                if (uVar5 == 0x70400000) goto LAB_100b201e;
                if (uVar5 == 0x70f00000) {
                  iVar6 = FUN_100cb912();
                }
                else {
                  if (uVar5 != 0x72100000) {
                    if (uVar5 == 0x72200000) {
                      uVar10 = 0x47;
                    }
                    else if (uVar5 == 0x72300000) {
                      uVar10 = 0x48;
                    }
                    else if (uVar5 == 0x72400000) {
                      uVar10 = 0x49;
                    }
                    else {
                      if (uVar5 != 0x72500000) goto LAB_100b20b8;
                      uVar10 = 0x4a;
                    }
                    goto LAB_100b2070;
                  }
                  iVar6 = FUN_100afce9();
                }
                goto LAB_100b2077;
              }
              uVar10 = 0x52;
            }
            else if (uVar5 == 0x72700000) {
              uVar10 = 0x45;
            }
            else if (uVar5 == 0x72800000) {
              uVar10 = 0x46;
            }
            else if (uVar5 == 0x72900000) {
              uVar10 = 0x4d;
            }
            else if (uVar5 == 0x72a00000) {
              uVar10 = 0x4c;
            }
            else {
              if (uVar5 != 0x72b00000) {
                if (uVar5 != 0x72e00000) goto LAB_100b20b8;
                iVar6 = FUN_100af9eb();
                goto LAB_100b2077;
              }
              uVar10 = 0x53;
            }
LAB_100b2070:
            iVar6 = FUN_100af8a6(uVar10);
          }
LAB_100b2077:
          if (iVar6 == -0x7fffbfff) {
LAB_100b20b8:
            FUN_1008b0b5();
            return -0x7fffbfff;
          }
          if (iVar6 < 0) {
            return iVar6;
          }
        }
      }
LAB_100b2082:
      uVar8 = uVar8 + 1;
    } while (uVar8 < param_2);
  }
  return 0;
}


