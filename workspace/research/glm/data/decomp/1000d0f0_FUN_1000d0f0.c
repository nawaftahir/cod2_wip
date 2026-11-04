// 1000d0f0 size=74 FUN_1000d0f0

void FUN_1000d0f0(void)

{
  int in_EAX;
  
  if (*(char *)(in_EAX + 0x1e) == '\x05') {
    if (*(int *)(DAT_101ce708 + 8) == 2) {
      FUN_1000ce80(1,0x200,0);
      return;
    }
    FUN_1000ce80(0,0x200,0);
  }
  return;
}


