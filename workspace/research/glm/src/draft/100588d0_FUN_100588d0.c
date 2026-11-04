


float FUN_100588d0(float param_1,float param_2,float param_3,float param_4)

{
  float fVar1;
  
  param_3 = param_3 * param_4;
  if (param_1 - param_2 <= 0.0) {
    param_3 = -param_3;
  }
  fVar1 = ABS(param_1 - param_2);
  if (0.001 < fVar1) {
    if (ABS(param_3) <= fVar1) {
      return (float)param_3 + (float)param_2;
    }
  }
  return (float)param_1;
}


