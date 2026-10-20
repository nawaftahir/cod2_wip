
undefined4 * __thiscall FUN_004bb590(undefined4 *param_1,undefined4 param_2)

{
  undefined4 *puVar1;
  
  *param_1 = &PTR_FUN_005298b4;
  param_1[0xe] = 0;
  param_1[0xc] = 0;
  param_1[0x11] = 0;
  param_1[0xf] = 0;
  param_1[0x14] = 0;
  param_1[0x12] = 0;
  param_1[1] = param_2;
  puVar1 = (undefined4 *)FUN_004ff450(0x10);
  if (puVar1 == (undefined4 *)0x0) {
    puVar1 = (undefined4 *)0x0;
  }
  else {
    puVar1[2] = 0;
    puVar1[1] = 0;
    *puVar1 = &DAT_00598c80;
    puVar1[3] = 0;
  }
  param_1[4] = puVar1;
  puVar1 = (undefined4 *)FUN_004ff450(0x28);
  if (puVar1 == (undefined4 *)0x0) {
    puVar1 = (undefined4 *)0x0;
  }
  else {
    puVar1[2] = 0;
    puVar1[1] = 0;
    *puVar1 = &DAT_00598c80;
    FUN_004c5790();
    FUN_004c5e50();
  }
  param_1[5] = puVar1;
  param_1[2] = 0;
  param_1[0x15] = 700;
  param_1[0x16] = 2000;
  return param_1;
}

