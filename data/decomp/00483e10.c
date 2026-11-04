
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

uint FUN_00483e10(void)

{
  float *in_EAX;
  
  return (((int)ROUND(in_EAX[2] * _DAT_00556b90 + (float)_DAT_00556b28) & 0x3ffU) << 10 |
         (int)ROUND(in_EAX[1] * _DAT_00556b90 + (float)_DAT_00556b28) & 0x3ffU) << 10 |
         (int)ROUND(*in_EAX * _DAT_00556b90 + (float)_DAT_00556b28) & 0x3ffU;
}

