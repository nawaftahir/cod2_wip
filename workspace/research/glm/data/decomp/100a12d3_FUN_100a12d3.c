// 100a12d3 size=2341 FUN_100a12d3

int FUN_100a12d3(int param_1,uint *param_2,uint param_3,int param_4)

{
  uint *puVar1;
  uint *puVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined4 uVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  undefined4 uVar10;
  int extraout_ECX;
  char *pcVar11;
  undefined8 uVar12;
  char *pcVar13;
  char *local_4c [4];
  char *local_3c;
  char *local_38;
  char *local_34 [4];
  char *local_24;
  char *local_20;
  int local_1c;
  uint local_18;
  int local_14;
  int local_10;
  int local_c;
  int local_8;
  
  local_34[0] = "global variables";
  local_34[1] = "structure members";
  local_34[2] = "function parameters";
  local_34[3] = "local variables";
  local_24 = "loop control variables";
  local_20 = "annotation members";
  local_4c[0] = "initial value";
  local_4c[1] = "initializer";
  local_4c[2] = "default value";
  local_4c[3] = "initial value";
  local_3c = "initial value";
  local_38 = "value";
  local_1c = FUN_10099913();
  if (local_1c == 0) {
    return 0;
  }
  if (*(int *)(extraout_ECX + 0x10) == 0) {
    return 0;
  }
  if (param_1 == 0) {
    return 0;
  }
  local_18 = *(uint *)(local_1c + 0x18);
  iVar3 = FUN_1006506e(0x14);
  if (iVar3 == 0) {
    local_10 = 0;
  }
  else {
    local_10 = FUN_10082872(0,0,"Stmts");
  }
  if (local_10 == 0) {
    return 0;
  }
  iVar3 = FUN_1006506e(0x30);
  if (iVar3 == 0) {
    iVar3 = 0;
  }
  else {
    iVar3 = FUN_10082c4b(1,0,0,0);
  }
  if (iVar3 == 0) {
    return 0;
  }
  *(int *)(local_10 + 8) = iVar3;
  local_c = iVar3;
  iVar4 = FUN_1006506e(0x40);
  if (iVar4 == 0) {
    iVar4 = 0;
  }
  else {
    iVar4 = FUN_1008300b();
  }
  if (iVar4 == 0) {
    return 0;
  }
  *(int *)(iVar3 + 0x18) = iVar4;
  if (param_3 != 0) {
    iVar5 = FUN_10082816(param_3);
    *(int *)(iVar3 + 0x1c) = iVar5;
    if (iVar5 == 0) {
      return 0;
    }
  }
  if (param_2 != (uint *)0x0) {
    iVar5 = FUN_10082816(param_2);
    *(int *)(iVar4 + 0x30) = iVar5;
    if (iVar5 == 0) {
      return 0;
    }
    do {
      iVar5 = *(int *)((int)param_2 + 8);
      if ((iVar5 != 0) && (*(int *)(iVar5 + 4) == 3)) {
        iVar5 = FUN_10082816(iVar5);
        *(int *)(iVar4 + 0x2c) = iVar5;
        if (iVar5 == 0) {
          return 0;
        }
      }
      param_2 = *(uint **)((int)param_2 + 0xc);
    } while (param_2 != (uint *)0x0);
  }
  if ((param_4 != 0) && (*(int *)(param_4 + 4) != 0xd)) {
    uVar6 = FUN_1009c04f();
    *(undefined4 *)(iVar4 + 0x24) = uVar6;
  }
  param_3 = 1;
  param_2 = (uint *)0x0;
  local_14 = 0;
  if (local_18 != 0) {
    iVar5 = FUN_10082816(local_18);
    *(int *)(iVar4 + 0x20) = iVar5;
    if (iVar5 == 0) {
      return 0;
    }
  }
  iVar5 = *(int *)(param_1 + 4);
  while (iVar5 != 3) {
    iVar3 = FUN_1006506e(0x18);
    if (iVar3 == 0) {
      iVar3 = 0;
    }
    else {
      iVar3 = FUN_10082d9b();
    }
    if (iVar3 == 0) {
      return 0;
    }
    if (param_2 != (uint *)0x0) {
      local_14 = 0xc01;
    }
    *(undefined4 *)(iVar3 + 0x10) = *(undefined4 *)(iVar4 + 0x20);
    puVar1 = (uint *)(iVar3 + 0x14);
    puVar2 = puVar1;
    if (*(int *)(param_1 + 0xc) == 0) {
LAB_100a14ce:
      param_2 = puVar2;
      *puVar1 = 1;
    }
    else {
      iVar5 = FUN_100a07e3();
      if (iVar5 < 0) {
        local_14 = 0xbf2;
        puVar2 = param_2;
        goto LAB_100a14ce;
      }
    }
    param_3 = *puVar1 * param_3;
    *(int *)(iVar4 + 0x20) = iVar3;
    param_1 = *(int *)(param_1 + 8);
    iVar3 = local_c;
    iVar5 = *(int *)(param_1 + 4);
  }
  iVar5 = FUN_10082816(param_1);
  *(int *)(iVar3 + 0x14) = iVar5;
  if (iVar5 == 0) {
    return 0;
  }
  iVar3 = *(int *)(*(int *)(local_8 + 0x10) + 0x10);
  iVar5 = param_1 + 0x10;
  if (local_14 == 0xbf2) {
    uVar6 = *(undefined4 *)(param_1 + 0x18);
    uVar12 = 0x1011514800000bf2;
LAB_100a1be3:
    FUN_100994dd(local_8,iVar5,uVar12,uVar6);
    return 0;
  }
  if (local_14 == 0xc01) {
    uVar6 = *(undefined4 *)(param_1 + 0x18);
    uVar12 = 0x101153bc00000c01;
    goto LAB_100a1be3;
  }
  if (param_2 != (uint *)0x0) {
    if ((((iVar3 != 0) && (iVar3 != 3)) && (iVar3 != 4)) && (iVar3 != 5)) {
      pcVar11 = local_34[iVar3];
      uVar12 = CONCAT44(*(undefined4 *)(param_1 + 0x18),
                        "\'%s\': array dimensions of %s must be explicit");
      uVar6 = 0xc00;
      goto LAB_100a1559;
    }
    iVar7 = FUN_10099b4f(local_18);
    local_18 = iVar7 * param_3;
    if (iVar7 * param_3 == 0) {
      *param_2 = 0;
      param_3 = 0;
    }
    else {
      iVar7 = *(int *)(iVar4 + 0x24);
      if ((iVar7 == 0) || (*(int *)(iVar7 + 4) != 0xd)) {
        pcVar11 = local_4c[iVar3];
        uVar12 = CONCAT44(*(undefined4 *)(param_1 + 0x18),"\'%s\': implicit array missing %s");
        uVar6 = 0xc02;
LAB_100a1559:
        FUN_100994dd(local_8,iVar5,uVar6,uVar12,pcVar11);
        return 0;
      }
      uVar8 = FUN_10099b4f(*(undefined4 *)(iVar7 + 0x10));
      if (uVar8 % local_18 != 0) {
        pcVar11 = local_4c[iVar3];
        uVar12 = CONCAT44(*(undefined4 *)(param_1 + 0x18),
                          "\'%s\': implicit array type does not match %s");
        uVar6 = 0xc03;
        goto LAB_100a1559;
      }
      *param_2 = uVar8 / local_18;
      param_3 = (uVar8 / local_18) * param_3;
    }
  }
  if ((param_3 == 0) || (0x10000 < param_3)) {
    uVar6 = *(undefined4 *)(param_1 + 0x18);
    uVar12 = 0x101151b400000bf3;
    goto LAB_100a1be3;
  }
  iVar7 = FUN_10099b4f(*(undefined4 *)(iVar4 + 0x20));
  *(int *)(iVar4 + 0x14) = iVar7;
  *(undefined4 *)(iVar4 + 0x18) = *(undefined4 *)(*(int *)(local_8 + 0x10) + 0x10);
  if (*(int *)(*(int *)(local_8 + 0x10) + 0x10) == 1) {
    *(undefined4 *)(iVar4 + 0x10) = 0xffffffff;
  }
  else {
    *(undefined4 *)(iVar4 + 0x10) = *(undefined4 *)(local_8 + 0x58);
    *(int *)(local_8 + 0x58) = *(int *)(local_8 + 0x58) + iVar7;
  }
  param_3 = *(uint *)(local_1c + 0x10);
  if (*(int *)(local_1c + 0x14) != 0) {
    FUN_100994dd(local_8,iVar5,0xbdf,"\'%s\': %s cannot be target specific",
                 *(undefined4 *)(param_1 + 0x18),local_34[iVar3]);
  }
  if ((param_3 & 0x100) != 0) {
    FUN_100994dd(local_8,iVar5,0xbef,"\'%s\': %s cannot be declared \'inline\'",
                 *(undefined4 *)(param_1 + 0x18),local_34[iVar3]);
  }
  if (iVar3 == 1) {
    iVar7 = FUN_10099a41(*(undefined4 *)(iVar4 + 0x20));
    if (iVar7 != 0) {
      FUN_100994dd(local_8,iVar5,0xbdb,"\'%s\': %s cannot be declared \'const\'",
                   *(undefined4 *)(param_1 + 0x18),"structure members");
      goto LAB_100a16b0;
    }
LAB_100a1794:
    if ((((param_3 & 2) != 0) && (iVar3 != 3)) && (iVar3 != 4)) {
      FUN_100994dd(local_8,iVar5,0xbbf,"\'%s\': %s cannot be declared \'static\'",
                   *(undefined4 *)(param_1 + 0x18),local_34[iVar3]);
      param_3 = param_3 & 0xfffffffd;
    }
    if ((param_3 & 0x40) != 0) {
      if (iVar3 != 2) {
        FUN_100994dd(local_8,iVar5,0xbe7,"\'%s\': %s cannot be declared \'uniform\'",
                     *(undefined4 *)(param_1 + 0x18),local_34[iVar3]);
        param_3 = param_3 & 0xffffffbf;
      }
      if (((param_3 & 0x40) != 0) && ((param_3 & 0x20) != 0)) {
        FUN_100994dd(local_8,iVar5,0xbf6,"\'%s\': %s cannot be declared \'uniform out\'",
                     *(undefined4 *)(param_1 + 0x18),local_34[iVar3]);
        param_3 = param_3 & 0xffffffbf;
      }
    }
    if ((param_3 & 1) != 0) {
      FUN_100994dd(local_8,iVar5,0xbbe,"\'%s\': %s cannot be declared \'extern\'",
                   *(undefined4 *)(param_1 + 0x18),local_34[iVar3]);
      param_3 = param_3 & 0xfffffffe;
    }
    if ((param_3 & 8) != 0) {
      FUN_100994dd(local_8,iVar5,0xbee,"\'%s\': %s cannot be declared \'shared\'",
                   *(undefined4 *)(param_1 + 0x18),local_34[iVar3]);
      param_3 = param_3 & 0xfffffff7;
    }
  }
  else {
LAB_100a16b0:
    if (iVar3 == 2) {
      if (((param_3 & 0x10) != 0) ||
         (iVar7 = FUN_10099a41(*(undefined4 *)(iVar4 + 0x20)), iVar7 == 0)) goto LAB_100a1794;
      FUN_100994dd(local_8,iVar5,0xbe6,"\'%s\': output paramaters cannot be declared \'const\'",
                   *(undefined4 *)(param_1 + 0x18));
    }
    if (((iVar3 == 3) || (iVar3 == 4)) &&
       (iVar7 = FUN_10099ad8(*(undefined4 *)(iVar4 + 0x20)), iVar7 == 0)) {
      FUN_100994dd(local_8,iVar5,0xbde,"\'%s\': %s must be numeric",*(undefined4 *)(param_1 + 0x18),
                   local_34[iVar3]);
    }
    if (iVar3 != 0) goto LAB_100a1794;
    if ((param_3 & 2) == 0) {
LAB_100a178b:
      param_3 = param_3 | 0x41;
    }
    else {
      if ((param_3 & 1) != 0) {
        FUN_100994dd(local_8,iVar5,0xbbf,"\'%s\': extern %s cannot be declared \'static\'",
                     *(undefined4 *)(param_1 + 0x18),"global variables");
        param_3 = param_3 & 0xfffffffd;
      }
      if ((param_3 & 2) == 0) goto LAB_100a178b;
      if ((param_3 & 0x40) != 0) {
        FUN_100994dd(local_8,iVar5,0xbbf,"\'%s\': uniform %s cannot be declared \'static\'",
                     *(undefined4 *)(param_1 + 0x18),"global variables");
        param_3 = param_3 & 0xfffffffd;
      }
      if ((param_3 & 2) == 0) goto LAB_100a178b;
    }
  }
  if (((((param_3 & 4) != 0) && (iVar3 != 3)) && (iVar3 != 4)) && (iVar3 != 2)) {
    FUN_100994dd(local_8,iVar5,0xbc0,"\'%s\': %s cannot be declared \'volatile\'",
                 *(undefined4 *)(param_1 + 0x18),local_34[iVar3]);
    param_3 = param_3 & 0xfffffffb;
  }
  if (iVar3 == 5) {
    FUN_1009991f();
    param_3 = param_3 | 0x40;
  }
  local_18 = 0;
  *(uint *)(iVar4 + 0x1c) = param_3;
  if (param_4 == 0) {
    if ((((iVar3 == 0) || (iVar3 == 3)) || (iVar3 == 4)) && ((param_3 & 2) != 0)) {
      uVar6 = FUN_1009bdcd(5,0,0,iVar5);
      goto LAB_100a194f;
    }
  }
  else {
    if (*(int *)(param_4 + 4) == 0xd) {
      uVar6 = 0;
      iVar7 = param_4;
    }
    else {
      iVar7 = *(int *)(iVar4 + 0x24);
      if (iVar7 == 0) {
        param_4 = 0;
      }
      else {
        param_4 = *(undefined4 *)(iVar7 + 0x10);
      }
      iVar9 = FUN_10099b4f(param_4);
      uVar6 = 1;
      if (*(int *)(iVar4 + 0x14) != iVar9) {
        FUN_1009b99e(iVar5,*(undefined4 *)(param_1 + 0x18),*(undefined4 *)(iVar4 + 0x20),param_4,1);
        *(undefined4 *)(iVar4 + 0x24) = 0;
        goto LAB_100a1952;
      }
    }
    uVar6 = FUN_1009e8bf(*(undefined4 *)(iVar4 + 0x20),iVar7,uVar6);
LAB_100a194f:
    *(undefined4 *)(iVar4 + 0x24) = uVar6;
  }
LAB_100a1952:
  if (*(int *)(iVar4 + 0x24) == 0) {
    if (iVar3 == 0) {
      iVar7 = FUN_10099a41(*(undefined4 *)(iVar4 + 0x20));
      if (iVar7 == 0) goto LAB_100a1b51;
      if ((param_3 & 2) == 0) goto LAB_100a1ae1;
    }
    else {
LAB_100a1ae1:
      if ((((iVar3 != 3) && (iVar3 != 4)) ||
          (iVar7 = FUN_10099a41(*(undefined4 *)(iVar4 + 0x20)), iVar7 == 0)) && (iVar3 != 5))
      goto LAB_100a1b1c;
    }
    FUN_100994dd(local_8,iVar5,0xbc4,"\'%s\': missing %s",*(undefined4 *)(param_1 + 0x18),
                 local_4c[iVar3]);
LAB_100a1b1c:
    if ((((iVar3 == 0) || (iVar3 == 1)) || (iVar3 == 2)) || (*(int *)(iVar4 + 0x2c) == 0))
    goto LAB_100a1b51;
    FUN_100994dd(local_8,iVar5,0xbe3,"\'%s\': %s cannot have semantics",
                 *(undefined4 *)(param_1 + 0x18),local_34[iVar3]);
  }
  else {
    if (iVar3 == 1) {
      pcVar13 = "initializer";
      uVar12 = CONCAT44("structure members",*(undefined4 *)(param_1 + 0x18));
      pcVar11 = "\'%s\': %s cannot have %ss";
    }
    else {
      if ((iVar3 != 2) || (iVar7 = FUN_10099ad8(*(undefined4 *)(iVar4 + 0x20)), iVar7 != 0)) {
        if (((param_3 & 0x10) == 0) && ((param_3 & 0x20) != 0)) {
          FUN_100994dd(local_8,iVar5,0xbe5,"\'%s\': output only %s cannot have %ss",
                       *(undefined4 *)(param_1 + 0x18),local_34[iVar3],local_4c[iVar3]);
        }
        else if (((param_3 & 0x50) == 0) ||
                (iVar7 = FUN_1009a44a(*(undefined4 *)(iVar4 + 0x24)), iVar7 != 0)) {
          iVar7 = FUN_1009b666(*(undefined4 *)(iVar4 + 0x20),
                               *(undefined4 *)(*(int *)(iVar4 + 0x24) + 0x10),0);
          if (iVar7 != 0) {
            if ((param_3 & 0x40) != 0) {
              uVar6 = FUN_100a06b8(*(undefined4 *)(iVar4 + 0x24));
              *(undefined4 *)(iVar4 + 0x28) = uVar6;
            }
            if (((param_3 & 0x50) == 0) &&
               (iVar7 = FUN_10099a41(*(undefined4 *)(iVar4 + 0x20)), iVar7 != 0)) {
              uVar6 = FUN_100a06b8(*(undefined4 *)(iVar4 + 0x24));
            }
            else {
              uVar6 = 0;
              if (((param_3 & 0x10) != 0) || ((param_3 & 0x40) == 0)) {
                uVar6 = *(undefined4 *)(iVar4 + 0x24);
                *(undefined4 *)(iVar4 + 0x24) = 0;
                uVar10 = FUN_1009e7b8();
                local_18 = FUN_100a0e06(0x14,uVar10,uVar6,1);
                goto LAB_100a1b1c;
              }
            }
            *(undefined4 *)(iVar4 + 0x24) = uVar6;
            goto LAB_100a1b1c;
          }
          FUN_1009b99e(iVar5,*(undefined4 *)(param_1 + 0x18),*(undefined4 *)(iVar4 + 0x20),
                       *(undefined4 *)(*(int *)(iVar4 + 0x24) + 0x10),0);
        }
        else {
          FUN_100994dd(local_8,iVar5,0xbc3,"\'%s\': %s must be a literal expression",
                       *(undefined4 *)(param_1 + 0x18),local_4c[iVar3]);
        }
        *(undefined4 *)(iVar4 + 0x24) = 0;
        goto LAB_100a1b1c;
      }
      pcVar13 = "default value";
      uVar12 = CONCAT44("function parameters",*(undefined4 *)(param_1 + 0x18));
      pcVar11 = "\'%s\': non-numeric uniform %s cannot have %ss";
    }
    FUN_100994dd(local_8,iVar5,0xbc1,pcVar11,uVar12,pcVar13);
  }
  *(undefined4 *)(iVar4 + 0x24) = 0;
LAB_100a1b51:
  if (((*(int *)(local_c + 0x1c) != 0) && (iVar3 != 0)) && (iVar3 != 2)) {
    FUN_100994dd(local_8,iVar5,0xbe0,"\'%s\': %s cannot have annotations",
                 *(undefined4 *)(param_1 + 0x18),local_34[iVar3]);
    *(undefined4 *)(local_c + 0x1c) = 0;
  }
  iVar3 = FUN_1009ab7f();
  if (iVar3 < 0) {
    return 0;
  }
  if (local_18 == 0) {
    return local_10;
  }
  iVar3 = FUN_1009a5b0(local_18);
  *(int *)(local_10 + 0xc) = iVar3;
  if (iVar3 == 0) {
    return 0;
  }
  return local_10;
}


