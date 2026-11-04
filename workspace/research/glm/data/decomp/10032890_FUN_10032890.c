// 10032890 size=440 FUN_10032890

void FUN_10032890(float *param_1,float *param_2,int param_3)

{
  short sVar1;
  int in_EAX;
  uint uVar2;
  float *unaff_EBX;
  
  if ((DAT_1072d9bc != in_EAX) || (DAT_1072d9c0 != 3)) {
    if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
      FUN_1003a8d0();
    }
    FUN_1003a5f0(0x1f);
  }
  if ((0x154a < DAT_1072d9d4 + 4) || (0x100000 < (int)(DAT_1072d9d0 + 6))) {
    FUN_1002df40();
  }
  uVar2 = DAT_1072d9d0 & 0xffff;
  DAT_1072d9d0 = DAT_1072d9d0 + 6;
  sVar1 = (short)DAT_1072d9d4;
  DAT_1072d9d4 = DAT_1072d9d4 + 4;
  *(short *)(DAT_1072d9b0 + uVar2 * 2) = sVar1 + 3;
  *(short *)(DAT_1072d9b0 + 2 + uVar2 * 2) = sVar1;
  *(short *)(DAT_1072d9b0 + 4 + uVar2 * 2) = sVar1 + 2;
  *(short *)(DAT_1072d9b0 + 6 + uVar2 * 2) = sVar1 + 2;
  *(short *)(DAT_1072d9b0 + 8 + uVar2 * 2) = sVar1;
  *(short *)(DAT_1072d9b0 + 10 + uVar2 * 2) = sVar1 + 1;
  FUN_1002e550(*unaff_EBX,unaff_EBX[1],unaff_EBX[2],*(undefined4 *)(param_3 + 8),
               *(undefined4 *)(param_3 + 0xc));
  FUN_1002e550(*unaff_EBX + *param_1,param_1[1] + unaff_EBX[1],unaff_EBX[2] + param_1[2],
               *(undefined4 *)(param_3 + 0x10),*(undefined4 *)(param_3 + 0xc));
  FUN_1002e550(*unaff_EBX + *param_1 + *param_2,param_1[1] + unaff_EBX[1] + param_2[1],
               unaff_EBX[2] + param_1[2] + param_2[2],*(undefined4 *)(param_3 + 0x10),
               *(undefined4 *)(param_3 + 0x14));
  FUN_1002e550(*unaff_EBX + *param_2,unaff_EBX[1] + param_2[1],unaff_EBX[2] + param_2[2],
               *(undefined4 *)(param_3 + 8),*(undefined4 *)(param_3 + 0x14));
  return;
}


