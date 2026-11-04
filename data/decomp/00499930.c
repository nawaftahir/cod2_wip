
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00499930(undefined4 param_1)

{
  float fVar1;
  float *unaff_ESI;
  float10 fVar2;
  
  fVar2 = (float10)FUN_0041f0a0(param_1);
  if ((float)fVar2 != _DAT_00556a70) {
    fVar1 = _DAT_00556a58 / (float)fVar2;
    *unaff_ESI = fVar1 * *unaff_ESI;
    unaff_ESI[1] = fVar1 * unaff_ESI[1];
    unaff_ESI[2] = fVar1 * unaff_ESI[2];
  }
  return;
}

