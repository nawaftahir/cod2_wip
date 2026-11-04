// 10058310 size=105 FUN_10058310

void FUN_10058310(void)

{
  float *unaff_EBX;
  float *unaff_ESI;
  int unaff_EDI;
  float local_24;
  float local_20;
  float local_1c;
  float local_18;
  float local_14;
  float local_10;
  float local_c;
  float local_8;
  float local_4;
  
  FUN_1001d660();
  *unaff_EBX = local_18 * unaff_ESI[1] + local_c * unaff_ESI[2] + local_24 * *unaff_ESI +
               *(float *)(unaff_EDI + 0x10);
  unaff_EBX[1] = local_14 * unaff_ESI[1] + local_8 * unaff_ESI[2] + local_20 * *unaff_ESI +
                 *(float *)(unaff_EDI + 0x14);
  unaff_EBX[2] = local_10 * unaff_ESI[1] + local_4 * unaff_ESI[2] + local_1c * *unaff_ESI +
                 *(float *)(unaff_EDI + 0x18);
  return;
}


