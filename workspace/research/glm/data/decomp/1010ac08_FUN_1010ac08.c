// 1010ac08 size=184 FUN_1010ac08

uint FUN_1010ac08(int param_1,uint param_2)

{
  uint in_EAX;
  uint uVar1;
  bool in_ZF;
  unkbyte10 in_ST0;
  
  if (in_ZF) {
    if (((in_EAX & 0xfffff) != 0) || (param_1 != 0)) {
      uVar1 = FUN_10102f5c();
      goto LAB_1010aca1;
    }
    param_2 = 0;
    if ((in_EAX & 0x80000000) == 0) goto LAB_1010ac35;
  }
  else {
    if ((((param_2 & 0x7ff00000) == 0) && ((param_2 & 0xfffff) == 0)) && (param_1 == 0)) {
      uVar1 = 2;
      goto LAB_1010aca1;
    }
    if ((param_2 & 0x80000000) == 0) {
      log2(in_ST0);
LAB_1010ac35:
      if (DAT_101add90 != 0) {
        return param_2;
      }
      uVar1 = __math_exit();
      return uVar1;
    }
  }
  uVar1 = 1;
LAB_1010aca1:
  if (DAT_101add90 != 0) {
    return uVar1;
  }
  uVar1 = __startOneArgErrorHandling();
  return uVar1;
}


