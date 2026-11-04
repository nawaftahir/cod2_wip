// 1005b550 size=99 FUN_1005b550

void FUN_1005b550(float param_1)

{
  float fVar1;
  float10 fVar2;
  float *in_EDX;
  float10 fVar3;
  
  fVar2 = (float10)fcos((float10)(param_1 * 0.017453292));
  fVar3 = (float10)fsin((float10)(param_1 * 0.017453292));
  fVar1 = *in_EDX;
  *in_EDX = (float)fVar2 * *in_EDX - (float)fVar3 * in_EDX[1];
  in_EDX[1] = (float)fVar2 * in_EDX[1] + (float)fVar3 * fVar1;
  return;
}


