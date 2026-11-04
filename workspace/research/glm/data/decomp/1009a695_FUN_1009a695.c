// 1009a695 size=283 FUN_1009a695

int FUN_1009a695(int *param_1,int *param_2,int param_3,int *param_4)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 in_ECX;
  
  if ((param_2 != (int *)0x0) &&
     ((param_2[6] * param_2[5] != 1 || (iVar1 = FUN_10099ad8(param_2[4]), iVar1 == 0)))) {
    FUN_100994dd(in_ECX,param_2 + 0xc,0xbcb,"float expected");
    return 0;
  }
  iVar1 = FUN_1006506e(0x24);
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10083159();
  }
  if (iVar1 == 0) {
    return 0;
  }
  *(undefined4 *)(iVar1 + 0x10) = 3;
  if (param_3 == 0) {
    if (param_1 == (int *)0x0) {
      *(undefined4 *)(iVar1 + 0x10) = 4;
      goto LAB_1009a740;
    }
    if (param_1 == param_4) {
      *(undefined4 *)(iVar1 + 0x10) = 5;
      param_1 = (int *)0x0;
    }
  }
  if (param_1 != (int *)0x0) {
    iVar2 = (**(code **)(*param_1 + 4))();
    *(int *)(iVar1 + 0x14) = iVar2;
    if (iVar2 == 0) {
      return 0;
    }
  }
LAB_1009a740:
  if (param_2 != (int *)0x0) {
    iVar2 = (**(code **)(*param_2 + 4))();
    *(int *)(iVar1 + 0x18) = iVar2;
    if (iVar2 == 0) {
      return 0;
    }
  }
  if (param_4 != (int *)0x0) {
    iVar2 = (**(code **)(*param_4 + 4))();
    *(int *)(iVar1 + 0x1c) = iVar2;
    if (iVar2 == 0) {
      return 0;
    }
  }
  if (param_3 != 0) {
    iVar2 = FUN_1009a5b0(param_3);
    if (iVar2 == 0) {
      return 0;
    }
    uVar3 = FUN_1008282f(*(undefined4 *)(iVar1 + 0x1c),iVar2);
    *(undefined4 *)(iVar1 + 0x1c) = uVar3;
  }
  iVar2 = FUN_1006506e(0x14);
  if (iVar2 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10082872(iVar1,0,"Stmts");
  }
  if (iVar1 == 0) {
    return 0;
  }
  return iVar1;
}


