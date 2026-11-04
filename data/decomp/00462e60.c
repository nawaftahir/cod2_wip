
undefined4 FUN_00462e60(int param_1,char param_2)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  int *unaff_ESI;
  
  iVar3 = param_1;
  if (-1 < param_1) {
    iVar1 = (**(code **)(*unaff_ESI + 4))();
    if (iVar3 < iVar1) {
      if (param_2 != '\0') {
        if ((void *)unaff_ESI[4] != (void *)0x0) {
          _free((void *)unaff_ESI[4]);
        }
        unaff_ESI[4] = 0;
        unaff_ESI[1] = 0;
        unaff_ESI[2] = 0;
        uVar2 = FUN_00462fa0(&param_1);
        return uVar2;
      }
      iVar3 = FUN_00462f20(iVar3);
      if (-1 < iVar3) {
        FUN_00462f60();
      }
      uVar2 = FUN_00462fa0(&param_1);
      return uVar2;
    }
  }
  return 0xffffffff;
}

