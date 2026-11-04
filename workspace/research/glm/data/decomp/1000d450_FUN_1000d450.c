// 1000d450 size=42 FUN_1000d450

void FUN_1000d450(void)

{
  char cVar1;
  int in_EAX;
  
  FUN_1000c910();
  cVar1 = FUN_1000fa40();
  if (cVar1 == '\0') {
    FUN_100138c0(1,"failed to load image \'%s\'",*(undefined4 *)(in_EAX + 0x20));
  }
  return;
}


