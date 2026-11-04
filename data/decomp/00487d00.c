
undefined4 __fastcall FUN_00487d00(float *param_1,float *param_2,float param_3)

{
  float *unaff_ESI;
  float *unaff_EDI;
  
  if ((((*param_2 <= param_3 + *param_1) && (*unaff_ESI <= param_3 + *unaff_EDI)) &&
      (param_2[1] <= param_3 + param_1[1])) && (unaff_ESI[1] <= param_3 + unaff_EDI[1])) {
    return 1;
  }
  return 0;
}

