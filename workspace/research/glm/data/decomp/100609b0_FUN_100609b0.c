// 100609b0 size=53 FUN_100609b0

int FUN_100609b0(void)

{
  char cVar1;
  char cVar2;
  int in_EAX;
  char *in_ECX;
  char *in_EDX;
  
  while( true ) {
    cVar1 = *in_EDX;
    cVar2 = *in_ECX;
    in_EDX = in_EDX + 1;
    in_ECX = in_ECX + 1;
    if (in_EAX == 0) {
      return 0;
    }
    if (cVar1 != cVar2) break;
    in_EAX = in_EAX + -1;
    if (cVar1 == '\0') {
      return 0;
    }
  }
  return (uint)(cVar2 <= cVar1) * 2 + -1;
}


