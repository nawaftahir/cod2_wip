// 10083527 size=44 FUN_10083527

undefined4 * FUN_10083527(undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  undefined4 *extraout_EDX;
  
  FUN_100827bb(0x10);
  extraout_EDX[4] = param_1;
  extraout_EDX[5] = param_2;
  extraout_EDX[6] = param_3;
  *extraout_EDX = &PTR_FUN_10110074;
  return extraout_EDX;
}


