// 10085208 size=72 FUN_10085208

void FUN_10085208(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                 undefined4 param_5)

{
  undefined4 *in_ECX;
  
  FUN_100827bb(0x13);
  in_ECX[4] = param_1;
  in_ECX[5] = param_2;
  in_ECX[6] = param_3;
  in_ECX[7] = param_4;
  in_ECX[10] = param_5;
  *in_ECX = &PTR_FUN_101103ec;
  in_ECX[8] = 0xf0000;
  in_ECX[9] = 0xe40000;
  return;
}


