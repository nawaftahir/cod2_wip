// 1008317c size=56 FUN_1008317c

undefined4 *
FUN_1008317c(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
            undefined4 param_5)

{
  undefined4 *extraout_EDX;
  
  FUN_100827bb(0xc);
  extraout_EDX[4] = param_1;
  extraout_EDX[5] = param_2;
  extraout_EDX[6] = param_3;
  extraout_EDX[7] = param_4;
  extraout_EDX[8] = param_5;
  *extraout_EDX = &PTR_FUN_10110050;
  return extraout_EDX;
}


