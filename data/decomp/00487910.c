
void __fastcall FUN_00487910(float *param_1,float *param_2)

{
  float *unaff_ESI;
  
  if (*param_1 < *param_2) {
    *param_2 = *param_1;
  }
  if (*unaff_ESI < *param_1) {
    *unaff_ESI = *param_1;
  }
  if (param_1[1] < param_2[1]) {
    param_2[1] = param_1[1];
  }
  if (unaff_ESI[1] < param_1[1]) {
    unaff_ESI[1] = param_1[1];
  }
  if (param_1[2] < param_2[2]) {
    param_2[2] = param_1[2];
  }
  if (unaff_ESI[2] < param_1[2]) {
    unaff_ESI[2] = param_1[2];
  }
  return;
}

