
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00488090(undefined4 param_1)

{
  float fVar1;
  int extraout_EDX;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  
  FUN_00484ba0(param_1);
  fVar1 = _DAT_00556a70 - local_10;
  *(undefined4 *)(extraout_EDX + 0x18) = 0;
  *(undefined4 *)(extraout_EDX + 0x1c) = 0;
  *(undefined4 *)(extraout_EDX + 0x20) = 0x3f800000;
  *(float *)(extraout_EDX + 0xc) = fVar1;
  *(float *)(extraout_EDX + 0x10) = _DAT_00556a70 - local_c;
  *(float *)(extraout_EDX + 0x14) = _DAT_00556a70 - local_8;
  return;
}

