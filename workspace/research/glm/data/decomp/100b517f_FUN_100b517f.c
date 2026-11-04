// 100b517f size=2162 FUN_100b517f

undefined4 FUN_100b517f(void)

{
  int iVar1;
  uint uVar2;
  undefined *puVar3;
  int *in_ECX;
  uint uVar4;
  undefined4 *puVar5;
  int iVar6;
  undefined4 *puVar7;
  bool bVar8;
  uint *puVar9;
  undefined4 local_38 [8];
  uint local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  int local_8;
  
  local_18 = in_ECX[3];
  uVar4 = 0;
  iVar6 = 0;
  local_8 = 0;
  if (local_18 != 0) {
    do {
      in_ECX[0x3f] = uVar4;
      in_ECX[0x40] = *(int *)(in_ECX[6] + uVar4 * 4);
      FUN_100bb114();
      uVar4 = uVar4 + 1;
    } while (uVar4 < (uint)in_ECX[3]);
  }
  local_14 = 0;
  if (local_18 != 0) {
    do {
      in_ECX[0x3f] = local_14;
      puVar9 = *(uint **)(in_ECX[6] + local_14 * 4);
      in_ECX[0x40] = (int)puVar9;
      uVar4 = *puVar9 & 0xfff00000;
      if (((((((uVar4 == 0x60500000) || (uVar4 == 0x60f00000)) || (uVar4 == 0x60a00000)) ||
            ((uVar4 == 0x60200000 || (uVar4 == 0x60700000)))) || (uVar4 == 0x60c00000)) ||
          (((uVar4 == 0x61100000 || (uVar4 == 0x60300000)) ||
           ((uVar4 == 0x60800000 ||
            (((uVar4 == 0x60d00000 || (uVar4 == 0x61200000)) || (uVar4 == 0x60000000)))))))) ||
         (uVar4 == 0x11000000)) {
        uVar4 = *puVar9 & 0xfffff;
        local_10 = uVar4;
        if ((*puVar9 & 0xfff00000) == 0x11000000) {
          local_10 = 0;
        }
        local_c = 0;
        if (uVar4 != 0) {
          iVar6 = local_10 << 2;
          do {
            iVar1 = *(int *)(in_ECX[5] + *(int *)(iVar6 + *(int *)(in_ECX[0x40] + 8)) * 4);
            if ((*(uint *)(iVar1 + 0x10) != local_c) || ((*(byte *)(iVar1 + 0x3e) & 0x1f) != 0))
            break;
            if (*(int *)(iVar1 + 4) == in_ECX[0x20]) {
              iVar1 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(iVar1 + 0x6c));
              bVar8 = iVar1 == 6;
            }
            else {
              bVar8 = *(int *)(iVar1 + 4) == in_ECX[0x22];
            }
            if (!bVar8) break;
            local_c = local_c + 1;
            iVar6 = iVar6 + 4;
          } while (local_c < uVar4);
        }
        if (((*(uint *)in_ECX[0x40] & 0xfff00000) == 0x60000000) && (uVar4 == 1)) {
          iVar6 = (**(code **)(*in_ECX + 0x80))(in_ECX[0x3f],local_38 + 4,4,0,0);
          if (iVar6 < 0) {
            return 0;
          }
          iVar6 = FUN_10085814(0x74);
          if (iVar6 == 0) {
            iVar6 = 0;
          }
          else {
            iVar6 = FUN_10085379();
          }
          if (iVar6 == 0) {
            return 0x8007000e;
          }
          local_8 = iVar6;
          iVar1 = FUN_1008585f(0x10000002,2,2,0);
          if ((iVar1 < 0) || (iVar1 = FUN_100853b0(in_ECX[0x40]), iVar1 < 0)) goto LAB_100b59dc;
          **(undefined4 **)(iVar6 + 8) = *(undefined4 *)(*(int *)(in_ECX[0x40] + 8) + 4);
          *(undefined4 *)(*(int *)(iVar6 + 8) + 4) = *(undefined4 *)(*(int *)(in_ECX[0x40] + 8) + 4)
          ;
          **(undefined4 **)(iVar6 + 0x10) = local_38[4];
          *(undefined4 *)(*(int *)(iVar6 + 0x10) + 4) = local_38[5];
          iVar6 = FUN_10086026(iVar6);
          if (iVar6 < 0) goto LAB_100b59dc;
          iVar6 = FUN_10085814(0x74);
          if (iVar6 == 0) {
            uVar4 = 0;
          }
          else {
            uVar4 = FUN_10085379();
          }
          if (uVar4 == 0) {
            return 0;
          }
          local_c = uVar4;
          iVar6 = FUN_1008585f(0x60500002,4,*(undefined4 *)(in_ECX[0x40] + 0xc),0);
          if ((iVar6 < 0) || (iVar6 = FUN_100853b0(in_ECX[0x40]), iVar6 < 0)) goto LAB_100b59e3;
          uVar2 = 8;
          do {
            *(undefined4 *)((uVar2 - 8) + *(int *)(uVar4 + 8)) = **(undefined4 **)(in_ECX[0x40] + 8)
            ;
            *(undefined4 *)(uVar2 + *(int *)(uVar4 + 8)) =
                 *(undefined4 *)((int)local_38 + uVar2 + 8);
            uVar2 = uVar2 + 4;
          } while (uVar2 < 0x10);
          puVar5 = *(undefined4 **)(in_ECX[0x40] + 0x10);
          puVar7 = *(undefined4 **)(local_c + 0x10);
          for (uVar4 = *(uint *)(in_ECX[0x40] + 0xc) & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1) {
            *puVar7 = *puVar5;
            puVar5 = puVar5 + 1;
            puVar7 = puVar7 + 1;
          }
          for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
            *(undefined1 *)puVar7 = *(undefined1 *)puVar5;
            puVar5 = (undefined4 *)((int)puVar5 + 1);
            puVar7 = (undefined4 *)((int)puVar7 + 1);
          }
          if (in_ECX[0x40] != 0) {
            FUN_1006c418(1);
          }
          *(uint *)(in_ECX[6] + local_14 * 4) = local_c;
          in_ECX[0x40] = local_c;
LAB_100b555a:
          local_8 = 0;
        }
        else if (local_c != uVar4) {
          iVar6 = (**(code **)(*in_ECX + 0x80))(in_ECX[0x3f],local_38,4,0,0);
          if (iVar6 < 0) {
            return 0;
          }
          iVar6 = FUN_10085814(0x74);
          if (iVar6 == 0) {
            local_8 = 0;
          }
          else {
            local_8 = FUN_10085379();
          }
          if (local_8 == 0) {
            return 0x8007000e;
          }
          iVar6 = FUN_1008585f(uVar4 | 0x10000000,uVar4,uVar4,0);
          if ((-1 < iVar6) && (iVar6 = FUN_100853b0(in_ECX[0x40]), -1 < iVar6)) {
            local_c = 0;
            if (uVar4 != 0) {
              iVar6 = local_10 << 2;
              do {
                uVar2 = local_c;
                iVar1 = local_c * 4;
                local_c = local_c + 1;
                *(undefined4 *)(iVar1 + *(int *)(local_8 + 8)) =
                     *(undefined4 *)(iVar6 + *(int *)(in_ECX[0x40] + 8));
                *(undefined4 *)(iVar1 + *(int *)(local_8 + 0x10)) = local_38[uVar2];
                *(undefined4 *)(iVar6 + *(int *)(in_ECX[0x40] + 8)) =
                     *(undefined4 *)(iVar1 + *(int *)(local_8 + 0x10));
                iVar6 = iVar6 + 4;
              } while (local_c < uVar4);
            }
            iVar6 = FUN_10086026(local_8);
            if (-1 < iVar6) goto LAB_100b555a;
          }
          goto LAB_100b59dc;
        }
        puVar9 = (uint *)in_ECX[0x40];
      }
      iVar6 = FUN_10086292(puVar9);
      if (iVar6 < 0) {
        return 0;
      }
      *(undefined4 *)in_ECX[0x40] = 0;
      local_14 = local_14 + 1;
    } while (local_14 < local_18);
  }
  FUN_100ba843();
  local_18 = in_ECX[3];
  uVar4 = 0;
  if (local_18 != 0) {
    do {
      in_ECX[0x3f] = uVar4;
      iVar1 = *(int *)(in_ECX[6] + uVar4 * 4);
      in_ECX[0x40] = iVar1;
      iVar1 = *(int *)(iVar1 + 0x3c);
      if ((iVar1 != 0) && (*(int *)(iVar1 + 4) == 0xd)) {
        in_ECX[0x41] = iVar1 + 0x30;
      }
      puVar9 = (uint *)in_ECX[0x40];
      puVar3 = (undefined *)(*puVar9 & 0xfff00000);
      if (((puVar3 != (undefined *)0x0) && (puVar9[1] != 0)) &&
         (*(int *)(*(int *)(in_ECX[5] + *(int *)puVar9[2] * 4) + 8) != -1)) goto LAB_100b59ac;
      if (puVar3 < (undefined *)0x60500001) {
        if (puVar3 == (undefined *)0x60500000) {
LAB_100b58c7:
          iVar6 = FUN_100ca051();
        }
        else if (puVar3 < (undefined *)0x20100001) {
          if (puVar3 == (undefined *)0x20100000) {
LAB_100b5979:
            iVar6 = FUN_100b37c8();
          }
          else if (&DAT_10600000 < puVar3) {
            if (puVar3 == &DAT_10700000) {
              iVar6 = FUN_100cb7e7();
            }
            else if (puVar3 == (undefined *)0x10d00000) {
              if ((*(byte *)(in_ECX + 0x1c) & 0x10) == 0) {
LAB_100b5710:
                iVar6 = -0x7fffbfff;
              }
              else {
                iVar6 = FUN_100cb76f();
              }
            }
            else if (puVar3 == (undefined *)0x10e00000) {
              if ((*(byte *)(in_ECX + 0x1c) & 0x10) == 0) goto LAB_100b5710;
              iVar6 = FUN_100cb779();
            }
            else {
              if (puVar3 == (undefined *)0x10f00000) goto LAB_100b5967;
              if (puVar3 != (undefined *)0x11000000) {
                if (puVar3 != (undefined *)0x20000000) goto LAB_100b59c0;
                goto LAB_100b56e6;
              }
              iVar6 = FUN_100ca44c();
            }
          }
          else if (puVar3 == &DAT_10600000) {
            iVar6 = FUN_100cb7c9();
          }
          else if (puVar3 != (undefined *)0x0) {
            if (puVar3 == (undefined *)0x10000000) {
              iVar6 = FUN_100cb636();
            }
            else if (puVar3 == (undefined *)0x10100000) {
              iVar6 = FUN_100cac40();
            }
            else if (puVar3 == &DAT_10300000) {
              iVar6 = FUN_100cb783();
            }
            else if (puVar3 == &DAT_10400000) {
              iVar6 = FUN_100cb7a1();
            }
            else {
              if (puVar3 != &DAT_10500000) goto LAB_100b59c0;
              iVar6 = FUN_100cb7ab();
            }
          }
        }
        else if (puVar3 < (undefined *)0x50000001) {
          if (puVar3 == (undefined *)0x50000000) {
            iVar6 = FUN_100cb84b();
          }
          else if (puVar3 == (undefined *)0x20200000) {
            iVar6 = FUN_100b36ec();
          }
          else if (puVar3 == (undefined *)0x20300000) {
            iVar6 = FUN_100b3610();
          }
          else if (puVar3 == (undefined *)0x20400000) {
            iVar6 = FUN_100cb82d();
          }
          else if (puVar3 == (undefined *)0x20500000) {
            iVar6 = FUN_100cb837();
          }
          else if (puVar3 == (undefined *)0x20700000) {
            iVar6 = FUN_100ca848();
          }
          else {
            if (puVar3 != (undefined *)0x30000000) goto LAB_100b59c0;
            iVar6 = FUN_100cb908();
          }
        }
        else {
          if (puVar3 != (undefined *)0x50300000) {
            if (puVar3 != (undefined *)0x60000000) {
              if (puVar3 == (undefined *)0x60100000) goto LAB_100b5871;
              if (puVar3 == (undefined *)0x60200000) goto LAB_100b58bb;
              if (puVar3 == (undefined *)0x60300000) goto LAB_100b58af;
              if (puVar3 != (undefined *)0x60400000) goto LAB_100b59c0;
              goto LAB_100b5807;
            }
            goto LAB_100b58c7;
          }
          iVar6 = FUN_100ca5a1();
        }
      }
      else {
        if ((undefined *)0x61300000 < puVar3) {
          if (puVar3 < (undefined *)0x70b00001) {
            if (puVar3 == (undefined *)0x70b00000) {
LAB_100b56e6:
              iVar6 = FUN_100b38fe();
            }
            else if (puVar3 == (undefined *)0x70000000) {
              iVar6 = FUN_100cb91c();
            }
            else if (puVar3 == (undefined *)0x70100000) {
              iVar6 = FUN_100cadbf();
            }
            else if (puVar3 == (undefined *)0x70200000) {
              iVar6 = FUN_100caeda();
            }
            else if ((puVar3 == (undefined *)0x70300000) || (puVar3 == (undefined *)0x70400000)) {
              iVar6 = FUN_100caf80();
            }
            else {
              if (puVar3 != (undefined *)0x70800000) goto LAB_100b59c0;
              iVar6 = FUN_100ca416();
            }
          }
          else {
            if (puVar3 == (undefined *)0x70c00000) goto LAB_100b5979;
            if (puVar3 == (undefined *)0x70d00000) {
              iVar6 = FUN_100cad4d();
            }
            else {
              if (((puVar3 != (undefined *)0x73500000) && (puVar3 != (undefined *)0x73600000)) &&
                 ((puVar3 != (undefined *)0x73700000 && (puVar3 != (undefined *)0x73800000))))
              goto LAB_100b59c0;
LAB_100b5967:
              iVar6 = FUN_100ca63f();
            }
          }
          goto LAB_100b5982;
        }
        if (puVar3 == (undefined *)0x61300000) {
LAB_100b5807:
          if ((*(byte *)(in_ECX + 0x1c) & 0x20) == 0) {
LAB_100b59ac:
            FUN_1008b0b5();
            return 0;
          }
          iVar6 = FUN_100ca3b2();
        }
        else if (puVar3 < (undefined *)0x60c00001) {
          if (puVar3 == (undefined *)0x60c00000) {
LAB_100b58bb:
            iVar6 = FUN_100ca2e4();
          }
          else {
            if (puVar3 != (undefined *)0x60600000) {
              if (puVar3 == (undefined *)0x60700000) goto LAB_100b58bb;
              if (puVar3 == (undefined *)0x60800000) goto LAB_100b58af;
              if (puVar3 == (undefined *)0x60900000) goto LAB_100b5807;
              if (puVar3 == (undefined *)0x60a00000) goto LAB_100b58c7;
              if (puVar3 != (undefined *)0x60b00000) goto LAB_100b59c0;
            }
LAB_100b5871:
            iVar6 = FUN_100ca0b5();
          }
        }
        else {
          if (puVar3 != (undefined *)0x60d00000) {
            if (puVar3 == (undefined *)0x60e00000) goto LAB_100b5807;
            if (puVar3 == (undefined *)0x60f00000) goto LAB_100b58c7;
            if (puVar3 == (undefined *)0x61000000) goto LAB_100b5871;
            if (puVar3 == (undefined *)0x61100000) goto LAB_100b58bb;
            if (puVar3 != (undefined *)0x61200000) goto LAB_100b59c0;
          }
LAB_100b58af:
          iVar6 = FUN_100ca34b();
        }
      }
LAB_100b5982:
      if (iVar6 == -0x7fffbfff) {
LAB_100b59c0:
        FUN_1008b0b5();
LAB_100b59dc:
        if (local_8 == 0) {
          return 0;
        }
LAB_100b59e3:
        FUN_1006c418(1);
        return 0;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < local_18);
  }
  return 0;
}


