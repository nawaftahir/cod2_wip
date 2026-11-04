
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00407c60(float *param_1,float *param_2)

{
  float *in_EAX;
  
  *in_EAX = (*param_2 + *param_1) * _DAT_00556b30;
  in_EAX[1] = (param_2[1] + param_1[1]) * _DAT_00556b30;
  in_EAX[2] = (param_2[2] + param_1[2]) * _DAT_00556b30;
  return;
}

