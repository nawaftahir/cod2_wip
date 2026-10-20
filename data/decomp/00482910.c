
void FUN_00482910(float *param_1)

{
  int unaff_EBX;
  float *unaff_EDI;
  float local_28;
  float local_24;
  float local_20;
  float local_1c;
  float local_18;
  float local_14;
  float local_10;
  float local_c;
  float local_8;
  
  FUN_004826e0();
  *param_1 = local_1c * unaff_EDI[1] + local_10 * unaff_EDI[2] + local_28 * *unaff_EDI +
             *(float *)(unaff_EBX + 0x10);
  param_1[1] = local_18 * unaff_EDI[1] + local_c * unaff_EDI[2] + local_24 * *unaff_EDI +
               *(float *)(unaff_EBX + 0x14);
  param_1[2] = local_14 * unaff_EDI[1] + local_8 * unaff_EDI[2] + local_20 * *unaff_EDI +
               *(float *)(unaff_EBX + 0x18);
  return;
}

