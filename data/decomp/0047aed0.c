
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_0047aed0(float *param_1)

{
  float fVar1;
  int in_EAX;
  undefined4 *unaff_EDI;
  
  *param_1 = DAT_01139e54;
  param_1[1] = DAT_01139e58;
  param_1[2] = DAT_01139e5c;
  fVar1 = (float)(in_EAX - DAT_01139e4c / 2) / DAT_01139e60;
  param_1[1] = -262144.0;
  param_1[2] = fVar1 + param_1[2];
  if (DAT_010a44b8 != &DAT_010a44b4) {
    *param_1 = (*(float *)(DAT_010a44b8[5] + 0x2c) + *(float *)(DAT_010a44b8[5] + 0x20)) *
               _DAT_00556b30;
  }
  *unaff_EDI = 0;
  unaff_EDI[1] = 0x3f800000;
  unaff_EDI[2] = 0;
  return;
}

