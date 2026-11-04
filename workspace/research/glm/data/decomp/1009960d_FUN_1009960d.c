// 1009960d size=100 FUN_1009960d

undefined4 FUN_1009960d(undefined4 param_1,int param_2)

{
  int iVar1;
  undefined4 uVar2;
  int in_ECX;
  
  if ((*(int *)(in_ECX + 0x10) != 0) && (param_2 == 0)) {
    param_2 = *(int *)(*(int *)(in_ECX + 0x10) + 0x14);
  }
  iVar1 = FUN_1006506e(0x24);
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10082b85(param_1,param_2,0,0,*(undefined4 *)(in_ECX + 0x10));
  }
  if (iVar1 == 0) {
    FUN_10099580();
    uVar2 = 0x8007000e;
  }
  else {
    *(int *)(in_ECX + 0x10) = iVar1;
    uVar2 = 0;
  }
  return uVar2;
}


