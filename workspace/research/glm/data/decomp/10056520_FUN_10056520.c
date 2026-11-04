// 10056520 size=148 FUN_10056520

void FUN_10056520(void)

{
  int *in_EAX;
  undefined4 *puVar1;
  
  puVar1 = (undefined4 *)(**(code **)in_EAX[1])();
  in_EAX[0x6c] = (int)puVar1;
  *puVar1 = &LAB_10056400;
  puVar1[2] = &DAT_100564f0;
  puVar1[3] = &LAB_10056500;
  puVar1[0x11] = 0;
  puVar1[0xd] = 0;
  if (4 < in_EAX[0x1b]) {
    *(undefined4 *)(*in_EAX + 0x14) = 0x37;
    *(undefined4 *)(*in_EAX + 0x18) = 4;
    (**(code **)*in_EAX)();
  }
  if (0x100 < in_EAX[0x17]) {
    *(undefined4 *)(*in_EAX + 0x14) = 0x39;
    *(undefined4 *)(*in_EAX + 0x18) = 0x100;
    (**(code **)*in_EAX)();
  }
  FUN_10055a90();
  FUN_10055c10();
  if (in_EAX[0x15] == 2) {
    FUN_100563c0();
  }
  return;
}


