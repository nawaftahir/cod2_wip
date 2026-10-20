
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00483a50(float *param_1,undefined4 *param_2)

{
  float fVar1;
  float fVar2;
  float fVar3;
  undefined4 *unaff_ESI;
  
  fVar1 = *param_1 * *param_1;
  fVar2 = param_1[1] * param_1[1];
  fVar3 = param_1[2] * param_1[2];
  if ((fVar1 <= fVar3) && (fVar2 <= fVar3)) {
    if (_DAT_00556a70 < param_1[2]) {
      *unaff_ESI = 0;
      *param_2 = 1;
      return;
    }
    *unaff_ESI = 1;
    *param_2 = 0;
    return;
  }
  if ((fVar1 <= fVar2) && (fVar3 <= fVar2)) {
    if (_DAT_00556a70 < param_1[1]) {
      *unaff_ESI = 2;
      *param_2 = 0;
      return;
    }
    *unaff_ESI = 0;
    *param_2 = 2;
    return;
  }
  if (_DAT_00556a70 < *param_1) {
    *unaff_ESI = 1;
    *param_2 = 2;
    return;
  }
  *unaff_ESI = 2;
  *param_2 = 1;
  return;
}

