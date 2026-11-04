// 1002e850 size=393 FUN_1002e850

void FUN_1002e850(float param_1,float param_2,float param_3,float param_4,undefined4 param_5,
                 undefined4 param_6,undefined4 param_7,undefined4 param_8)

{
  short sVar1;
  int in_EAX;
  
  if (DAT_1072debd == '\0') {
    FUN_1002e020();
  }
  if ((DAT_1072d9bc != in_EAX) || (DAT_1072d9c0 != 3)) {
    if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
      FUN_1003a8d0();
    }
    FUN_1003a5f0(0x1f);
  }
  if ((0x154a < DAT_1072d9d4 + 4) || (0x100000 < DAT_1072d9d0 + 6)) {
    FUN_1002df40();
  }
  sVar1 = (short)DAT_1072d9d4;
  *(short *)(DAT_1072d9b0 + DAT_1072d9d0 * 2) = sVar1 + 3;
  *(short *)(DAT_1072d9b0 + 2 + DAT_1072d9d0 * 2) = sVar1;
  *(short *)(DAT_1072d9b0 + 4 + DAT_1072d9d0 * 2) = sVar1 + 2;
  *(short *)(DAT_1072d9b0 + 6 + DAT_1072d9d0 * 2) = sVar1 + 2;
  *(short *)(DAT_1072d9b0 + 8 + DAT_1072d9d0 * 2) = sVar1;
  *(short *)(DAT_1072d9b0 + 10 + DAT_1072d9d0 * 2) = sVar1 + 1;
  FUN_1002e470(param_1,param_2,param_5,param_6);
  FUN_1002e470(param_1 + param_3,param_2,param_7,param_6);
  FUN_1002e470(param_1 + param_3,param_2 + param_4,param_7,param_8);
  FUN_1002e470(param_1,param_2 + param_4,param_5,param_8);
  DAT_1072d9d4 = DAT_1072d9d4 + 4;
  DAT_1072d9d0 = DAT_1072d9d0 + 6;
  return;
}


