// 10007e10 size=95 FUN_10007e10

undefined4 FUN_10007e10(void)

{
  float *pfVar1;
  uint uVar2;
  int in_EAX;
  int in_ECX;
  float *in_EDX;
  
  if (in_ECX != 0) {
    pfVar1 = *(float **)(in_EAX + 0x20);
    uVar2 = (uint)*(byte *)(in_EAX + 0x24);
    do {
      while( true ) {
        if (uVar2 == 0) {
          return 1;
        }
        if (0.0 < *pfVar1 * *in_EDX + pfVar1[2] * in_EDX[2] + pfVar1[1] * in_EDX[1] + in_EDX[3])
        break;
        pfVar1 = pfVar1 + 3;
        uVar2 = uVar2 - 1;
      }
      in_ECX = in_ECX + -1;
      in_EDX = in_EDX + 5;
      pfVar1 = *(float **)(in_EAX + 0x20);
      uVar2 = (uint)*(byte *)(in_EAX + 0x24);
    } while (in_ECX != 0);
  }
  return 0;
}


