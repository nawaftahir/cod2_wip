// 1002d1c0 size=119 FUN_1002d1c0

void FUN_1002d1c0(void)

{
  int in_EAX;
  undefined4 *puVar1;
  int in_ECX;
  undefined4 *puVar2;
  int in_EDX;
  
  if (0 < in_EDX) {
    puVar2 = (undefined4 *)(in_ECX + 0x38);
    puVar1 = (undefined4 *)(in_EAX + 0x18);
    do {
      puVar1[-6] = puVar2[-2];
      puVar1[-5] = puVar2[-1];
      puVar1[-4] = *puVar2;
      puVar1[-3] = 0x3f800000;
      puVar1[-2] = puVar2[-0xe];
      puVar1[-1] = puVar2[-0xd];
      *puVar1 = puVar2[-0xc];
      puVar1[1] = puVar2[-0xb];
      puVar1[2] = puVar2[-7];
      puVar1[3] = puVar2[-3];
      puVar1[4] = puVar2[-10];
      puVar1[5] = puVar2[-9];
      puVar1[6] = puVar2[-8];
      puVar1[7] = puVar2[-6];
      puVar1[8] = puVar2[-5];
      puVar1[9] = puVar2[-4];
      puVar2 = puVar2 + 0x10;
      puVar1 = puVar1 + 0x10;
      in_EDX = in_EDX + -1;
    } while (in_EDX != 0);
  }
  return;
}


