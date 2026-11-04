// 1003f930 size=120 FUN_1003f930

undefined4 FUN_1003f930(float param_1,float *param_2)

{
  float fVar1;
  float *in_EAX;
  
  fVar1 = *(float *)(DAT_1072ddc8 + 0xd4) * *in_EAX +
          *(float *)(DAT_1072ddc8 + 0xe4) * in_EAX[1] + *(float *)(DAT_1072ddc8 + 0xf4) * in_EAX[2]
          + *(float *)(DAT_1072ddc8 + 0x104);
  if (!NAN(fVar1) && fVar1 < 0.0 != (fVar1 == 0.0)) {
    return 0;
  }
  param_1 = param_1 + param_1;
  *param_2 = (param_1 * *(float *)(DAT_1072ddc8 + 0x118) * *(float *)(DAT_1072ddc8 + 0x24) +
             param_1 * *(float *)(DAT_1072ddc8 + 0x120) * *(float *)(DAT_1072ddc8 + 0x2c) +
             param_1 * *(float *)(DAT_1072ddc8 + 0x11c) * *(float *)(DAT_1072ddc8 + 0x28)) * fVar1;
  return 1;
}


