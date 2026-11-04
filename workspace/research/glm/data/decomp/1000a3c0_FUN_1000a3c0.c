// 1000a3c0 size=389 FUN_1000a3c0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1000a3c0(void)

{
  float *in_ECX;
  int extraout_ECX;
  undefined1 extraout_DL;
  float10 fVar1;
  
  _DAT_101ce5d0 = *in_ECX;
  _DAT_101ce5d4 = in_ECX[1];
  _DAT_101ce5d8 = in_ECX[2];
  _DAT_101ce5dc = 0x3f800000;
  DAT_101ce588 = in_ECX[3];
  DAT_101ce58c = in_ECX[4];
  DAT_101ce590 = in_ECX[5];
  DAT_101ce5b0 = &DAT_101ce588;
  DAT_101ce598 = ((int)DAT_101ce588 < 1) - 1U & 0xc;
  DAT_101ce599 = (((int)DAT_101ce58c < 1) - 1U & 0xc) + 4;
  _DAT_101ce594 =
       0.1 - (DAT_101ce588 * _DAT_101ce5d0 +
             DAT_101ce58c * _DAT_101ce5d4 + DAT_101ce590 * _DAT_101ce5d8);
  DAT_101ce59a = (((int)DAT_101ce590 < 1) - 1U & 0xc) + 8;
  DAT_101ce59b = 0xff;
  fVar1 = (float10)R_GetFarPlaneDist();
  if (fVar1 < (float10)0.0 != (fVar1 == (float10)0.0)) {
    DAT_101ce5b4 = (undefined4 *)0x0;
    return;
  }
  DAT_101ce59c = -*(float *)(extraout_ECX + 0xc);
  DAT_101ce5a0 = -*(float *)(extraout_ECX + 0x10);
  DAT_101ce5a4 = (float)-(float10)*(float *)(extraout_ECX + 0x14);
  DAT_101ce5af = extraout_DL;
  DAT_101ce5b4 = &DAT_101ce59c;
  DAT_101ce5ac = ((int)DAT_101ce59c < 1) - 1U & 0xc;
  _DAT_101ce5a8 =
       (float)(fVar1 - ((float10)DAT_101ce59c * (float10)_DAT_101ce5d0 +
                       (float10)DAT_101ce5a0 * (float10)_DAT_101ce5d4 +
                       -(float10)*(float *)(extraout_ECX + 0x14) * (float10)_DAT_101ce5d8));
  DAT_101ce5ad = (((int)DAT_101ce5a0 < 1) - 1U & 0xc) + 4;
  DAT_101ce5ae = (((int)DAT_101ce5a4 < 1) - 1U & 0xc) + 8;
  return;
}


