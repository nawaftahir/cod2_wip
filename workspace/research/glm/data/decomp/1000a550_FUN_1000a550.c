// 1000a550 size=194 FUN_1000a550

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1000a550(void)

{
  int in_EAX;
  
  _DAT_101ce5d0 = -*(float *)(in_EAX + 0xc);
  _DAT_101ce5d4 = -*(float *)(in_EAX + 0x10);
  _DAT_101ce5dc = 0;
  _DAT_101ce5d8 = -*(float *)(in_EAX + 0x14);
  DAT_101ce588 = *(float *)(in_EAX + 0xc);
  DAT_101ce58c = *(float *)(in_EAX + 0x10);
  DAT_101ce590 = *(float *)(in_EAX + 0x14);
  DAT_101ce5b0 = 0;
  DAT_101ce5b4 = 0;
  DAT_101ce598 = ((int)DAT_101ce588 < 1) - 1U & 0xc;
  _DAT_101ce594 =
       262144.0 -
       (DAT_101ce588 * -*(float *)(in_EAX + 0xc) +
       DAT_101ce58c * -*(float *)(in_EAX + 0x10) + DAT_101ce590 * -*(float *)(in_EAX + 0x14));
  DAT_101ce599 = (((int)DAT_101ce58c < 1) - 1U & 0xc) + 4;
  DAT_101ce59a = (((int)DAT_101ce590 < 1) - 1U & 0xc) + 8;
  return;
}


