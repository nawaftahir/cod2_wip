
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00484da0(float *param_1,float *param_2)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float *in_EAX;
  float *unaff_ESI;
  
  fVar1 = *in_EAX - *param_1;
  fVar2 = in_EAX[1] - param_1[1];
  fVar3 = in_EAX[2] - param_1[2];
  fVar4 = fVar2 * fVar2 + fVar1 * fVar1 + fVar3 * fVar3;
  if (fVar4 == _DAT_00556a70) {
    *param_2 = *param_1;
    param_2[1] = param_1[1];
    param_2[2] = param_1[2];
    return;
  }
  fVar4 = ((unaff_ESI[1] - param_1[1]) * fVar2 +
          (*unaff_ESI - *param_1) * fVar1 + (unaff_ESI[2] - param_1[2]) * fVar3) / fVar4;
  *param_2 = fVar1 * fVar4 + *param_1;
  param_2[1] = fVar4 * fVar2 + param_1[1];
  param_2[2] = fVar3 * fVar4 + param_1[2];
  return;
}

