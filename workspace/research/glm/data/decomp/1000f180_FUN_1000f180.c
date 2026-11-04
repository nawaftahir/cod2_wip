// 1000f180 size=285 FUN_1000f180

void FUN_1000f180(void)

{
  int iVar1;
  float *in_EDX;
  byte *unaff_ESI;
  
  iVar1 = (int)ROUND(*in_EDX * 255.0 + 9.313226e-10);
  if (-1 < iVar1 + -0xff) {
    iVar1 = 0xff;
  }
  unaff_ESI[2] = (-1 < -iVar1) - 1U & (byte)iVar1;
  iVar1 = (int)ROUND(in_EDX[1] * 255.0 + 9.313226e-10);
  if (-1 < iVar1 + -0xff) {
    iVar1 = 0xff;
  }
  unaff_ESI[1] = (-1 < -iVar1) - 1U & (byte)iVar1;
  iVar1 = (int)ROUND(in_EDX[2] * 255.0 + 9.313226e-10);
  if (-1 < iVar1 + -0xff) {
    iVar1 = 0xff;
  }
  *unaff_ESI = (-1 < -iVar1) - 1U & (byte)iVar1;
  iVar1 = (int)ROUND(in_EDX[3] * 255.0 + 9.313226e-10);
  if (-1 < iVar1 + -0xff) {
    iVar1 = 0xff;
  }
  unaff_ESI[3] = (-1 < -iVar1) - 1U & (byte)iVar1;
  return;
}


