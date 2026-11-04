// 10082916 size=50 FUN_10082916

undefined4 *
FUN_10082916(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  undefined4 *extraout_EDX;
  
  FUN_100827bb(2);
  extraout_EDX[4] = param_1;
  extraout_EDX[2] = param_2;
  extraout_EDX[3] = param_3;
  extraout_EDX[5] = param_4;
  *extraout_EDX = &PTR_FUN_1010ffd8;
  return extraout_EDX;
}


