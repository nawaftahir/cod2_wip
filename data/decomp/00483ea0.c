
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00483ea0(int param_1)

{
  float *in_EAX;
  
  *in_EAX = (float)((param_1 << 0x16) >> 0x16) * _DAT_00556aa0;
  in_EAX[1] = (float)((param_1 << 0xc) >> 0x16) * _DAT_00556aa0;
  in_EAX[2] = (float)((param_1 << 2) >> 0x16) * _DAT_00556aa0;
  return;
}

