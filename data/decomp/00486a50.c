
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float * FUN_00486a50(float param_1)

{
  float10 fVar1;
  undefined4 *in_EAX;
  float10 fVar2;
  
  param_1 = param_1 * _DAT_00556b8c;
  *in_EAX = 0;
  in_EAX[1] = 0;
  fVar1 = (float10)fcos((float10)param_1);
  fVar2 = (float10)fsin((float10)param_1);
  in_EAX[3] = (float)fVar1;
  in_EAX[2] = (float)fVar2;
  return (float *)(in_EAX + 2);
}

