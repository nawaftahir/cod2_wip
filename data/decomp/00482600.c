
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_00482600(void)

{
  float *in_EAX;
  double dVar1;
  
  dVar1 = _fabs((double)((in_EAX[2] * in_EAX[2] + in_EAX[1] * in_EAX[1] + *in_EAX * *in_EAX) -
                        _DAT_00556a58));
  if ((float)dVar1 < _DAT_00556c60) {
    return 1;
  }
  return 0;
}

