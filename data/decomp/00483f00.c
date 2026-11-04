
float10 __fastcall FUN_00483f00(float *param_1)

{
  float fVar1;
  
  if (*param_1 < param_1[1]) {
    fVar1 = param_1[1];
  }
  else {
    fVar1 = *param_1;
  }
  if (param_1[2] <= fVar1) {
    return (float10)fVar1;
  }
  return (float10)param_1[2];
}

