
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 __thiscall FUN_0042ad80(float *param_1,float param_2,float param_3,float param_4)

{
  float fVar1;
  float *in_EAX;
  float10 fVar2;
  
  fVar1 = (*param_1 - *in_EAX) * (*param_1 - *in_EAX) +
          (param_1[1] - in_EAX[1]) * (param_1[1] - in_EAX[1]);
  if (fVar1 <= param_2 * param_2) {
    return (float10)param_4;
  }
  if (param_3 * param_3 < fVar1 != (param_3 * param_3 == fVar1)) {
    return (float10)_DAT_00556a70;
  }
  fVar2 = (float10)FUN_004d98d4((double)fVar1);
  fVar1 = ((float)fVar2 - param_2) / (param_3 - param_2);
  return (float10)(_DAT_00556a58 - (_DAT_00556b70 - (fVar1 + fVar1)) * fVar1 * fVar1) *
         (float10)param_4;
}

