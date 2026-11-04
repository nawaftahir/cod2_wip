// 100f8f7d size=453 FUN_100f8f7d

undefined4 FUN_100f8f7d(int param_1,uint param_2,int param_3,uint param_4)

{
  uint in_EAX;
  uint uVar1;
  undefined4 uVar2;
  byte extraout_CL;
  char extraout_CL_00;
  uint extraout_ECX;
  int extraout_ECX_00;
  int iVar3;
  int extraout_ECX_01;
  bool bVar4;
  short in_FPUControlWord;
  float10 extraout_ST0;
  float10 fVar5;
  float10 extraout_ST1;
  float10 extraout_ST1_00;
  float10 extraout_ST1_01;
  float10 fVar6;
  unkbyte10 in_ST7;
  undefined1 local_78 [20];
  undefined4 uStack_64;
  undefined1 auStack_e [10];
  short local_4;
  undefined2 uStack_2;
  
  _local_4 = CONCAT22((short)(in_EAX >> 0x10),in_FPUControlWord);
  uVar1 = in_EAX;
  if (in_FPUControlWord != 0x27f) {
    auStack_e._6_4_ = 0x100f8f91;
    in_EAX = FUN_10102f45();
    uVar1 = extraout_ECX;
  }
  bVar4 = (uVar1 & 0x7ff00000) == 0x7ff00000;
  if (bVar4) {
    if ((in_EAX & 0xfffff) == 0 && param_3 == 0) {
      auStack_e._6_4_ = 0x100f905a;
      fVar5 = (float10)__fload_withFB();
      iVar3 = extraout_ECX_01;
      fVar6 = extraout_ST1_01;
      goto LAB_100f905a;
    }
    auStack_e._6_4_ = 0x100f901d;
    fVar5 = (float10)__fload_withFB();
    if ((param_4 & 0x80000) == 0) {
      iVar3 = extraout_ECX_00 + 1;
      fVar6 = extraout_ST1_00;
      goto LAB_100f905a;
    }
LAB_100f9027:
    uVar2 = 1;
  }
  else {
    auStack_e._6_4_ = 0x100f8fac;
    uVar1 = __fload_withFB();
    if (!bVar4) {
      if (((uVar1 & 0x7ff00000) != 0) || ((param_2 & 0xfffff) != 0 || param_1 != 0)) {
        fVar5 = extraout_ST0;
        if ((param_2 & 0x80000000) != 0) {
          auStack_e._6_4_ = 0x100f9124;
          fVar5 = (float10)FUN_100f9142();
          fVar5 = -fVar5;
          if (extraout_CL_00 == '\0') {
            uVar2 = 1;
            goto LAB_100f8ff5;
          }
        }
        log2(fVar5);
        auStack_e._6_4_ = 0x100f8fd1;
        uVar2 = FUN_10102f30();
        if (DAT_101add90 != 0) {
          return uVar2;
        }
        uVar2 = FUN_10103019();
        return uVar2;
      }
      if ((param_4 & 0x7fffffff) == 0 && param_3 == 0) {
        uVar2 = FUN_10102fce();
        return uVar2;
      }
      auStack_e._6_4_ = 0x100f90dc;
      uVar2 = FUN_100f9142();
      if ((param_4 & 0x80000000) == 0) {
        if ((param_2._3_1_ >> 7 & extraout_CL) == 0) {
          return uVar2;
        }
        uVar2 = FUN_10102fce();
        return uVar2;
      }
      uVar2 = 2;
      goto LAB_100f8ff5;
    }
    iVar3 = 0;
    fVar5 = extraout_ST0;
    fVar6 = extraout_ST1;
LAB_100f905a:
    if (((param_2 & 0x7ff00000) == 0x7ff00000) && ((param_2 & 0xfffff) != 0 || param_1 != 0)) {
      if ((param_2 & 0x80000) != 0) goto LAB_100f9027;
    }
    else if (iVar3 == 0) {
      uStack_64 = 0x100f9088;
      auStack_e = (undefined1  [10])in_ST7;
      iVar3 = __powhlp((double)fVar5,(double)fVar6,local_78);
      if (iVar3 == 0) {
        return 0;
      }
      uVar2 = 1;
      goto LAB_100f8ff5;
    }
    uVar2 = 7;
  }
LAB_100f8ff5:
  if (DAT_101add90 != 0) {
    return uVar2;
  }
  auStack_e._6_4_ = 0x100f9012;
  uVar2 = FUN_10102ed0();
  return uVar2;
}


