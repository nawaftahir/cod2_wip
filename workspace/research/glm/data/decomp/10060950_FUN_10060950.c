// 10060950 size=83 FUN_10060950

int FUN_10060950(void)

{
  int in_EAX;
  int iVar1;
  char *in_ECX;
  int iVar2;
  char *in_EDX;
  
  do {
    iVar1 = (int)*in_EDX;
    iVar2 = (int)*in_ECX;
    in_EDX = in_EDX + 1;
    in_ECX = in_ECX + 1;
    if (in_EAX == 0) {
      return 0;
    }
    if (iVar1 != iVar2) {
      if ((0x60 < iVar1) && (iVar1 < 0x7b)) {
        iVar1 = iVar1 + -0x20;
      }
      if ((0x60 < iVar2) && (iVar2 < 0x7b)) {
        iVar2 = iVar2 + -0x20;
      }
      if (iVar1 != iVar2) {
        return (uint)(iVar2 <= iVar1) * 2 + -1;
      }
    }
    in_EAX = in_EAX + -1;
    if (iVar1 == 0) {
      return 0;
    }
  } while( true );
}


