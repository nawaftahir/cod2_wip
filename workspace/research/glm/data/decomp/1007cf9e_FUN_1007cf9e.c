// 1007cf9e size=1263 FUN_1007cf9e

int FUN_1007cf9e(undefined4 param_1,int param_2,int param_3,undefined4 param_4,int param_5,
                undefined4 param_6,undefined4 param_7,undefined4 param_8,uint param_9,
                undefined4 *param_10,undefined4 *param_11)

{
  uint uVar1;
  void *pvVar2;
  undefined4 uVar3;
  uint uVar4;
  undefined4 *in_ECX;
  char cVar5;
  int iVar6;
  bool bVar7;
  undefined4 *puVar8;
  undefined1 local_38 [24];
  undefined1 local_20 [4];
  uint local_1c;
  undefined4 local_14;
  int local_10;
  int local_c;
  int *local_8;
  
  FUN_10082643(0x100000,0x10000);
  uVar4 = param_9;
  local_c = 0;
  local_10 = 0;
  if (((param_9 & 0xfffff800) == 0) &&
     (((cVar5 = (char)param_9, param_2 == 0 || ((param_9 & 0x18) == 0)) &&
      (param_10 != (undefined4 *)0x0)))) {
    if ((undefined4 *)in_ECX[2] != (undefined4 *)0x0) {
      (*(code *)**(undefined4 **)in_ECX[2])(1);
    }
    _free((void *)in_ECX[6]);
    in_ECX[0x12] = 0xffffffff;
    *in_ECX = param_1;
    in_ECX[1] = 0;
    in_ECX[2] = 0;
    in_ECX[6] = 0;
    in_ECX[7] = 0;
    in_ECX[0x13] = 0;
    in_ECX[0x14] = 0;
    in_ECX[0x15] = 0;
    in_ECX[0x16] = 0;
    in_ECX[0x17] = 0;
    in_ECX[0x18] = 0;
    in_ECX[0x19] = 0;
    in_ECX[3] = param_8;
    in_ECX[5] = uVar4;
    in_ECX[0xe] = 0;
    in_ECX[0xf] = 0;
    in_ECX[0x10] = 0;
    in_ECX[0x11] = 0;
    in_ECX[0x1a] = 0;
    in_ECX[0x1b] = 0;
    in_ECX[0x1c] = 0;
    in_ECX[0x1d] = 0;
    in_ECX[0x1e] = 0;
    in_ECX[0x1f] = 0;
    in_ECX[0x20] = 0;
    in_ECX[0x21] = param_7;
    if (param_5 != 0) {
      in_ECX[4] = 0x46580200;
      pvVar2 = operator_new(0x1fc);
      if (pvVar2 == (void *)0x0) {
        uVar3 = 0;
      }
      else {
        uVar3 = FUN_100b85f2();
      }
      *(byte *)((int)in_ECX + 0x15) = *(byte *)((int)in_ECX + 0x15) | 1;
      goto LAB_1007d290;
    }
    if ((uVar4 & 0xc0) == 0) {
LAB_1007d127:
      iVar6 = FUN_10063776(in_ECX[3],2,local_20);
      if (-1 < iVar6) {
        in_ECX[4] = local_1c;
        in_ECX[5] = uVar4;
        if (local_1c == 0xfffe0100) {
          in_ECX[4] = 0xfffe0101;
          local_c = 1;
        }
        if (in_ECX[4] == -0xff00) {
          in_ECX[4] = 0xffff0101;
          local_10 = 1;
        }
        uVar1 = in_ECX[4];
        if (uVar1 < 0xfffe0400) {
          if (uVar1 == 0xfffe03ff) {
LAB_1007d273:
            pvVar2 = operator_new(0x1f8);
            if (pvVar2 == (void *)0x0) {
LAB_1007d28e:
              uVar3 = 0;
            }
            else {
              uVar3 = FUN_100a48db(param_7);
            }
          }
          else if (uVar1 == 0x54580100) {
            in_ECX[5] = uVar4 | 0x100;
            pvVar2 = operator_new(0x1fc);
            if (pvVar2 == (void *)0x0) goto LAB_1007d28e;
            uVar3 = FUN_100b85f2();
          }
          else {
            if ((((uVar1 != 0xfffe0101) && (uVar1 != 0xfffe0200)) && (uVar1 != 0xfffe0202)) &&
               (uVar1 != 0xfffe02ff)) {
              bVar7 = uVar1 == 0xfffe0300;
              goto LAB_1007d26c;
            }
            pvVar2 = operator_new(0x1f8);
            if (pvVar2 == (void *)0x0) goto LAB_1007d28e;
            uVar3 = FUN_100b5c28(param_7);
          }
LAB_1007d290:
          in_ECX[2] = uVar3;
        }
        else {
          if (0xffff02ff < uVar1) {
            if (uVar1 != 0xffff0300) {
              bVar7 = uVar1 == 0xffff03ff;
LAB_1007d26c:
              if (!bVar7) goto LAB_1007d26e;
            }
            goto LAB_1007d273;
          }
          if (uVar1 == 0xffff02ff) {
LAB_1007d227:
            pvVar2 = operator_new(0x22c);
            if (pvVar2 == (void *)0x0) goto LAB_1007d28e;
            uVar3 = FUN_100b2c0c(param_7);
            goto LAB_1007d290;
          }
          if (0xffff0100 < uVar1) {
            if (uVar1 < 0xffff0105) {
              in_ECX[5] = uVar4 & 0xfffffffb;
              pvVar2 = operator_new(0x484);
              if (pvVar2 == (void *)0x0) goto LAB_1007d28e;
              uVar3 = FUN_100a6e56();
              goto LAB_1007d290;
            }
            if ((uVar1 == 0xffff0200) || ((0xffff0201 < uVar1 && (uVar1 < 0xffff0204))))
            goto LAB_1007d227;
          }
LAB_1007d26e:
          in_ECX[2] = 0;
        }
        if (in_ECX[2] == 0) {
LAB_1007d298:
          iVar6 = -0x7ff8fff2;
          goto LAB_1007d47c;
        }
        if (param_2 == 0) {
          puVar8 = in_ECX + 1;
          uVar4 = in_ECX[5] | 0x80000000;
          uVar3 = *in_ECX;
          FUN_10099399(uVar3,uVar4,puVar8);
          iVar6 = FUN_100a482d(uVar3,uVar4,puVar8);
          FUN_1009aae7();
          if (-1 < iVar6) goto LAB_1007d2e4;
        }
        else {
          in_ECX[1] = param_2;
LAB_1007d2e4:
          if (local_c != 0) {
            FUN_1006dd03();
          }
          if (local_10 != 0) {
            FUN_1006dd03();
          }
          if (in_ECX[0x22] == 0) {
            in_ECX[0x23] = 0x1000;
            pvVar2 = operator_new(0x4000);
            in_ECX[0x22] = pvVar2;
            if (pvVar2 == (void *)0x0) goto LAB_1007d298;
          }
          FUN_10085d5e(local_38);
          FUN_100857df(local_38);
          iVar6 = FUN_1007b4e5();
          if (-1 < iVar6) {
            if (param_5 == 0) {
              if (param_3 == 0) {
                iVar6 = FUN_1006da19(param_4,&param_3);
                if (iVar6 != 0) {
                  uVar3 = 1;
                  goto LAB_1007d3cf;
                }
                FUN_1006dca1();
              }
              else {
                iVar6 = FUN_1006d903(param_3);
                if (iVar6 != 0) {
                  uVar3 = 0;
LAB_1007d3cf:
                  iVar6 = FUN_1007aa30(param_3,iVar6,param_6,0,1,uVar3);
                  goto LAB_1007d3e1;
                }
                FUN_1006dca1();
              }
LAB_1007d3c2:
              iVar6 = -0x7fffbffb;
            }
            else {
              iVar6 = FUN_1007ce9d(param_5);
LAB_1007d3e1:
              if (-1 < iVar6) {
                if (in_ECX[0x13] != 0) goto LAB_1007d3c2;
                iVar6 = FUN_1006db55();
                if ((-1 < iVar6) &&
                   (iVar6 = (**(code **)(*(int *)in_ECX[2] + 8))(&local_8), -1 < iVar6)) {
                  if (param_11 != (undefined4 *)0x0) {
                    puVar8 = &local_14;
                    uVar3 = (**(code **)(*local_8 + 0xc))(local_8,puVar8);
                    iVar6 = FUN_10063884(uVar3,puVar8);
                    if (iVar6 < 0) {
                      if (local_8 != (int *)0x0) {
                        (**(code **)(*local_8 + 8))(local_8);
                        local_8 = (int *)0x0;
                      }
                      goto LAB_1007d451;
                    }
                  }
                  *param_10 = local_8;
                  if (param_11 != (undefined4 *)0x0) {
                    *param_11 = local_14;
                  }
                  iVar6 = 0;
                }
              }
            }
          }
        }
LAB_1007d451:
        in_ECX[1] = 0;
        if ((undefined4 *)in_ECX[2] != (undefined4 *)0x0) {
          (*(code *)**(undefined4 **)in_ECX[2])(1);
        }
        in_ECX[2] = 0;
        _free((void *)in_ECX[6]);
        in_ECX[6] = 0;
        FUN_10085d5e(0);
        FUN_100857df(0);
        goto LAB_1007d47c;
      }
    }
    else {
      iVar6 = FUN_10063776(param_8,2,local_20);
      if (-1 < iVar6) {
        if ((local_1c & 0xffff0000) == 0xfffe0000) {
          if ((uVar4 & 0x40) != 0) {
            uVar4 = uVar4 | 5;
            if ((local_1c & 0xff00) == 0x300) {
              in_ECX[3] = "vs_3_sw";
            }
            else {
              in_ECX[3] = "vs_2_sw";
            }
          }
        }
        else if (((local_1c & 0xffff0000) == 0xffff0000) && (cVar5 < '\0')) {
          uVar4 = uVar4 | 5;
          if ((local_1c & 0xff00) == 0x300) {
            in_ECX[3] = "ps_3_sw";
          }
          else {
            in_ECX[3] = "ps_2_sw";
          }
        }
        goto LAB_1007d127;
      }
    }
    FUN_1006dca1();
  }
  iVar6 = -0x7789f794;
LAB_1007d47c:
  FUN_1008269b();
  return iVar6;
}


