// 1005e100 size=120 FUN_1005e100

undefined1 * FUN_1005e100(float param_1,float param_2)

{
  float10 fVar1;
  float10 fVar2;
  float *in_EDX;
  float10 fVar3;
  float10 fVar4;
  undefined1 local_18 [24];
  
  fVar1 = (float10)fcos((float10)param_2);
  fVar3 = (float10)fsin((float10)param_2);
  fVar2 = (float10)fcos((float10)param_2);
  fVar4 = (float10)fsin((float10)param_2);
  *in_EDX = (float)fVar2 * (float)fVar1 * param_1;
  in_EDX[1] = (float)fVar2 * (float)fVar3 * param_1;
  in_EDX[2] = (float)fVar4 * param_1;
  return local_18;
}


