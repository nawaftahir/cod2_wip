
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float * __fastcall FUN_00498a40(undefined4 param_1,float *param_2)

{
  float10 fVar1;
  float fVar2;
  float fVar3;
  float *unaff_ESI;
  float10 fVar4;
  
  fVar1 = (float10)fcos((float10)(unaff_ESI[1] * _DAT_00556b88));
  fVar4 = (float10)fsin((float10)(unaff_ESI[1] * _DAT_00556b88));
  DAT_0124ae0c = (float)fVar1;
  DAT_0124ae08 = (float)fVar4;
  fVar1 = (float10)fcos((float10)(*unaff_ESI * _DAT_00556b88));
  fVar4 = (float10)fsin((float10)(*unaff_ESI * _DAT_00556b88));
  DAT_0124ae04 = (float)fVar1;
  DAT_0124ae00 = (float)fVar4;
  fVar2 = -DAT_0124ae00;
  fVar3 = DAT_0124ae04 * DAT_0124ae0c;
  param_2[1] = DAT_0124ae04 * DAT_0124ae08;
  param_2[2] = fVar2;
  *param_2 = fVar3;
  return param_2;
}

