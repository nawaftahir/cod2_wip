
void FUN_004b1d40(void)

{
  int in_EAX;
  int iVar1;
  
  FUN_004b1750();
  FUN_004b1750();
  FUN_004b1550(in_EAX + 0xb28);
  iVar1 = 0x12;
  do {
    if (*(short *)(in_EAX + 0xa76 + (uint)(byte)(&DAT_0053e1f4)[iVar1] * 4) != 0) break;
    iVar1 = iVar1 + -1;
  } while (2 < iVar1);
  *(int *)(in_EAX + 0x16a0) = *(int *)(in_EAX + 0x16a0) + iVar1 * 3 + 0x11;
  return;
}

