// 1006e308 size=2070 FUN_1006e308

int FUN_1006e308(uint param_1,uint param_2,int param_3,int *param_4,uint *param_5,uint param_6)

{
  uint uVar1;
  uint *puVar2;
  uint uVar3;
  uint uVar4;
  int iVar5;
  int in_ECX;
  undefined4 *puVar6;
  uint *puVar7;
  int iVar8;
  uint *puVar9;
  int *piVar10;
  bool bVar11;
  undefined4 uVar12;
  undefined4 *local_24 [3];
  int local_18;
  int local_14;
  uint local_10;
  undefined4 *local_c;
  uint local_8;
  
  uVar4 = param_2;
  if (((param_2 & 0xfff00000) == 0x20500000) && ((param_6 & 4) != 0)) {
    uVar3 = param_2 & 0xfffff;
    param_2 = 0;
    if (uVar3 != 0) {
      local_8 = (int)param_5 - (int)param_4;
      piVar10 = param_4;
      do {
        if ((*piVar10 != *(int *)(local_8 + (int)piVar10)) ||
           ((**(byte **)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + *piVar10 * 4) & 1) == 0)) break;
        param_2 = param_2 + 1;
        piVar10 = piVar10 + 1;
      } while (param_2 < uVar3);
    }
    if (param_2 == uVar3) {
      uVar4 = uVar3 | 0x10000000;
    }
  }
  if (uVar4 == 0x50000001) {
    uVar12 = 0x20500001;
LAB_1006e421:
    iVar5 = FUN_1006e308(param_1,uVar12,param_3,param_4,CONCAT44(param_6,param_5));
    if (-1 < iVar5) {
      return 0;
    }
    return iVar5;
  }
  if ((uVar4 == 0x50000002) && ((*(byte *)(*(int *)(in_ECX + 8) + 0x6c) & 0x20) == 0)) {
    local_14 = -1;
    local_10 = 0xffffffff;
    iVar5 = FUN_1006e308(param_1,0x20500001,&local_14,param_4,param_5,param_6 & 0x40);
    if (iVar5 < 0) {
      return iVar5;
    }
    iVar5 = FUN_1006e308(param_1,0x20500001,&local_10,param_4 + 1,param_5 + 1,param_6 & 0x40);
    if (iVar5 < 0) {
      return iVar5;
    }
    param_5 = &local_10;
    param_4 = &local_14;
    uVar12 = 0x20400001;
    goto LAB_1006e421;
  }
  if (((*(byte *)(*(int *)(in_ECX + 8) + 0x6c) & 0x80) != 0) &&
     ((((local_10 = uVar4 & 0xfff00000, local_10 == 0x20000000 || (local_10 == 0x20100000)) ||
       (local_10 == 0x20200000)) || (local_10 == 0x20300000)))) {
    uVar4 = uVar4 & 0xfffff;
    local_c = operator_new(uVar4 << 4);
    if (local_c == (undefined4 *)0x0) {
      return -0x7ff8fff2;
    }
    uVar3 = 0;
    puVar6 = local_c;
    do {
      local_24[uVar3] = puVar6;
      uVar3 = uVar3 + 1;
      puVar6 = puVar6 + uVar4;
    } while (uVar3 < 4);
    if (uVar4 != 0) {
      iVar5 = (int)param_4 - (int)local_24[2];
      iVar8 = (int)param_5 - (int)local_24[2];
      local_18 = local_18 - (int)local_24[2];
      local_8 = uVar4;
      do {
        if (local_10 == 0x20000000) {
          *local_24[2] = *(undefined4 *)(iVar8 + (int)local_24[2]);
          uVar12 = *(undefined4 *)(iVar5 + (int)local_24[2]);
LAB_1006e50e:
          *(undefined4 *)(local_18 + (int)local_24[2]) = uVar12;
        }
        else {
          if (local_10 == 0x20100000) {
            *local_24[2] = *(undefined4 *)(iVar5 + (int)local_24[2]);
            uVar12 = *(undefined4 *)(iVar8 + (int)local_24[2]);
            goto LAB_1006e50e;
          }
          if (local_10 == 0x20200000) {
            *local_24[2] = *(undefined4 *)(in_ECX + 0x24);
            uVar12 = *(undefined4 *)(in_ECX + 0x20);
            goto LAB_1006e50e;
          }
          if (local_10 == 0x20300000) {
            *local_24[2] = *(undefined4 *)(in_ECX + 0x20);
            uVar12 = *(undefined4 *)(in_ECX + 0x24);
            goto LAB_1006e50e;
          }
        }
        local_24[2] = local_24[2] + 1;
        local_8 = local_8 - 1;
      } while (local_8 != 0);
    }
    iVar5 = FUN_1006c566(local_24[0],uVar4);
    if ((-1 < iVar5) && (iVar5 = FUN_1006c566(local_24[1],uVar4), -1 < iVar5)) {
      iVar5 = FUN_1006e308(param_1,uVar4 | 0x10100000,local_24[0],param_5,0,param_6 & 0x40);
      if ((-1 < iVar5) &&
         ((iVar5 = FUN_1006e308(param_1,uVar4 | 0x20400000,local_24[1],param_4,local_24[0],
                                param_6 & 0x40), -1 < iVar5 &&
          (iVar5 = FUN_1006e308(param_1,uVar4 | 0x30000000,param_3,local_24[1],local_c + uVar4 * 2,
                                param_6), -1 < iVar5)))) {
        iVar5 = 0;
      }
    }
    _free(local_c);
    return iVar5;
  }
  local_c = (undefined4 *)in_ECX;
  local_8 = FUN_10086199(uVar4,0xffffffff,0xffffffff);
  if (local_8 < *(uint *)(*(int *)(in_ECX + 8) + 0xc)) {
    puVar9 = *(uint **)(*(int *)(*(int *)(in_ECX + 8) + 0x18) + local_8 * 4);
  }
  else {
    puVar9 = (uint *)0x0;
  }
  if (puVar9 == (uint *)0x0) {
    return -0x7ff8fff2;
  }
  if ((puVar9[3] == 0) && (puVar9[1] == 0)) {
    *puVar9 = 0;
    return 0;
  }
  uVar4 = FUN_10085b72(0,0);
  uVar3 = FUN_100853cf(0,0);
  local_10 = uVar3 * 4;
  iVar5 = puVar9[1] - uVar3;
  piVar10 = (int *)puVar9[2];
  for (uVar3 = uVar3 & 0x3fffffff; uVar3 != 0; uVar3 = uVar3 - 1) {
    *piVar10 = *param_4;
    param_4 = param_4 + 1;
    piVar10 = piVar10 + 1;
  }
  for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
    *(char *)piVar10 = (char)*param_4;
    param_4 = (int *)((int)param_4 + 1);
    piVar10 = (int *)((int)piVar10 + 1);
  }
  puVar7 = (uint *)(puVar9[2] + local_10);
  for (; iVar5 != 0; iVar5 = iVar5 + -1) {
    *puVar7 = *param_5;
    param_5 = param_5 + 1;
    puVar7 = puVar7 + 1;
  }
  uVar3 = 0;
  if (puVar9[1] != 0) {
    do {
      uVar1 = *(uint *)(puVar9[2] + uVar3 * 4);
      if (uVar1 < *(uint *)(*(int *)((int)local_c + 8) + 8)) {
        iVar5 = *(int *)(*(int *)(*(int *)((int)local_c + 8) + 0x14) + uVar1 * 4);
      }
      else {
        iVar5 = 0;
      }
      if (iVar5 != 0) {
        *(int *)(iVar5 + 0x5c) = *(int *)(iVar5 + 0x5c) + 1;
      }
      uVar3 = uVar3 + 1;
    } while (uVar3 < puVar9[1]);
  }
  param_5 = (uint *)0x0;
  if (uVar4 != 0) {
    do {
      param_4 = (int *)0x0;
      if ((param_3 != 0) && (uVar3 = *(uint *)(param_3 + (int)param_5 * 4), uVar3 != 0xffffffff)) {
        if (uVar3 < *(uint *)(*(int *)((int)local_c + 8) + 8)) {
          param_4 = *(int **)(*(int *)(*(int *)((int)local_c + 8) + 0x14) + uVar3 * 4);
        }
        else {
          param_4 = (int *)0x0;
        }
        if (param_4 == (int *)0x0) {
          FUN_1006dca1(local_c,0,0,"internal error: result register invalid");
          return -0x7fffbffb;
        }
      }
      local_10 = FUN_10086139(*(undefined4 *)(*(int *)((int)local_c + 8) + 0x88),0,0,0);
      if (local_10 == 0xffffffff) {
        return -0x7ff8fff2;
      }
      if (local_10 < *(uint *)(*(int *)((int)local_c + 8) + 8)) {
        puVar7 = *(uint **)(*(int *)(*(int *)((int)local_c + 8) + 0x14) + local_10 * 4);
      }
      else {
        puVar7 = (uint *)0x0;
      }
      if (puVar7 == (uint *)0x0) {
        return -0x7ff8fff2;
      }
      *puVar7 = param_6;
      puVar7[0x12] = local_8;
      puVar7[4] = (uint)param_5;
      if ((param_6 & 0xe000000) == 0) {
        *puVar7 = *(uint *)((int)local_c + 100) | param_6;
      }
      puVar7[5] = *(uint *)((int)local_c + 0x30);
      puVar7[6] = *(uint *)((int)local_c + 0x34);
      iVar5 = (int)param_5 * 4;
      *(uint *)(iVar5 + puVar9[4]) = local_10;
      if (param_3 != 0) {
        *(uint *)(iVar5 + param_3) = local_10;
      }
      if (param_4 != (int *)0x0) {
        puVar7[0xc] = *(uint *)((int)param_4 + 0x30);
        puVar7[0x18] = *(uint *)((int)param_4 + 0x60);
        puVar7[0x19] = *(uint *)((int)param_4 + 100);
      }
      if ((puVar7[0xc] != 0xffffffff) &&
         (*(undefined4 *)(*(int *)((int)local_c + 0x18) + puVar7[0xc] * 4) =
               *(undefined4 *)(iVar5 + puVar9[4]), puVar7[0x18] == 0)) {
        FUN_1006dca1(local_c,0,0,"internal error: argument missing context (A%u)");
      }
      param_5 = (uint *)((int)param_5 + 1);
    } while (param_5 < uVar4);
  }
  uVar3 = 0;
  if (uVar4 != 0) {
    do {
      FUN_1006c8ca(*(undefined4 *)(puVar9[4] + uVar3 * 4),0);
      uVar3 = uVar3 + 1;
    } while (uVar3 < uVar4);
  }
  if (((*(byte *)((int)local_c + 0x14) & 4) == 0) && (iVar5 = FUN_10085604(), iVar5 == 0)) {
    uVar3 = 0;
    bVar11 = uVar4 == 0;
    if (uVar4 != 0) {
      do {
        iVar5 = *(int *)(puVar9[4] + uVar3 * 4);
        if (((**(byte **)(*(int *)(*(int *)((int)local_c + 8) + 0x14) + iVar5 * 4) & 0x40) != 0) ||
           (iVar5 = FUN_1006e16c(iVar5,&local_14), iVar5 < 0)) break;
        uVar3 = uVar3 + 1;
      } while (uVar3 < uVar4);
      bVar11 = uVar3 == uVar4;
    }
    if (bVar11) {
      *puVar9 = uVar4 & 0xfffff | 0x10000000;
      uVar3 = 0;
      puVar9[1] = puVar9[3];
      if (uVar4 != 0) {
        do {
          uVar12 = FUN_10086139(*(undefined4 *)(*(int *)((int)local_c + 8) + 0x78),0,0,
                                *(undefined8 *)
                                 (*(int *)(*(int *)(*(int *)((int)local_c + 8) + 0x14) +
                                          *(int *)(puVar9[4] + uVar3 * 4) * 4) + 0x20));
          *(undefined4 *)(puVar9[2] + uVar3 * 4) = uVar12;
          if (*(int *)(puVar9[2] + uVar3 * 4) == -1) {
            return -0x7ff8fff2;
          }
          uVar3 = uVar3 + 1;
        } while (uVar3 < uVar4);
      }
    }
  }
  uVar3 = *puVar9 & 0xfff00000;
  if (uVar3 < 0x20500001) {
    if (uVar3 != 0x20500000) {
      if (uVar3 == 0x10000000) {
        param_6 = 0;
        if (uVar4 != 0) {
          do {
            iVar5 = *(int *)(*(int *)((int)local_c + 8) + 0x14);
            puVar7 = *(uint **)(iVar5 + *(int *)(param_6 * 4 + puVar9[4]) * 4);
            uVar3 = *(uint *)(param_6 * 4 + puVar9[2]);
            puVar2 = *(uint **)(iVar5 + uVar3 * 4);
            puVar7[0xd] = uVar3;
            *puVar7 = *puVar7 | *puVar2;
            *(undefined8 *)(puVar7 + 8) = *(undefined8 *)(puVar2 + 8);
            *(undefined8 *)(puVar7 + 10) = *(undefined8 *)(puVar2 + 10);
            param_6 = param_6 + 1;
          } while (param_6 < uVar4);
        }
        goto LAB_1006eb09;
      }
      if (uVar3 == 0x10100000) {
        param_6 = 0;
        if (uVar4 != 0) {
          do {
            iVar5 = *(int *)(*(int *)((int)local_c + 8) + 0x14);
            puVar7 = *(uint **)(iVar5 + *(int *)(param_6 * 4 + puVar9[4]) * 4);
            *puVar7 = *puVar7 | **(uint **)(iVar5 + *(int *)(param_6 * 4 + puVar9[2]) * 4) & 2;
            param_6 = param_6 + 1;
          } while (param_6 < uVar4);
        }
        goto LAB_1006eb09;
      }
      if ((uVar3 != 0x20000000) && (uVar3 != 0x20100000)) {
        if ((uVar3 == 0x20400000) && (param_6 = 0, uVar4 != 0)) {
          do {
            iVar5 = *(int *)(*(int *)((int)local_c + 8) + 0x14);
            puVar7 = *(uint **)(iVar5 + *(int *)(param_6 * 4 + puVar9[4]) * 4);
            *puVar7 = *puVar7 | **(uint **)(iVar5 + *(int *)(puVar9[2] + (puVar9[3] + param_6) * 4)
                                                    * 4) &
                                **(uint **)(iVar5 + *(int *)(param_6 * 4 + puVar9[2]) * 4) & 2;
            param_6 = param_6 + 1;
          } while (param_6 < uVar4);
        }
        goto LAB_1006eb09;
      }
    }
  }
  else if ((uVar3 != 0x20700000) && (uVar3 != 0x20800000)) {
    if (uVar3 == 0x30000000) {
      param_4 = (int *)0x0;
      if (uVar4 != 0) {
        do {
          iVar5 = *(int *)(*(int *)((int)local_c + 8) + 0x14);
          puVar7 = *(uint **)(iVar5 + *(int *)(puVar9[4] + (int)param_4 * 4) * 4);
          uVar3 = **(uint **)(iVar5 + *(int *)(puVar9[2] + ((int)param_4 + puVar9[3] * 2) * 4) * 4)
                  & **(uint **)(iVar5 + *(int *)(puVar9[2] + ((int)param_4 + puVar9[3]) * 4) * 4);
          if ((uVar3 & 1) == 0) {
            if ((uVar3 & 2) != 0) {
              *puVar7 = *puVar7 | 2;
            }
          }
          else {
            *puVar7 = *puVar7 | 0x17;
          }
          param_4 = (int *)((int)param_4 + 1);
        } while (param_4 < uVar4);
      }
    }
    else if (uVar3 == 0x50000000) {
      puVar7 = *(uint **)(*(int *)(*(int *)((int)local_c + 8) + 0x14) + *(int *)puVar9[4] * 4);
      param_6 = 0;
      if (uVar4 != 0) {
        param_4 = (int *)puVar9[2];
        iVar5 = *(int *)(*(int *)((int)local_c + 8) + 0x14);
        piVar10 = param_4 + puVar9[3];
        do {
          if ((**(uint **)(iVar5 + *param_4 * 4) & **(uint **)(iVar5 + *piVar10 * 4) & 2) == 0)
          break;
          param_6 = param_6 + 1;
          param_4 = param_4 + 1;
          piVar10 = piVar10 + 1;
        } while (param_6 < uVar4);
      }
      if (param_6 == uVar4) {
        *puVar7 = *puVar7 | 2;
      }
    }
    goto LAB_1006eb09;
  }
  param_6 = 0;
  if (uVar4 != 0) {
    do {
      iVar5 = *(int *)(*(int *)((int)local_c + 8) + 0x14);
      puVar7 = *(uint **)(iVar5 + *(int *)(param_6 * 4 + puVar9[4]) * 4);
      uVar3 = **(uint **)(iVar5 + *(int *)(puVar9[2] + (puVar9[3] + param_6) * 4) * 4) &
              **(uint **)(iVar5 + *(int *)(param_6 * 4 + puVar9[2]) * 4);
      if ((uVar3 & 1) == 0) {
        if ((uVar3 & 2) != 0) {
          *puVar7 = *puVar7 | 2;
        }
      }
      else {
        *puVar7 = *puVar7 | 0x17;
      }
      param_6 = param_6 + 1;
    } while (param_6 < uVar4);
  }
LAB_1006eb09:
  puVar9[0xf] = param_1;
  puVar9[0xe] = *(uint *)((int)local_c + 0x38);
  return 0;
}


