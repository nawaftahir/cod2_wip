
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00401cd0(float param_1)

{
  double dVar1;
  double dVar2;
  
  dVar1 = FID_conflict__cos(_DAT_00556b18);
  dVar2 = FID_conflict__cos((double)param_1);
  FUN_004010c0(0x592,(float)dVar2 / (float)dVar1 + _DAT_00556bb4);
  return;
}

