// 1010a93d size=157 FUN_1010a93d

uint FUN_1010a93d(uint param_1,uint param_2)

{
  uint uVar1;
  bool in_ZF;
  short in_FPUControlWord;
  
  if (in_ZF) {
    if (((param_2 & 0xfffff) != 0) || (param_1 != 0)) {
      uVar1 = FUN_10102f5c();
      goto LAB_1010a9bb;
    }
    param_1 = param_2 & 0x80000000;
    param_2 = 0;
joined_r0x1010a9ac:
    if (param_1 == 0) {
LAB_1010a95e:
      if (DAT_101add90 != 0) {
        return param_2;
      }
      uVar1 = __math_exit();
      return uVar1;
    }
  }
  else {
    if (in_FPUControlWord != 0x27f) {
      param_2 = FUN_10102f45();
    }
    if ((param_2 & 0x80000000) == 0) goto LAB_1010a95e;
    if (((param_2 & 0x7ff00000) == 0) && ((param_2 & 0xfffff) == 0)) goto joined_r0x1010a9ac;
  }
  uVar1 = 1;
LAB_1010a9bb:
  if (DAT_101add90 != 0) {
    return uVar1;
  }
  uVar1 = __startOneArgErrorHandling();
  return uVar1;
}


