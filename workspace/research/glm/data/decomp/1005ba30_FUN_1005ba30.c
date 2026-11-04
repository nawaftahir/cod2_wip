// 1005ba30 size=82 FUN_1005ba30

float * FUN_1005ba30(float param_1)

{
  float fVar1;
  float10 fVar2;
  float *in_EDX;
  float *unaff_ESI;
  float10 fVar3;
  
  fVar2 = (float10)fcos((float10)(param_1 * 0.008726646));
  fVar3 = (float10)fsin((float10)(param_1 * 0.008726646));
  in_EDX[3] = (float)fVar2;
  fVar1 = (float)fVar3;
  *in_EDX = fVar1 * *unaff_ESI;
  in_EDX[1] = fVar1 * unaff_ESI[1];
  in_EDX[2] = fVar1 * unaff_ESI[2];
  return in_EDX + 3;
}


