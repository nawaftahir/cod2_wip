
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_00499890(void)

{
  float *unaff_ESI;
  float *unaff_EDI;
  double dVar1;
  
  dVar1 = _fabs((double)(*unaff_EDI - *unaff_ESI));
  if ((float)dVar1 <= _DAT_00556b34) {
    dVar1 = _fabs((double)(unaff_EDI[1] - unaff_ESI[1]));
    if ((float)dVar1 <= _DAT_00556b34) {
      dVar1 = _fabs((double)(unaff_EDI[2] - unaff_ESI[2]));
      if ((float)dVar1 <= _DAT_00556b34) {
        return 1;
      }
    }
  }
  return 0;
}

