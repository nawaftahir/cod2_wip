// 1009e8bf size=553 FUN_1009e8bf

int FUN_1009e8bf(int *param_1,int *param_2,int param_3,undefined4 param_4)

{
  int *piVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  int in_ECX;
  int iVar5;
  int iVar6;
  int *piVar7;
  int *local_c [2];
  
  piVar1 = param_2;
  local_c[0] = (int *)0x0;
  piVar7 = param_1;
  if ((param_1 != (int *)0x0) && (param_1[1] == 3)) {
    FUN_1009e0fb(0,param_1 + 4,0,0,*(undefined4 *)(in_ECX + 0x10),1,local_c,0);
    piVar7 = local_c[0];
  }
  param_1 = (int *)(in_ECX + 0x20);
  if (param_3 == 0) {
    local_c[0] = (int *)0x0;
    if (param_2 != (int *)0x0) {
      if (param_2[1] != 0xd) {
        return 0;
      }
      local_c[0] = (int *)param_2[4];
      param_1 = param_2 + 0xc;
    }
    iVar2 = FUN_1009b666(piVar7,local_c[0],param_4);
    if (iVar2 == 0) {
      FUN_1009b99e(param_1,0,piVar7,local_c[0],param_4);
      return 0;
    }
    iVar2 = FUN_10099a41(piVar7);
    if ((iVar2 == 0) && (iVar2 = FUN_10099a41(local_c[0]), iVar2 == 0)) {
      param_2 = (int *)0x0;
    }
    else {
      param_2 = (int *)0x1;
    }
  }
  else {
    if (((piVar7 == (int *)0x0) || (piVar7[1] != 9)) || (iVar2 = FUN_10099ad8(piVar7), iVar2 == 0))
    goto LAB_1009eaca;
    if ((param_2 != (int *)0x0) && (param_2[1] != 1)) {
      return 0;
    }
    param_2 = (int *)FUN_10099a41(piVar7);
  }
  uVar3 = FUN_1009a3ce(piVar1);
  param_2 = (int *)((uint)param_2 | uVar3);
  iVar2 = FUN_1006506e(0x50);
  iVar6 = 0;
  if (iVar2 != 0) {
    iVar6 = FUN_10083255(0,0,0,0,1,param_1);
  }
  if (iVar6 == 0) {
    return 0;
  }
  if (piVar7 != (int *)0x0) {
    iVar2 = (**(code **)(*piVar7 + 4))();
    *(int *)(iVar6 + 0x10) = iVar2;
    if (iVar2 == 0) {
      return 0;
    }
  }
  if (piVar1 != (int *)0x0) {
    iVar2 = (**(code **)(*piVar1 + 4))();
    *(int *)(iVar6 + 0x20) = iVar2;
    if (iVar2 == 0) {
      return 0;
    }
  }
  if (param_3 != 0) {
    for (iVar2 = *(int *)(iVar6 + 0x20); iVar2 != 0; iVar2 = *(int *)(iVar2 + 0xc)) {
      iVar5 = *(int *)(iVar2 + 8);
      if ((iVar5 != 0) && (*(int *)(iVar5 + 4) == 0xd)) {
        iVar5 = FUN_10099ad8(*(undefined4 *)(iVar5 + 0x10));
        if (iVar5 == 0) goto LAB_1009eaca;
        if (param_2 == (int *)0x0) {
          param_2 = (int *)FUN_10099a41(*(undefined4 *)(*(int *)(iVar2 + 8) + 0x10));
        }
      }
    }
  }
  if (param_2 != (int *)0x0) {
    FUN_1009991f(*(undefined4 *)(iVar6 + 0x10),1);
  }
  if (param_3 != 0) {
    iVar5 = 0;
    for (iVar2 = *(int *)(iVar6 + 0x20); iVar2 != 0; iVar2 = *(int *)(iVar2 + 0xc)) {
      iVar4 = *(int *)(iVar2 + 8);
      if ((iVar4 != 0) && (*(int *)(iVar4 + 4) == 0xd)) {
        iVar4 = FUN_10099b4f(*(undefined4 *)(iVar4 + 0x10));
        iVar5 = iVar5 + iVar4;
      }
    }
    iVar2 = FUN_10099b4f(*(undefined4 *)(iVar6 + 0x10));
    if (iVar5 != iVar2) {
LAB_1009eaca:
      FUN_100994dd();
      return 0;
    }
  }
  FUN_1009a568(iVar6);
  return iVar6;
}


