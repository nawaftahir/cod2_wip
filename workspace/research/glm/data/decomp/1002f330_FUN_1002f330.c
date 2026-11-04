// 1002f330 size=187 FUN_1002f330

int FUN_1002f330(void)

{
  int in_EAX;
  int in_ECX;
  int in_EDX;
  
  if ((in_EAX == 6) && (in_EDX == 0x1f)) {
    if (in_ECX == 0x7fe) {
      in_EAX = 9;
    }
    else if (in_ECX == 0x7ff) {
      in_EAX = 0xf;
    }
    else {
      in_EAX = ((*(int *)(in_ECX * 0x74 + DAT_1072ddc4) != 2) - 1 & 3) + 9;
    }
  }
  else {
    if (((*(char *)(DAT_101ce748 + 8) == '\0') && ((in_EAX == 0 || (in_EAX == 2)))) &&
       ((in_ECX == 0x7ff ||
        (((in_ECX < 0x7fe && (*(int *)(in_ECX * 0x74 + DAT_1072ddc4) < 3)) &&
         ((*(uint *)(in_ECX * 0x74 + DAT_1072ddc4 + 4) & 0x100) == 0)))))) {
      return -1;
    }
    if (in_EAX < 3) {
      return in_EAX;
    }
    if (0x1a < in_EAX) {
      return in_EAX;
    }
  }
  if (*(char *)(DAT_101ce828 + 8) != '\0') {
    return in_EAX + *(int *)(DAT_106d3194 + 0x219cec);
  }
  return in_EAX;
}


