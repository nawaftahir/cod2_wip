// 1009a5b0 size=98 FUN_1009a5b0

int FUN_1009a5b0(int *param_1)

{
  int iVar1;
  int iVar2;
  
  iVar1 = FUN_1006506e(0x24);
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10083159();
  }
  if (iVar1 != 0) {
    *(undefined4 *)(iVar1 + 0x10) = 0;
    if (param_1 != (int *)0x0) {
      iVar2 = (**(code **)(*param_1 + 4))();
      *(int *)(iVar1 + 0x14) = iVar2;
      if (iVar2 == 0) {
        return 0;
      }
    }
    iVar2 = FUN_1006506e(0x14);
    if (iVar2 == 0) {
      iVar1 = 0;
    }
    else {
      iVar1 = FUN_10082872(iVar1,0,"Stmts");
    }
    if (iVar1 != 0) {
      return iVar1;
    }
  }
  return 0;
}


