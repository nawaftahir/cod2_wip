// 1010a9fd size=149 FUN_1010a9fd

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ushort FUN_1010a9fd(int param_1)

{
  ushort uVar1;
  uint in_EAX;
  bool in_ZF;
  ushort in_FPUStatusWord;
  unkbyte10 in_ST0;
  float10 fVar2;
  
  if (in_ZF) {
    if (((in_EAX & 0xfffff) == 0) && (param_1 == 0)) {
      in_FPUStatusWord = 1;
    }
    else {
      in_FPUStatusWord = FUN_10102f5c();
    }
    if (DAT_101add90 == 0) {
      uVar1 = __startOneArgErrorHandling();
      return uVar1;
    }
  }
  else {
    fptan(in_ST0);
    fVar2 = (float10)1;
    if ((in_FPUStatusWord & 0x400) != 0) {
      do {
        fVar2 = fVar2 - ROUND(fVar2 / _DAT_1017e30a) * _DAT_1017e30a;
      } while ((in_FPUStatusWord & 0x400) != 0);
      fptan(fVar2);
    }
    if (DAT_101add90 == 0) {
      uVar1 = __math_exit();
      return uVar1;
    }
  }
  return in_FPUStatusWord;
}


