// 1005bb70 size=106 FUN_1005bb70

void FUN_1005bb70(float param_1)

{
  float10 fVar1;
  float *in_EDX;
  float10 fVar2;
  
  fVar1 = (float10)fcos((float10)(param_1 * 0.017453292));
  fVar2 = (float10)fsin((float10)(param_1 * 0.017453292));
  in_EDX[1] = -(float)fVar2;
  in_EDX[3] = (float)fVar2;
  *in_EDX = (float)fVar1;
  in_EDX[2] = 0.0;
  in_EDX[4] = (float)fVar1;
  in_EDX[5] = 0.0;
  in_EDX[6] = 0.0;
  in_EDX[7] = 0.0;
  in_EDX[8] = 1.0;
  return;
}


