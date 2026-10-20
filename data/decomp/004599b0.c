
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 __fastcall FUN_004599b0(float *param_1,float *param_2)

{
  float fVar1;
  float fVar2;
  int in_EAX;
  float *pfVar3;
  
  fVar1 = (*param_1 * *(float *)(in_EAX + 0x80) +
          *(float *)(in_EAX + 0x88) * param_1[2] + *(float *)(in_EAX + 0x84) * param_1[1]) -
          (float)*(double *)(in_EAX + 0x90);
  fVar2 = (*param_2 * *(float *)(in_EAX + 0x80) +
          *(float *)(in_EAX + 0x84) * param_2[1] + *(float *)(in_EAX + 0x88) * param_2[2]) -
          (float)*(double *)(in_EAX + 0x90);
  if ((_DAT_00556a70 <= fVar1) && (_DAT_00556a70 <= fVar2)) {
    return 0;
  }
  if ((fVar1 < _DAT_00556a70 != (fVar1 == _DAT_00556a70)) &&
     (fVar2 < _DAT_00556a70 != (fVar2 == _DAT_00556a70))) {
    return 1;
  }
  fVar2 = fVar1 / (fVar1 - fVar2);
  pfVar3 = param_1;
  if (fVar1 <= _DAT_00556a70) {
    pfVar3 = param_2;
  }
  *pfVar3 = (*param_2 - *param_1) * fVar2 + *param_1;
  pfVar3[1] = (param_2[1] - param_1[1]) * fVar2 + param_1[1];
  pfVar3[2] = (param_2[2] - param_1[2]) * fVar2 + param_1[2];
  return 1;
}

