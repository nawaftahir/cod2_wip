
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float * FUN_00486aa0(float param_1,float *param_2)

{
  float10 fVar1;
  float10 fVar2;
  
  param_1 = param_1 * _DAT_00556b8c;
  param_2[1] = 0.0;
  param_2[2] = 0.0;
  fVar1 = (float10)fcos((float10)param_1);
  fVar2 = (float10)fsin((float10)param_1);
  param_2[3] = (float)fVar1;
  *param_2 = (float)fVar2;
  return param_2 + 3;
}

