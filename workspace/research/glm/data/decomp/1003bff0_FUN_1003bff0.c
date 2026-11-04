// 1003bff0 size=87 FUN_1003bff0

void FUN_1003bff0(void)

{
  int in_EAX;
  
  if ((*(char *)(DAT_101ce684 + 8) != '\0') && (*(char *)(DAT_101d1b9c + 0x160) != '\0')) {
    if (DAT_1072debd != '\0') {
      FUN_1002e380();
    }
    FUN_1003b550(&DAT_10764590 + in_EAX * 0x30);
    FUN_1003bf00(&DAT_10764590 + in_EAX * 0x30);
  }
  return;
}


