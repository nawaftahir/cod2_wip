// 1003b310 size=407 FUN_1003b310

float10 FUN_1003b310(int param_1,int param_2)

{
  float fVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  
  fVar1 = *(float *)(DAT_1072ddc8 + 0xd4) * *(float *)(DAT_101d1b9c + 0x1b4) +
          *(float *)(DAT_1072ddc8 + 0xe4) * *(float *)(DAT_101d1b9c + 0x1b8) +
          *(float *)(DAT_1072ddc8 + 0xf4) * *(float *)(DAT_101d1b9c + 0x1bc);
  if (fVar1 < 0.0 == (fVar1 == 0.0)) {
    iVar3 = (int)ROUND((((1.0 / fVar1) *
                         (*(float *)(DAT_101d1b9c + 0x1b4) * *(float *)(DAT_1072ddc8 + 200) +
                         *(float *)(DAT_1072ddc8 + 0xd8) * *(float *)(DAT_101d1b9c + 0x1b8) +
                         *(float *)(DAT_1072ddc8 + 0xe8) * *(float *)(DAT_101d1b9c + 0x1bc)) + 1.0)
                        * (float)DAT_101d4c6c - (float)param_1) * 0.5 + 9.313226e-10);
    iVar5 = (int)ROUND((((1.0 / fVar1) *
                         (*(float *)(DAT_1072ddc8 + 0xcc) * *(float *)(DAT_101d1b9c + 0x1b4) +
                         *(float *)(DAT_1072ddc8 + 0xdc) * *(float *)(DAT_101d1b9c + 0x1b8) +
                         *(float *)(DAT_1072ddc8 + 0xec) * *(float *)(DAT_101d1b9c + 0x1bc)) + 1.0)
                        * (float)DAT_101d4c70 - (float)param_2) * 0.5 + 9.313226e-10);
    iVar2 = param_2 + iVar5;
    iVar4 = iVar3 + param_1;
    if (iVar3 < 0) {
      iVar3 = 0;
    }
    if (DAT_101d4c6c < iVar4) {
      iVar4 = DAT_101d4c6c;
    }
    if (iVar5 < 0) {
      iVar5 = 0;
    }
    if (DAT_101d4c70 < iVar2) {
      iVar2 = DAT_101d4c70;
    }
    if ((iVar3 < iVar4) && (iVar5 < iVar2)) {
      return (float10)((iVar2 - iVar5) * (iVar4 - iVar3)) / (float10)(param_1 * param_2);
    }
  }
  return (float10)0.0;
}


