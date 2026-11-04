
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 __fastcall FUN_00483830(float *param_1,float *param_2,float param_3)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float *unaff_ESI;
  float local_8;
  
  fVar1 = (*unaff_ESI - *param_2) * *param_1 +
          (unaff_ESI[1] - param_2[1]) * param_1[1] + (unaff_ESI[2] - param_2[2]) * param_1[2];
  if (fVar1 - param_3 < _DAT_00556a70) {
    param_3 = fVar1;
  }
  local_8 = 0.0;
  if (_DAT_00556a70 - fVar1 < _DAT_00556a70) {
    local_8 = param_3;
  }
  fVar1 = (local_8 * *param_1 + *param_2) - *unaff_ESI;
  fVar2 = (local_8 * param_1[1] + param_2[1]) - unaff_ESI[1];
  fVar3 = (local_8 * param_1[2] + param_2[2]) - unaff_ESI[2];
  return (float10)(fVar1 * fVar1 + fVar2 * fVar2 + fVar3 * fVar3);
}

