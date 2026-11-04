// 1009eae8 size=880 FUN_1009eae8

int FUN_1009eae8(int param_1,int param_2,int param_3)

{
  int iVar1;
  undefined4 uVar2;
  int in_ECX;
  int iVar3;
  int *piVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  int *local_24;
  int *local_20;
  undefined4 local_1c;
  int *local_18;
  int *local_14;
  int local_10;
  int local_c;
  
  if ((((param_1 != 0) && (*(int *)(param_1 + 4) != 0xd)) ||
      ((param_2 != 0 && (*(int *)(param_2 + 4) != 0xd)))) ||
     ((param_3 != 0 && (*(int *)(param_3 + 4) != 0xd)))) {
    return 0;
  }
  local_10 = param_1 + 0x30;
  if (param_1 == 0) {
    local_10 = in_ECX + 0x20;
    local_1c = 0;
  }
  else {
    local_1c = *(undefined4 *)(param_1 + 0x10);
  }
  if (param_2 == 0) {
    local_14 = (int *)0x0;
  }
  else {
    local_14 = *(int **)(param_2 + 0x10);
  }
  if (param_3 == 0) {
    local_18 = (int *)0x0;
  }
  else {
    local_18 = *(int **)(param_3 + 0x10);
  }
  local_20 = local_14;
  local_24 = local_18;
  iVar3 = 0;
  iVar1 = FUN_1006506e(0x50);
  if (iVar1 == 0) {
    local_c = 0;
  }
  else {
    local_c = FUN_10083255(0,0x18,0,0,1,local_10);
  }
  if (local_c == 0) {
    return 0;
  }
  iVar1 = FUN_10099ad8(local_1c);
  if (iVar1 == 0) goto LAB_1009ebb5;
  piVar4 = (int *)(local_c + 0x10);
  iVar1 = FUN_1009bccf(local_14,local_18,&local_20,&local_24,piVar4);
  if (iVar1 < 0) goto LAB_1009ebb5;
  if (*piVar4 == 0) goto LAB_1009ec70;
  if (*(int *)(*piVar4 + 4) == 9) {
    iVar1 = FUN_1006506e(0x24);
    if (iVar1 != 0) {
      uVar6 = 0x200;
      uVar2 = *(undefined4 *)(*piVar4 + 0x1c);
      uVar5 = *(undefined4 *)(*piVar4 + 0x18);
      goto LAB_1009ec34;
    }
LAB_1009ec40:
    iVar3 = 0;
  }
  else {
    iVar1 = FUN_1006506e(0x24);
    if (iVar1 == 0) goto LAB_1009ec40;
    uVar6 = 0x200;
    uVar2 = FUN_10099b4f(*piVar4);
    uVar5 = 1;
LAB_1009ec34:
    iVar3 = FUN_10082e36(2,0,uVar5,uVar2,uVar6);
  }
  if (iVar3 == 0) {
    return 0;
  }
  iVar1 = FUN_1009b666(iVar3,local_1c,0);
  if (iVar1 != 0) {
LAB_1009ec70:
    if (param_1 != 0) {
      iVar1 = FUN_1009e8bf(iVar3,param_1,0,0);
      *(int *)(local_c + 0x20) = iVar1;
      if (iVar1 == 0) {
        return 0;
      }
    }
    iVar1 = FUN_1006506e(0x50);
    if (iVar1 == 0) {
      iVar1 = 0;
    }
    else {
      iVar1 = FUN_10083255(0,0,0,0,1,local_10);
    }
    *(int *)(local_c + 0x24) = iVar1;
    if (iVar1 == 0) {
      return 0;
    }
    iVar3 = FUN_1006506e(0x14);
    if (iVar3 == 0) {
      iVar3 = 0;
    }
    else {
      iVar3 = FUN_10082872(0,0,"Types");
    }
    piVar4 = local_20;
    *(int *)(iVar1 + 0x10) = iVar3;
    if (iVar3 == 0) {
      return 0;
    }
    if (local_20 != (int *)0x0) {
      uVar2 = (**(code **)(*local_20 + 4))();
      *(undefined4 *)(*(int *)(iVar1 + 0x10) + 8) = uVar2;
      if (*(int *)(*(int *)(iVar1 + 0x10) + 8) == 0) {
        return 0;
      }
    }
    iVar3 = FUN_1006506e(0x14);
    if (iVar3 == 0) {
      iVar3 = 0;
    }
    else {
      iVar3 = FUN_10082872(0,0,"Value");
    }
    *(int *)(iVar1 + 0x20) = iVar3;
    if (iVar3 == 0) {
      return 0;
    }
    if (param_2 != 0) {
      if ((local_14 == piVar4) || (iVar3 = FUN_10099bdd(local_14,piVar4), iVar3 != 0)) {
        uVar2 = FUN_10082816(param_2);
      }
      else {
        uVar2 = FUN_1009e8bf(piVar4,param_2,0,0);
      }
      *(undefined4 *)(*(int *)(iVar1 + 0x20) + 8) = uVar2;
      if (*(int *)(*(int *)(iVar1 + 0x20) + 8) == 0) {
        return 0;
      }
    }
    iVar3 = FUN_1006506e(0x14);
    if (iVar3 == 0) {
      iVar3 = 0;
    }
    else {
      iVar3 = FUN_10082872(0,0,"Types");
    }
    piVar4 = local_24;
    *(int *)(*(int *)(iVar1 + 0x10) + 0xc) = iVar3;
    if (iVar3 == 0) {
      return 0;
    }
    if (local_24 != (int *)0x0) {
      uVar2 = (**(code **)(*local_24 + 4))();
      *(undefined4 *)(*(int *)(*(int *)(iVar1 + 0x10) + 0xc) + 8) = uVar2;
      if (*(int *)(*(int *)(*(int *)(iVar1 + 0x10) + 0xc) + 8) == 0) {
        return 0;
      }
    }
    iVar3 = FUN_1006506e(0x14);
    if (iVar3 == 0) {
      iVar3 = 0;
    }
    else {
      iVar3 = FUN_10082872(0,0,"Value");
    }
    *(int *)(*(int *)(iVar1 + 0x20) + 0xc) = iVar3;
    if (iVar3 == 0) {
      return 0;
    }
    if (param_3 != 0) {
      if ((local_18 == piVar4) || (iVar3 = FUN_10099bdd(local_18,piVar4), iVar3 != 0)) {
        uVar2 = FUN_10082816(param_3);
      }
      else {
        uVar2 = FUN_1009e8bf(piVar4,param_3,0,0);
      }
      *(undefined4 *)(*(int *)(*(int *)(iVar1 + 0x20) + 0xc) + 8) = uVar2;
      if (*(int *)(*(int *)(*(int *)(iVar1 + 0x20) + 0xc) + 8) == 0) {
        return 0;
      }
    }
    FUN_1009a568(iVar1);
    FUN_1009a568(local_c);
    return local_c;
  }
LAB_1009ebb5:
  FUN_100994dd();
  return 0;
}


