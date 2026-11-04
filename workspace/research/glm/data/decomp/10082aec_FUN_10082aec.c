// 10082aec size=50 FUN_10082aec

undefined4 *
FUN_10082aec(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  undefined4 *extraout_EDX;
  
  FUN_100827bb(4);
  extraout_EDX[4] = param_1;
  extraout_EDX[5] = param_2;
  extraout_EDX[6] = param_3;
  extraout_EDX[7] = param_4;
  *extraout_EDX = &PTR_FUN_1010fff0;
  return extraout_EDX;
}


