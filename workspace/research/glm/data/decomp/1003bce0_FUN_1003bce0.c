// 1003bce0 size=179 FUN_1003bce0

void FUN_1003bce0(undefined4 param_1)

{
  undefined4 *in_EDX;
  float *extraout_EDX;
  float10 fVar1;
  float fVar2;
  float fVar3;
  
  if ((*(int *)(DAT_101d1b9c + 0x168) != 0) &&
     ((float)in_EDX[7] < *(float *)(DAT_101d1b9c + 0x174) ==
      ((float)in_EDX[7] == *(float *)(DAT_101d1b9c + 0x174)))) {
    if ((float)in_EDX[7] < *(float *)(DAT_101d1b9c + 0x17c)) {
      fVar2 = ((float)in_EDX[7] - *(float *)(DAT_101d1b9c + 0x174)) /
              (*(float *)(DAT_101d1b9c + 0x17c) - *(float *)(DAT_101d1b9c + 0x174));
    }
    else {
      fVar2 = 1.0;
    }
    fVar3 = fVar2 * *(float *)(DAT_101d1b9c + 0x180);
    fVar2 = fVar2 * *(float *)(DAT_101d1b9c + 0x178) + *(float *)(DAT_101d1b9c + 0x170);
    fVar1 = (float10)FUN_1003abd0(*in_EDX,in_EDX[6],*(undefined4 *)(DAT_101d1b9c + 0x184),
                                  *(undefined4 *)(DAT_101d1b9c + 0x188),param_1,fVar2,fVar3);
    *extraout_EDX = (float)fVar1;
    FUN_1003bbe0((float)(fVar1 * (float10)fVar3),fVar2);
  }
  return;
}


