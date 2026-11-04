// 100a0e06 size=1049 FUN_100a0e06

int FUN_100a0e06(int param_1,int *param_2,int *param_3,undefined4 param_4)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  int in_ECX;
  undefined8 uVar5;
  undefined4 uVar6;
  char *pcVar7;
  int *local_18;
  int *local_14;
  int *local_10;
  int *local_c;
  int local_8;
  
  piVar1 = param_2;
  local_14 = (int *)0x0;
  local_18 = (int *)0x0;
  local_c = (int *)0x0;
  local_10 = (int *)0x0;
  if ((param_2 != (int *)0x0) && (param_2[1] != 0xd)) {
    return 0;
  }
  if (param_3 == (int *)0x0) {
    if (param_2 != (int *)0x0) goto LAB_100a0e45;
    param_2 = (int *)(in_ECX + 0x20);
  }
  else {
    param_2 = param_3;
    if (param_3[1] != 0xd) {
      return 0;
    }
LAB_100a0e45:
    param_2 = param_2 + 0xc;
  }
  local_8 = in_ECX;
  iVar2 = FUN_1006506e(0x50);
  if (iVar2 == 0) {
    iVar2 = 0;
  }
  else {
    iVar2 = FUN_10083255(0,param_1,0,0,param_4,param_2);
  }
  if (iVar2 == 0) {
    return 0;
  }
  if (piVar1 != (int *)0x0) {
    iVar3 = (**(code **)(*piVar1 + 4))();
    *(int *)(iVar2 + 0x20) = iVar3;
    if (iVar3 == 0) {
      return 0;
    }
  }
  iVar3 = 0x15;
  if ((((((param_1 == 0x1c) || (param_1 == 0x1d)) || (param_1 == 0x1e)) ||
       ((param_1 == 0x1f || (param_1 == 0x20)))) || (param_1 == 0x21)) || (param_1 == 0x22)) {
    if (param_1 == 0x1c) {
      piVar4 = (int *)0x7;
      param_1 = iVar3;
    }
    else if (param_1 == 0x1d) {
      piVar4 = (int *)0x8;
      param_1 = iVar3;
    }
    else if (param_1 == 0x1e) {
      piVar4 = (int *)0x9;
      param_1 = iVar3;
    }
    else if (param_1 == 0x1f) {
      piVar4 = (int *)0xa;
      param_1 = iVar3;
    }
    else if (param_1 == 0x20) {
      piVar4 = (int *)0xb;
      param_1 = iVar3;
    }
    else if (param_1 == 0x21) {
      piVar4 = (int *)0x2;
      param_1 = 1;
    }
    else {
      piVar4 = param_3;
      if (param_1 == 0x22) {
        piVar4 = (int *)0x3;
        param_1 = 1;
      }
    }
    iVar3 = FUN_100a0e06(piVar4,piVar1,param_3,0);
    *(int *)(iVar2 + 0x24) = iVar3;
    if (iVar3 == 0) {
      return 0;
    }
    *(int *)(iVar2 + 0x1c) = param_1;
  }
  else if (param_3 != (int *)0x0) {
    iVar3 = (**(code **)(*param_3 + 4))();
    *(int *)(iVar2 + 0x24) = iVar3;
    if (iVar3 == 0) {
      return 0;
    }
  }
  if (*(int *)(iVar2 + 0x20) != 0) {
    local_18 = *(int **)(*(int *)(iVar2 + 0x20) + 0x10);
    local_14 = local_18;
  }
  if ((((param_1 != 0) && (param_1 != 1)) &&
      ((param_1 != 0x14 && (((param_1 != 0x15 && (param_1 != 0x10)) && (param_1 != 0x11)))))) &&
     (((local_14 == (int *)0x0 || (local_14[1] != 9)) ||
      (iVar3 = FUN_10099ad8(local_14), iVar3 == 0)))) {
    pcVar7 = "scalar, vector, or matrix expected";
    uVar6 = 0xbce;
    goto LAB_100a1206;
  }
  piVar1 = local_14;
  if (((param_1 != 2) && (param_1 != 3)) && ((param_1 != 0x14 && (param_1 != 0x15)))) {
LAB_100a1007:
    if (*(int *)(iVar2 + 0x24) != 0) {
      local_10 = *(int **)(*(int *)(iVar2 + 0x24) + 0x10);
      local_c = local_10;
    }
    if ((param_1 == 0x14) || (param_1 == 0x15)) {
      iVar3 = FUN_1009b666(piVar1,local_c,0);
      if (iVar3 == 0) {
        FUN_1009b99e(param_2,0,piVar1,local_c,0);
        return 0;
      }
      if (piVar1 != (int *)0x0) {
        iVar3 = (**(code **)(*piVar1 + 4))();
        *(int *)(iVar2 + 0x10) = iVar3;
        if (iVar3 == 0) {
          return 0;
        }
      }
      local_10 = piVar1;
    }
    else if (param_1 == 0) {
      if (piVar1 != (int *)0x0) {
        iVar3 = (**(code **)(*piVar1 + 4))();
        *(int *)(iVar2 + 0x10) = iVar3;
        if (iVar3 == 0) {
          return 0;
        }
      }
    }
    else {
      if (((param_1 != 4) && (param_1 != 5)) &&
         ((param_1 != 6 && (((param_1 != 2 && (param_1 != 3)) && (param_1 != 1)))))) {
        if (((param_1 == 0xc) || (param_1 == 0xd)) ||
           (((param_1 == 0xe || ((param_1 == 0xf || (param_1 == 0x10)))) ||
            ((param_1 == 0x11 || ((param_1 == 0x12 || (param_1 == 0x13)))))))) {
          iVar3 = FUN_1009bccf(piVar1,local_c,&local_18,&local_10,(int *)(iVar2 + 0x10));
          if (-1 < iVar3) {
            *(undefined4 *)(*(int *)(iVar2 + 0x10) + 0x14) = 0;
            goto LAB_100a1162;
          }
        }
        else {
          iVar3 = FUN_1009bccf(piVar1,local_c,&local_18,&local_10,iVar2 + 0x10);
          if (-1 < iVar3) goto LAB_100a1162;
        }
        pcVar7 = "type mismatch";
        uVar6 = 0xbcc;
        goto LAB_100a1206;
      }
      if (piVar1 != (int *)0x0) {
        iVar3 = (**(code **)(*piVar1 + 4))();
        *(int *)(iVar2 + 0x10) = iVar3;
        if (iVar3 == 0) {
          return 0;
        }
      }
      FUN_1009991f(*(undefined4 *)(iVar2 + 0x10),1);
    }
LAB_100a1162:
    if ((*(int *)(iVar2 + 0x20) != 0) && (piVar1 != local_18)) {
      uVar5 = FUN_10099bdd(piVar1,local_18);
      if ((int)uVar5 == 0) {
        iVar3 = FUN_1009e8bf(local_18,(int)((ulonglong)uVar5 >> 0x20),0,0);
        if (iVar3 == 0) {
          return 0;
        }
        *(int *)(iVar2 + 0x20) = iVar3;
      }
    }
    if ((*(int *)(iVar2 + 0x24) != 0) && (local_c != local_10)) {
      uVar5 = FUN_10099bdd(local_c,local_10);
      if ((int)uVar5 == 0) {
        iVar3 = FUN_1009e8bf(local_10,(int)((ulonglong)uVar5 >> 0x20),0,0);
        if (iVar3 == 0) {
          return 0;
        }
        *(int *)(iVar2 + 0x24) = iVar3;
      }
    }
    if (*(int *)(iVar2 + 0x10) == 0) {
      *(undefined4 *)(iVar2 + 0x10) = 0;
    }
    FUN_1009a568(iVar2);
    iVar3 = FUN_1009a44a(iVar2);
    if (iVar3 != 0) {
      iVar3 = FUN_100a06b8(iVar2);
      if (iVar3 != 0) {
        return iVar3;
      }
      return iVar2;
    }
    return iVar2;
  }
  iVar3 = FUN_10099a41(local_14);
  if (iVar3 == 0) {
    uVar5 = FUN_1009a3ce(*(undefined4 *)(iVar2 + 0x20));
    if ((int)uVar5 == 0) {
      iVar3 = *(int *)(*(int *)((int)((ulonglong)uVar5 >> 0x20) + 0x10) + 0x10);
      if (((iVar3 == 3) || (iVar3 == 4)) && (iVar3 = FUN_10099ad8(piVar1), iVar3 == 0)) {
        pcVar7 = "object assignments are not allowed inside functions";
        uVar6 = 0xbf9;
        goto LAB_100a1206;
      }
      goto LAB_100a1007;
    }
  }
  pcVar7 = "l-value specifies const object";
  uVar6 = 0xbd1;
LAB_100a1206:
  FUN_100994dd(local_8,param_2,uVar6,pcVar7);
  return 0;
}


