// 10060ad0 size=38 FUN_10060ad0

void FUN_10060ad0(void)

{
  char *pcVar1;
  char cVar2;
  char *in_EAX;
  
  cVar2 = *in_EAX;
  while (cVar2 != '\0') {
    cVar2 = *in_EAX;
    if (('@' < cVar2) && (cVar2 < '[')) {
      *in_EAX = cVar2 + ' ';
    }
    pcVar1 = in_EAX + 1;
    in_EAX = in_EAX + 1;
    cVar2 = *pcVar1;
  }
  return;
}


