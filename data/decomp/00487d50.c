
void __fastcall FUN_00487d50(float *param_1,float *param_2)

{
  float *unaff_ESI;
  float *unaff_EDI;
  
  if (*param_2 < *param_1) {
    *param_1 = *param_2;
  }
  if (*unaff_ESI < *unaff_EDI) {
    *unaff_ESI = *unaff_EDI;
  }
  if (param_2[1] < param_1[1]) {
    param_1[1] = param_2[1];
  }
  if (unaff_ESI[1] < unaff_EDI[1]) {
    unaff_ESI[1] = unaff_EDI[1];
  }
  if (param_2[2] < param_1[2]) {
    param_1[2] = param_2[2];
  }
  if (unaff_ESI[2] < unaff_EDI[2]) {
    unaff_ESI[2] = unaff_EDI[2];
  }
  return;
}

