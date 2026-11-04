// 10082c4b size=65 FUN_10082c4b

undefined4 *
FUN_10082c4b(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  undefined4 *extraout_EDX;
  
  FUN_100827bb(6);
  extraout_EDX[4] = param_1;
  extraout_EDX[5] = param_2;
  extraout_EDX[6] = param_3;
  extraout_EDX[7] = param_4;
  extraout_EDX[9] = 0xffffffff;
  extraout_EDX[8] = 0;
  extraout_EDX[10] = 0;
  extraout_EDX[0xb] = 0;
  *extraout_EDX = &PTR_FUN_10110008;
  return extraout_EDX;
}


