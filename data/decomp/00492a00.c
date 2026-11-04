
float10 __fastcall FUN_00492a00(undefined4 param_1,short *param_2)

{
  int iVar1;
  
  iVar1 = (int)*param_2;
  if ((short)(&DAT_011546c4)[iVar1 * 0x24] < 0) {
    return (float10)(float)(&DAT_01154698)[iVar1 * 0x12];
  }
  return (float10)(((float)(&DAT_01154698)[(short)(&DAT_011546c4)[iVar1 * 0x24] * 0x12] -
                   (float)(&DAT_01154698)[iVar1 * 0x12]) * *(float *)(param_2 + 2) +
                  (float)(&DAT_01154698)[iVar1 * 0x12]);
}

