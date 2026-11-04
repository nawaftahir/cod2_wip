// 100794d6 size=4142 FUN_100794d6

int FUN_100794d6(int *param_1,int *param_2,uint param_3,int *param_4,uint param_5,uint param_6,
                uint *param_7,uint *param_8)

{
  int iVar1;
  uint *puVar2;
  uint *puVar3;
  undefined4 *puVar4;
  double dVar5;
  int iVar6;
  int *piVar7;
  int in_ECX;
  uint uVar8;
  uint uVar9;
  undefined8 uVar10;
  int local_6c [3];
  undefined4 *local_60;
  int local_5c;
  int *local_58;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 *local_48;
  int local_44;
  int local_40;
  undefined4 local_3c;
  undefined8 local_38;
  undefined8 local_30;
  uint local_28;
  uint local_24;
  uint local_20;
  uint local_1c;
  int *local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  if (param_5 == 0) goto LAB_10079bff;
  local_8 = 0;
  if (param_3 == 0) {
    local_c = 1;
  }
  else {
    local_c = param_5 / param_3;
  }
  iVar6 = FUN_1006c8ca(*param_7,&local_38);
  if (-1 < iVar6) {
    if (0.0 <= local_38) {
      if (0.0 < local_38) {
        local_38 = local_38 + *(double *)(in_ECX + 0xb0);
      }
      else {
        local_38 = 0.0;
      }
    }
    else {
      local_38 = local_38 - *(double *)(in_ECX + 0xb0);
    }
    if (0.0 <= local_30) {
      if (0.0 < local_30) {
        local_30 = local_30 + *(double *)(in_ECX + 0xb0);
      }
      else {
        local_30 = 0.0;
      }
    }
    else {
      local_30 = local_30 - *(double *)(in_ECX + 0xb0);
    }
    iVar6 = FUN_100f8c58(local_38);
    if ((iVar6 == 0) || (local_38 < 0.0)) {
      local_8 = 0;
    }
    else {
      local_8 = __ftol();
    }
    if ((local_30 < 0.0) || (param_5 <= local_8 * param_3)) {
      if (*(int *)(in_ECX + 0x58) == 0) goto LAB_10079bff;
      *(undefined4 *)(in_ECX + 0x5c) = 1;
      if (param_2 == (int *)0x0) {
        return 0;
      }
      goto code_r0x100796d3;
    }
    iVar6 = FUN_100f8c58(local_30);
    if (iVar6 == 0) {
      iVar6 = local_c - 1;
    }
    else {
      iVar6 = __ftol();
    }
    if (iVar6 + 1U < local_c) {
      local_c = iVar6 + 1U;
    }
  }
  if (param_2 == (int *)0x0) {
    return 0;
  }
  if ((param_8 == (uint *)0x0) && (iVar6 = FUN_1007107a(param_6,param_4,param_5), iVar6 < 0)) {
    return iVar6;
  }
  param_6 = 0xffffffff;
  uVar9 = 0;
  local_14 = 0;
  if (param_5 != 0) {
    do {
      uVar8 = *(uint *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x10) +
                                *(int *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) +
                                                 param_4[uVar9] * 4) + 4) * 4) + 4);
      local_14 = local_14 | uVar8;
      param_6 = param_6 & uVar8;
      uVar9 = uVar9 + 1;
    } while (uVar9 < param_5);
  }
  local_24 = ~(local_14 >> 7) & 1;
  local_20 = param_6 & 2;
  local_28 = param_6 & 0x40;
  param_6 = param_6 & 0x400;
  if ((local_14 & 0x100000) == 0) {
    if ((param_6 == 0) && ((*(byte *)(*(int *)(in_ECX + 8) + 0x71) & 2) == 0)) goto LAB_100796f8;
  }
  else if ((local_8 < *(uint *)(in_ECX + 0x68)) || (*(uint *)(in_ECX + 0x6c) < local_c)) {
    param_6 = 0;
LAB_100796f8:
    *(undefined4 *)(in_ECX + 0x60) = 1;
  }
  if (local_8 + 1 == local_c) {
    param_4 = param_4 + local_8 * param_3;
code_r0x100796d3:
    for (; param_3 != 0; param_3 = param_3 - 1) {
      *param_2 = *param_4;
      param_4 = param_4 + 1;
      param_2 = param_2 + 1;
    }
    return 0;
  }
  local_1c = param_3;
  local_14 = local_28;
  local_10 = local_28;
  if (param_3 < param_5) {
    local_18 = param_4;
    do {
      if ((local_10 == 0) && (local_14 == 0)) goto LAB_10079789;
      iVar6 = *(int *)(*(int *)(in_ECX + 8) + 0x14);
      iVar1 = *(int *)(iVar6 + *local_18 * 4);
      iVar6 = *(int *)(iVar6 + param_4[local_1c] * 4);
      if ((*(int *)(iVar1 + 4) == *(int *)(iVar6 + 4)) &&
         (*(int *)(iVar1 + 8) == *(int *)(iVar6 + 8))) {
        if (*(int *)(iVar1 + 0xc) != *(int *)(iVar6 + 0xc)) {
          local_10 = 0;
        }
        if (*(int *)(iVar1 + 0x10) != *(int *)(iVar6 + 0x10)) goto LAB_1007976e;
      }
      else {
        local_10 = 0;
LAB_1007976e:
        local_14 = 0;
      }
      local_18 = local_18 + 1;
      local_1c = local_1c + 1;
    } while (local_1c < param_5);
  }
  if (local_14 == 0) {
LAB_10079789:
    param_6 = 0;
  }
  if ((local_10 != 0) && (local_14 != 0)) goto code_r0x100796d3;
  if (param_6 == 0) {
LAB_10079811:
    local_20 = 0;
  }
  else {
    if (local_10 == 0) {
      iVar6 = *(int *)(*(int *)(in_ECX + 8) + 0x14);
      local_14 = 1;
      if (1 < param_3) {
        iVar1 = *(int *)(*(int *)(in_ECX + 8) + 0x14);
        local_18 = param_4 + param_3 + 1;
        do {
          if (*(int *)(*(int *)(iVar6 + param_4[param_3] * 4) + 0xc) -
              *(int *)(*(int *)(iVar6 + *param_4 * 4) + 0xc) !=
              *(int *)(*(int *)(iVar1 + *local_18 * 4) + 0xc) -
              *(int *)(*(int *)(iVar1 + param_4[local_14] * 4) + 0xc)) {
            param_6 = 0;
            break;
          }
          local_14 = local_14 + 1;
          local_18 = local_18 + 1;
        } while (local_14 < param_3);
      }
    }
    if (param_6 == 0) goto LAB_10079811;
  }
  if ((param_8 == (uint *)0x0) || (local_20 != 0)) {
    if (param_6 != 0) {
      iVar6 = 1;
      if (param_3 < param_5) {
        iVar6 = *(int *)(*(int *)(in_ECX + 8) + 0x14);
        iVar6 = *(int *)(*(int *)(iVar6 + param_4[param_3] * 4) + 0xc) -
                *(int *)(*(int *)(iVar6 + *param_4 * 4) + 0xc);
      }
      param_5 = *param_7;
      if ((iVar6 != 1) || ((*(byte *)(*(int *)(in_ECX + 8) + 0x6f) & 1) == 0)) {
        dVar5 = (double)iVar6;
        if (iVar6 < 0) {
          dVar5 = dVar5 + 4294967296.0;
        }
        param_7 = (uint *)iVar6;
        param_8 = (uint *)FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,dVar5);
        if (param_8 == (uint *)0xffffffff) {
          return -0x7ff8fff2;
        }
        local_3c = 0xffffffff;
        local_38 = -NAN;
        local_30 = -NAN;
        if ((**(byte **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + param_5 * 4) & 2) == 0) {
          iVar6 = FUN_1006e308(param_1,&DAT_10200001,&local_3c,&param_5,0,4);
          if (iVar6 < 0) {
            return iVar6;
          }
          iVar6 = FUN_1006e308(param_1,&DAT_10400001,&local_38,&local_3c,0,4);
          if (iVar6 < 0) {
            return iVar6;
          }
          iVar6 = FUN_1006e308(param_1,0x10100001,(int)&local_38 + 4,&local_38,0,8);
          if (iVar6 < 0) {
            return iVar6;
          }
          iVar6 = FUN_1006e308(param_1,0x20400001,&local_30,(int)&local_38 + 4,&local_3c,6);
          if (iVar6 < 0) {
            return iVar6;
          }
          param_5 = (uint)local_30;
        }
        iVar6 = FUN_1006e308(param_1,0x20500001,(int)&local_30 + 4,&param_5,&param_8,2);
        if (iVar6 < 0) {
          return iVar6;
        }
        param_5 = local_30._4_4_;
      }
      iVar6 = *(int *)(in_ECX + 8);
      param_7 = *(uint **)(*(int *)(*(int *)(iVar6 + 0x14) + *param_4 * 4) + 8);
      if (param_7 != (uint *)0xffffffff) {
        *(undefined4 *)(*(int *)(*(int *)(iVar6 + 0x14) + (int)param_7 * 4) + 4) =
             *(undefined4 *)(iVar6 + 0x88);
        local_3c = 0xffffffff;
        local_38 = -NAN;
        local_30 = -NAN;
        if ((**(byte **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + (int)param_7 * 4) & 2) == 0) {
          iVar6 = FUN_1006e308(param_1,&DAT_10200001,&local_3c,&param_7,0,4);
          if (iVar6 < 0) {
            return iVar6;
          }
          iVar6 = FUN_1006e308(param_1,&DAT_10400001,&local_38,&local_3c,0,4);
          if (iVar6 < 0) {
            return iVar6;
          }
          iVar6 = FUN_1006e308(param_1,0x10100001,(int)&local_38 + 4,&local_38,0,8);
          if (iVar6 < 0) {
            return iVar6;
          }
          iVar6 = FUN_1006e308(param_1,0x20400001,&local_30,(int)&local_38 + 4,&local_3c,6);
          if (iVar6 < 0) {
            return iVar6;
          }
          param_7 = (uint *)(uint)local_30;
        }
        iVar6 = FUN_1006e308(param_1,0x20400001,(int)&local_30 + 4,&param_7,&param_5,0);
        if (iVar6 < 0) {
          return iVar6;
        }
        param_5 = local_30._4_4_;
      }
      if (*(int *)(*(int *)(in_ECX + 8) + 0x30) != 0) {
        param_8 = (uint *)0xffffffff;
        iVar6 = FUN_1006e308(param_1,0x10000001,&param_8,&param_5,0,4);
        if (iVar6 < 0) {
          return iVar6;
        }
        param_5 = (uint)param_8;
        *(undefined4 *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + (int)param_8 * 4) + 4) =
             *(undefined4 *)(*(int *)(in_ECX + 8) + 0x8c);
      }
      param_8 = (uint *)0x0;
      if (param_3 == 0) {
        return 0;
      }
      param_1 = param_4;
      do {
        iVar6 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x88),0,0,0);
        *(int *)(((int)param_2 - (int)param_4) + (int)param_1) = iVar6;
        if (iVar6 == -1) {
          return -0x7ff8fff2;
        }
        puVar2 = *(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + iVar6 * 4);
        FUN_10085c65();
        puVar2[0xd] = 0xffffffff;
        puVar2[2] = param_5;
        *puVar2 = 0x1f;
        *(undefined8 *)(puVar2 + 8) = *(undefined8 *)(in_ECX + 0xa0);
        *(undefined8 *)(puVar2 + 10) = *(undefined8 *)(in_ECX + 0xa8);
        if (local_8 < local_c) {
          iVar6 = local_c - local_8;
          piVar7 = param_4 + local_8 * param_3 + (int)param_8;
          do {
            puVar3 = *(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *piVar7 * 4);
            *puVar2 = *puVar2 & *puVar3;
            if ((*puVar3 & 0x100) != 0) {
              if (*(double *)(puVar3 + 8) < *(double *)(puVar2 + 8)) {
                *(undefined8 *)(puVar2 + 8) = *(undefined8 *)(puVar3 + 8);
              }
              if (*(double *)(puVar2 + 10) < *(double *)(puVar3 + 10)) {
                *(undefined8 *)(puVar2 + 10) = *(undefined8 *)(puVar3 + 10);
              }
            }
            piVar7 = piVar7 + param_3;
            iVar6 = iVar6 + -1;
          } while (iVar6 != 0);
        }
        if (*(double *)(puVar2 + 8) < *(double *)(puVar2 + 10) !=
            (*(double *)(puVar2 + 8) == *(double *)(puVar2 + 10))) {
          *(byte *)((int)puVar2 + 1) = *(byte *)((int)puVar2 + 1) | 1;
        }
        if (*(double *)(puVar2 + 8) == *(double *)(puVar2 + 10)) {
          *(byte *)puVar2 = (byte)*puVar2 | 0x80;
        }
        param_8 = (uint *)((int)param_8 + 1);
        param_1 = param_1 + 1;
      } while (param_8 < param_3);
      return 0;
    }
    if (local_24 != 0) {
      if ((**(byte **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *param_7 * 4) & 1) != 0) {
        iVar6 = FUN_1006c449();
        if (iVar6 == 0) {
          return -0x7ff8fff2;
        }
        uVar9 = 0;
        if (param_3 != 0) {
          do {
            *(uint *)(iVar6 + uVar9 * 4) = *param_7;
            uVar9 = uVar9 + 1;
          } while (uVar9 < param_3);
        }
        uVar10 = FUN_1006c566(param_2,param_3);
        if (-1 < (int)uVar10) {
          iVar6 = FUN_1007041a(param_1,param_2,param_4,param_4 + param_3,
                               (int)((ulonglong)uVar10 >> 0x20),param_3);
          if (-1 < iVar6) {
            return 0;
          }
          return iVar6;
        }
        return (int)uVar10;
      }
      uVar9 = local_c - local_8;
      param_5 = uVar9;
      if ((uVar9 < 5) && (((param_3 == 1 && (local_28 == 0)) || ((param_3 < 5 && (local_10 != 0)))))
         ) {
        if ((*(int *)(in_ECX + 0x58) != 0) &&
           ((1 < param_3 || ((*(byte *)(*(int *)(in_ECX + 8) + 0x71) & 2) == 0)))) {
          *(undefined4 *)(in_ECX + 0x60) = 1;
        }
        iVar6 = FUN_1006c449();
        if (iVar6 == 0) {
          return -0x7ff8fff2;
        }
        uVar10 = FUN_1006c566(iVar6,uVar9 * 7 + 4);
        iVar6 = (int)((ulonglong)uVar10 >> 0x20);
        if ((int)uVar10 < 0) {
          return (int)uVar10;
        }
        uVar8 = 0;
        do {
          local_6c[uVar8] = iVar6;
          iVar6 = iVar6 + 4;
          uVar8 = uVar8 + 1;
        } while (uVar8 < 4);
        uVar8 = 4;
        do {
          local_6c[uVar8] = iVar6;
          iVar6 = iVar6 + uVar9 * 4;
          uVar8 = uVar8 + 1;
        } while (uVar8 < 0xb);
        param_8 = (uint *)*param_7;
        iVar6 = *(int *)(in_ECX + 8);
        if (((**(byte **)(*(int *)(iVar6 + 0x14) + (int)param_8 * 4) & 2) == 0) &&
           (((*(byte *)(iVar6 + 0x71) & 2) == 0 || ((*(byte *)(iVar6 + 0x6f) & 1) == 0)))) {
          iVar6 = FUN_1006e308(param_1,&DAT_10200001,local_6c[0],&param_8,0,4);
          if (iVar6 < 0) {
            return iVar6;
          }
          iVar6 = FUN_1006e308(param_1,&DAT_10400001,local_6c[1],local_6c[0],0,4);
          if (iVar6 < 0) {
            return iVar6;
          }
          iVar6 = FUN_1006e308(param_1,0x10100001,local_6c[2],local_6c[1],0,8);
          if (iVar6 < 0) {
            return iVar6;
          }
          iVar6 = FUN_1006e308(param_1,0x20400001,local_60,local_6c[2],local_6c[0],6);
          if (iVar6 < 0) {
            return iVar6;
          }
          param_8 = (uint *)*local_60;
        }
        if ((*(byte *)(*(int *)(in_ECX + 8) + 0x71) & 2) == 0) {
          uVar9 = 0;
          if (param_5 != 0) {
            param_7 = (uint *)(local_5c - (int)local_58);
            piVar7 = local_58;
            do {
              *(uint **)((int)param_7 + (int)piVar7) = param_8;
              param_6 = local_8 + uVar9;
              dVar5 = (double)(int)param_6;
              if ((int)param_6 < 0) {
                dVar5 = dVar5 + 4294967296.0;
              }
              iVar6 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,-dVar5);
              *piVar7 = iVar6;
              if (iVar6 == -1) {
                return -0x7ff8fff2;
              }
              uVar9 = uVar9 + 1;
              piVar7 = piVar7 + 1;
            } while (uVar9 < param_5);
          }
          uVar9 = param_5 & 0xfffff;
          iVar6 = FUN_1006e308(param_1,uVar9 | 0x20400000,local_54,local_5c,local_58,2);
          if (iVar6 < 0) {
            return iVar6;
          }
          iVar6 = FUN_10070d24(param_1,local_50,local_4c,local_54,param_5);
          if (iVar6 < 0) {
            return iVar6;
          }
          iVar6 = FUN_1006e308(param_1,uVar9 | 0x20300000,local_48,local_4c,local_50,0x17);
          if (iVar6 < 0) {
            return iVar6;
          }
        }
        else {
          if (local_8 != 0) {
            param_7 = (uint *)local_8;
            dVar5 = (double)(int)local_8;
            if ((int)local_8 < 0) {
              dVar5 = dVar5 + 4294967296.0;
            }
            param_6 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,-dVar5);
            if (param_6 == 0xffffffff) {
              return -0x7ff8fff2;
            }
            param_7 = (uint *)0xffffffff;
            iVar6 = FUN_1006e308(param_1,0x20400001,&param_7,&param_8,&param_6,4);
            if (iVar6 < 0) {
              return iVar6;
            }
            param_8 = param_7;
          }
          if (*(int *)(*(int *)(in_ECX + 8) + 0x30) != 0) {
            param_7 = (uint *)0xffffffff;
            iVar6 = FUN_1006e308(param_1,0x10000001,&param_7,&param_8,0,4);
            if (iVar6 < 0) {
              return iVar6;
            }
            param_8 = param_7;
            *(undefined4 *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + (int)param_7 * 4) + 4)
                 = *(undefined4 *)(*(int *)(in_ECX + 8) + 0x8c);
          }
          if (*(int *)(in_ECX + 0x48) == -1) {
            iVar6 = FUN_100860e0(&DAT_1010e8c0,0x751,4,4);
            *(int *)(in_ECX + 0x48) = iVar6;
            if (iVar6 == -1) {
              return -0x7ff8fff2;
            }
            uVar9 = 0;
            do {
              uVar8 = 0;
              do {
                if (uVar9 == uVar8) {
                  uVar10 = 0x3ff0000000000000;
                }
                else {
                  uVar10 = 0;
                }
                iVar6 = FUN_10086139(*(undefined4 *)(in_ECX + 0x48),uVar9,uVar8,uVar10);
                if (iVar6 == -1) {
                  return -0x7ff8fff2;
                }
                uVar8 = uVar8 + 1;
              } while (uVar8 < 4);
              uVar9 = uVar9 + 1;
            } while (uVar9 < 4);
          }
          uVar9 = 0;
          if (param_5 != 0) {
            do {
              iVar6 = FUN_10086139(*(undefined4 *)(in_ECX + 0x48),0,uVar9,0);
              local_48[uVar9] = iVar6;
              if (iVar6 == -1) {
                return -0x7ff8fff2;
              }
              puVar4 = *(undefined4 **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + iVar6 * 4);
              *(undefined8 *)(puVar4 + 8) = 0;
              uVar9 = uVar9 + 1;
              *(undefined8 *)(puVar4 + 10) = 0x3ff0000000000000;
              puVar4[2] = param_8;
              *puVar4 = 0x117;
            } while (uVar9 < param_5);
          }
        }
        iVar6 = FUN_1006c566(param_2,param_3);
        if (iVar6 < 0) {
          return iVar6;
        }
        param_7 = (uint *)0x0;
        if (param_3 == 0) {
          return 0;
        }
        uVar9 = param_5 & 0xfffff;
        while( true ) {
          uVar8 = 0;
          if (param_5 != 0) {
            piVar7 = param_4 + local_8 * param_3 + (int)param_7;
            do {
              *(int *)(local_44 + uVar8 * 4) = *piVar7;
              uVar8 = uVar8 + 1;
              piVar7 = piVar7 + param_3;
            } while (uVar8 < param_5);
          }
          iVar6 = FUN_1006e308(param_1,uVar9 | 0x50000000,param_2,local_44,local_48,0);
          if (iVar6 < 0) break;
          param_7 = (uint *)((int)param_7 + 1);
          param_2 = param_2 + 1;
          if (param_3 <= param_7) {
            return 0;
          }
        }
        return iVar6;
      }
      if (*(int *)(in_ECX + 0x58) != 0) {
        *(undefined4 *)(in_ECX + 0x60) = 1;
      }
      iVar6 = FUN_1006c449();
      if (iVar6 == 0) {
        return -0x7ff8fff2;
      }
      uVar10 = FUN_1006c566(iVar6,(param_3 + uVar9 * 3) * 2 + 4);
      iVar6 = (int)((ulonglong)uVar10 >> 0x20);
      if ((int)uVar10 < 0) {
        return (int)uVar10;
      }
      uVar8 = 0;
      do {
        local_6c[uVar8] = iVar6;
        iVar6 = iVar6 + 4;
        uVar8 = uVar8 + 1;
      } while (uVar8 < 4);
      uVar8 = 4;
      do {
        local_6c[uVar8] = iVar6;
        iVar6 = iVar6 + uVar9 * 4;
        uVar8 = uVar8 + 1;
      } while (uVar8 < 10);
      uVar9 = 10;
      do {
        local_6c[uVar9] = iVar6;
        iVar6 = iVar6 + param_3 * 4;
        uVar9 = uVar9 + 1;
      } while (uVar9 < 0xc);
      param_8 = (uint *)*param_7;
      if ((**(byte **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + (int)param_8 * 4) & 2) == 0) {
        iVar6 = FUN_1006e308(param_1,&DAT_10200001,local_6c[0],&param_8,0,4);
        if (iVar6 < 0) {
          return iVar6;
        }
        iVar6 = FUN_1006e308(param_1,&DAT_10400001,local_6c[1],local_6c[0],0,4);
        if (iVar6 < 0) {
          return iVar6;
        }
        iVar6 = FUN_1006e308(param_1,0x10100001,local_6c[2],local_6c[1],0,8);
        if (iVar6 < 0) {
          return iVar6;
        }
        iVar6 = FUN_1006e308(param_1,0x20400001,local_60,local_6c[2],local_6c[0],6);
        if (iVar6 < 0) {
          return iVar6;
        }
        param_8 = (uint *)*local_60;
      }
      if (((*(byte *)(*(int *)(in_ECX + 8) + 0x71) & 2) == 0) || (4 < param_5)) {
        uVar9 = 0;
        if (param_5 != 0) {
          param_7 = (uint *)(local_5c - (int)local_58);
          piVar7 = local_58;
          do {
            *(uint **)((int)param_7 + (int)piVar7) = param_8;
            param_6 = local_8 + uVar9;
            dVar5 = (double)(int)param_6;
            if ((int)param_6 < 0) {
              dVar5 = dVar5 + 4294967296.0;
            }
            iVar6 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,-dVar5);
            *piVar7 = iVar6;
            if (iVar6 == -1) {
              return -0x7ff8fff2;
            }
            uVar9 = uVar9 + 1;
            piVar7 = piVar7 + 1;
          } while (uVar9 < param_5);
        }
        uVar9 = param_5 & 0xfffff;
        iVar6 = FUN_1006e308(param_1,uVar9 | 0x20400000,local_54,local_5c,local_58,2);
        if (iVar6 < 0) {
          return iVar6;
        }
        iVar6 = FUN_10070d24(param_1,local_50,local_4c,local_54,param_5);
        if (iVar6 < 0) {
          return iVar6;
        }
        iVar6 = FUN_1006e308(param_1,uVar9 | 0x20300000,local_48,local_4c,local_50,0x17);
        if (iVar6 < 0) {
          return iVar6;
        }
      }
      else {
        if (local_8 != 0) {
          param_7 = (uint *)local_8;
          dVar5 = (double)(int)local_8;
          if ((int)local_8 < 0) {
            dVar5 = dVar5 + 4294967296.0;
          }
          param_6 = FUN_10086139(*(undefined4 *)(*(int *)(in_ECX + 8) + 0x78),0,0,-dVar5);
          if (param_6 == 0xffffffff) {
            return -0x7ff8fff2;
          }
          param_7 = (uint *)0xffffffff;
          iVar6 = FUN_1006e308(param_1,0x20400001,&param_7,&param_8,&param_6,4);
          if (iVar6 < 0) {
            return iVar6;
          }
          param_8 = param_7;
        }
        if (*(int *)(*(int *)(in_ECX + 8) + 0x30) != 0) {
          param_7 = (uint *)0xffffffff;
          iVar6 = FUN_1006e308(param_1,0x10000001,&param_7,&param_8,0,4);
          if (iVar6 < 0) {
            return iVar6;
          }
          param_8 = param_7;
          *(undefined4 *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + (int)param_7 * 4) + 4) =
               *(undefined4 *)(*(int *)(in_ECX + 8) + 0x8c);
        }
        if (*(int *)(in_ECX + 0x48) == -1) {
          iVar6 = FUN_100860e0(&DAT_1010e8c0,0x751,4,4);
          *(int *)(in_ECX + 0x48) = iVar6;
          if (iVar6 == -1) {
            return -0x7ff8fff2;
          }
          uVar9 = 0;
          do {
            uVar8 = 0;
            do {
              if (uVar9 == uVar8) {
                uVar10 = 0x3ff0000000000000;
              }
              else {
                uVar10 = 0;
              }
              iVar6 = FUN_10086139(*(undefined4 *)(in_ECX + 0x48),uVar9,uVar8,uVar10);
              if (iVar6 == -1) {
                return -0x7ff8fff2;
              }
              uVar8 = uVar8 + 1;
            } while (uVar8 < 4);
            uVar9 = uVar9 + 1;
          } while (uVar9 < 4);
        }
        uVar9 = 0;
        if (param_5 != 0) {
          do {
            iVar6 = FUN_10086139(*(undefined4 *)(in_ECX + 0x48),0,uVar9,0);
            local_48[uVar9] = iVar6;
            if (iVar6 == -1) {
              return -0x7ff8fff2;
            }
            puVar4 = *(undefined4 **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + iVar6 * 4);
            *(undefined8 *)(puVar4 + 8) = 0;
            uVar9 = uVar9 + 1;
            *(undefined8 *)(puVar4 + 10) = 0x3ff0000000000000;
            puVar4[2] = param_8;
            *puVar4 = 0x117;
          } while (uVar9 < param_5);
        }
      }
      uVar9 = 0;
      if (param_3 != 0) {
        do {
          param_2[uVar9] = *(int *)(in_ECX + 0x24);
          uVar9 = uVar9 + 1;
        } while (uVar9 < param_3);
      }
      param_6 = 0;
      if (param_5 == 0) {
        return 0;
      }
      param_7 = local_48;
      param_4 = param_4 + local_8 * param_3;
      while( true ) {
        if (param_3 != 0) {
          piVar7 = param_2;
          uVar9 = param_3;
          do {
            *(uint *)((local_44 - (int)param_2) + (int)piVar7) = *param_7;
            *(int *)((local_40 - (int)param_2) + (int)piVar7) = *piVar7;
            piVar7 = piVar7 + 1;
            uVar9 = uVar9 - 1;
          } while (uVar9 != 0);
        }
        iVar6 = FUN_1006c566(param_2,param_3);
        if (iVar6 < 0) {
          return iVar6;
        }
        uVar9 = *(uint *)(*(int *)(in_ECX + 8) + 0x6c);
        if (((char)uVar9 < '\0') && ((uVar9 & 4) == 0)) {
          iVar6 = FUN_1007041a(param_1,param_2,local_40,param_4,local_44,param_3);
        }
        else {
          iVar6 = FUN_1006e308(param_1,param_3 & 0xfffff | 0x20500000,param_2,local_44,param_4,0);
          if (iVar6 < 0) {
            return iVar6;
          }
          iVar6 = FUN_1006e308(param_1,param_3 & 0xfffff | 0x20400000,param_2,param_2,local_40,0);
        }
        if (iVar6 < 0) break;
        param_6 = param_6 + 1;
        param_7 = param_7 + 1;
        param_4 = param_4 + param_3;
        if (param_5 <= param_6) {
          return 0;
        }
      }
      return iVar6;
    }
    if (*(int *)(in_ECX + 0x58) != 0) {
      *(undefined4 *)(in_ECX + 0x60) = 1;
      return -0x7fffbffb;
    }
  }
  else if ((*(int *)(in_ECX + 0x58) != 0) && (*(int *)(in_ECX + 0x44) != 0)) {
    return -0x7fffbffb;
  }
LAB_10079bff:
  FUN_1006dca1();
  return -0x7fffbffb;
}


