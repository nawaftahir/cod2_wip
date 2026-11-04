
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00484ba0(undefined4 param_1,float *param_2,float param_3)

{
  float10 fVar1;
  float *unaff_ESI;
  float10 fVar2;
  
  fVar1 = (float10)fcos((float10)(param_3 * _DAT_00556b88));
  fVar2 = (float10)fsin((float10)(param_3 * _DAT_00556b88));
  if (param_2 != (float *)0x0) {
    *param_2 = (float)fVar1;
    param_2[1] = (float)fVar2;
    param_2[2] = 0.0;
  }
  if (unaff_ESI != (float *)0x0) {
    *unaff_ESI = (float)fVar2;
    unaff_ESI[2] = 0.0;
    unaff_ESI[1] = -(float)fVar1;
  }
  return;
}

