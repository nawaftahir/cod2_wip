
undefined4 FUN_00407910(uint param_1)

{
  undefined4 uVar1;
  int iVar2;
  
  uVar1 = 0;
  if ((param_1 != 0) && ((param_1 & 0xffff0000) == 0)) {
    iVar2 = FUN_00501023(param_1 & 0xffff);
    if (iVar2 != 0) {
      FUN_00407990(iVar2,param_1 & 0xffff);
    }
    uVar1 = 1;
  }
  return uVar1;
}

