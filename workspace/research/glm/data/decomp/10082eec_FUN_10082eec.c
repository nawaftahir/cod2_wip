// 10082eec size=94 FUN_10082eec

undefined4 *
FUN_10082eec(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
            undefined4 param_5,undefined4 param_6,undefined4 param_7,undefined4 param_8,
            undefined4 param_9,undefined4 param_10)

{
  undefined4 *extraout_EDX;
  
  FUN_100827bb(10);
  extraout_EDX[4] = param_1;
  extraout_EDX[5] = param_2;
  extraout_EDX[0xe] = 0;
  extraout_EDX[0xf] = 0;
  extraout_EDX[6] = param_3;
  extraout_EDX[7] = param_4;
  extraout_EDX[8] = param_5;
  extraout_EDX[9] = param_6;
  extraout_EDX[10] = param_7;
  extraout_EDX[0xb] = param_8;
  extraout_EDX[0xc] = param_9;
  extraout_EDX[0xd] = param_10;
  *extraout_EDX = &PTR_FUN_10110038;
  return extraout_EDX;
}


