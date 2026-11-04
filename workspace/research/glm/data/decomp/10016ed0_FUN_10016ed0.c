// 10016ed0 size=83 FUN_10016ed0

void FUN_10016ed0(void)

{
  int in_EAX;
  ushort in_CX;
  
  DAT_101d0b00 = 1;
  *(ushort *)(in_EAX + 8) = in_CX;
  *(undefined2 *)(in_EAX + 10) = (undefined2)DAT_101d0b04;
  (&DAT_101d0b08)[DAT_101d0b04] = in_EAX;
  (&DAT_101d4d28)[in_CX] = in_EAX;
  DAT_101d0b04 = DAT_101d0b04 + 1;
  if (DAT_101d0b04 == 0x400) {
    FUN_100138c0(0,"Too many unique materials (%i or more)\n",0x400);
  }
  return;
}


