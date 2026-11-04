
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 __fastcall FUN_00484f70(float *param_1,float *param_2)

{
  float *unaff_ESI;
  float local_c;
  float local_8;
  
  local_c = 0.0;
  local_8 = *param_2 - *param_1;
  if ((_DAT_00556a70 < local_8) || (local_8 = *param_1 - *unaff_ESI, _DAT_00556a70 < local_8)) {
    local_c = local_8 * local_8 + _DAT_00556a70;
  }
  local_8 = param_2[1] - param_1[1];
  if ((_DAT_00556a70 < local_8) || (local_8 = param_1[1] - unaff_ESI[1], _DAT_00556a70 < local_8)) {
    local_c = local_8 * local_8 + local_c;
  }
  local_8 = param_2[2] - param_1[2];
  if ((_DAT_00556a70 < local_8) || (local_8 = param_1[2] - unaff_ESI[2], _DAT_00556a70 < local_8)) {
    local_c = local_8 * local_8 + local_c;
  }
  return (float10)local_c;
}

