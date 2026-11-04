// 10085bf5 size=112 FUN_10085bf5

undefined4 FUN_10085bf5(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined8 param_4)

{
  undefined4 *in_ECX;
  
  *(undefined8 *)(in_ECX + 8) = param_4;
  in_ECX[3] = param_2;
  *(undefined8 *)(in_ECX + 10) = param_4;
  in_ECX[1] = param_1;
  in_ECX[4] = param_3;
  in_ECX[2] = 0xffffffff;
  in_ECX[5] = 0xffffffff;
  in_ECX[0xc] = 0xffffffff;
  in_ECX[0xd] = 0xffffffff;
  in_ECX[0xe] = 0xffffffff;
  in_ECX[0x10] = 0xffffffff;
  in_ECX[0x11] = 0xffffffff;
  in_ECX[0x12] = 0xffffffff;
  in_ECX[0x13] = 0xffffffff;
  in_ECX[0x14] = 0xffffffff;
  in_ECX[0x15] = 0xffffffff;
  in_ECX[0x16] = 0xffffffff;
  in_ECX[0x1b] = 0xffffffff;
  in_ECX[0x1d] = 0xffffffff;
  in_ECX[6] = 1;
  *in_ECX = 0;
  in_ECX[0xf] = 0;
  in_ECX[0x17] = 0;
  in_ECX[0x18] = 0;
  in_ECX[0x19] = 0;
  in_ECX[0x1a] = 0;
  in_ECX[0x1c] = 0;
  return 0;
}


