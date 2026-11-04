// 1001fda0 size=35 FUN_1001fda0

void FUN_1001fda0(void)

{
  undefined4 *in_EAX;
  int in_ECX;
  
  *(undefined4 *)(in_ECX + 0x14) = *in_EAX;
  *(undefined4 *)(in_ECX + 0x18) = in_EAX[1];
  *(undefined4 *)(in_ECX + 0x1c) = in_EAX[2];
  *(undefined4 *)(in_ECX + 0x20) = *in_EAX;
  *(undefined4 *)(in_ECX + 0x24) = in_EAX[1];
  *(undefined4 *)(in_ECX + 0x28) = in_EAX[2];
  return;
}


