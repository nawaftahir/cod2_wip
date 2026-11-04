// 10047b40 size=45 FUN_10047b40

void FUN_10047b40(void)

{
  int in_EAX;
  char *in_ECX;
  int in_EDX;
  
  if (*(char *)(in_EDX + 0xc) == '\0') {
    for (; in_EAX != 0; in_EAX = in_EAX + -1) {
      FUN_100479a0((int)*in_ECX);
      in_ECX = in_ECX + 1;
    }
  }
  return;
}


