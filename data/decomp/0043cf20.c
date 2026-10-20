
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0043cf20(float param_1)

{
  char *unaff_ESI;
  double dVar1;
  
  dVar1 = _fabs((double)param_1);
  if ((float)dVar1 < _DAT_00556bb0) {
    _sprintf(unaff_ESI,"%.6f",(double)param_1);
    return;
  }
  _sprintf(unaff_ESI,"%.6g",(double)param_1);
  return;
}

