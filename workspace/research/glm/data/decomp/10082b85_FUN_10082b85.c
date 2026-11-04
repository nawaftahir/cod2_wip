// 10082b85 size=56 FUN_10082b85

undefined4 *
FUN_10082b85(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
            undefined4 param_5)

{
  undefined4 *extraout_EDX;
  
  FUN_100827bb(5);
  extraout_EDX[4] = param_1;
  extraout_EDX[5] = param_2;
  extraout_EDX[6] = param_3;
  extraout_EDX[7] = param_4;
  extraout_EDX[8] = param_5;
  *extraout_EDX = &PTR_FUN_1010fffc;
  return extraout_EDX;
}


