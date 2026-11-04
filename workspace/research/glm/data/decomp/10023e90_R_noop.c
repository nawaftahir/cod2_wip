// 10023e90 size=57 R_noop

void R_noop(int param_1,int param_2)

{
  undefined4 *puVar1;
  
  if (0 < param_1) {
    puVar1 = (undefined4 *)(param_2 + 0x14);
    do {
      puVar1[-2] = 0;
      puVar1[-1] = 0;
      *puVar1 = 0x3f800000;
      puVar1[6] = 0;
      puVar1[7] = 0x3f800000;
      puVar1[8] = 0;
      puVar1[9] = 0x3f800000;
      puVar1[10] = 0;
      puVar1[0xb] = 0;
      puVar1 = puVar1 + 0x11;
      param_1 = param_1 + -1;
    } while (param_1 != 0);
  }
  return;
}


