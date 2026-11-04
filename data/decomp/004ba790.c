
undefined4 * __thiscall FUN_004ba790(undefined4 *param_1,int *param_2,undefined4 param_3)

{
  undefined4 uVar1;
  int iVar2;
  
  *param_1 = &PTR_FUN_005297a8;
  param_1[1] = 0;
  param_1[2] = 0;
  param_1[9] = 0;
  param_1[8] = 0;
  param_1[7] = &DAT_00598c80;
  param_1[0xc] = 0;
  param_1[0xb] = 0;
  param_1[10] = &DAT_00598c80;
  param_1[0xf] = 0;
  param_1[0xe] = 0;
  param_1[0xd] = &DAT_00598c80;
  param_1[3] = param_2;
  uVar1 = (**(code **)(*param_2 + 0x40))(param_3);
  param_1[4] = uVar1;
  iVar2 = (**(code **)(*param_2 + 0x40))(param_3);
  param_1[5] = iVar2;
  *(undefined4 *)(iVar2 + 0x20) = 1;
  param_1[0x13] = 0;
  param_1[0x12] = 0;
  param_1[0x11] = 0;
  param_1[0x10] = 0;
  iVar2 = FUN_004ff450(0xa0);
  if (iVar2 != 0) {
    uVar1 = FUN_004c6b70();
    param_1[0x14] = 0;
    param_1[6] = uVar1;
    return param_1;
  }
  param_1[0x14] = 0;
  param_1[6] = 0;
  return param_1;
}

