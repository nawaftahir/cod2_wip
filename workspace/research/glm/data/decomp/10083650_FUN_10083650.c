// 10083650 size=38 FUN_10083650

undefined4 * FUN_10083650(undefined4 param_1,undefined4 param_2)

{
  undefined4 *extraout_EDX;
  
  FUN_100827bb(0x11);
  extraout_EDX[4] = param_1;
  extraout_EDX[5] = param_2;
  *extraout_EDX = &PTR_FUN_1011008c;
  return extraout_EDX;
}


