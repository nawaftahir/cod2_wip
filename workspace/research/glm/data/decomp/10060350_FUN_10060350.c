// 10060350 size=68 FUN_10060350

void FUN_10060350(void)

{
  char cVar1;
  char *in_EAX;
  char *in_ECX;
  char *pcVar2;
  char *pcVar3;
  char *pcVar4;
  
  cVar1 = *in_ECX;
  pcVar2 = (char *)0x0;
  pcVar4 = in_ECX;
  if (cVar1 != '\0') {
    do {
      pcVar3 = pcVar4;
      if ((cVar1 != '.') && ((cVar1 == '/' || (pcVar3 = pcVar2, cVar1 == '\\')))) {
        pcVar3 = (char *)0x0;
      }
      cVar1 = pcVar4[1];
      pcVar4 = pcVar4 + 1;
      pcVar2 = pcVar3;
    } while (cVar1 != '\0');
    if (pcVar3 != (char *)0x0) goto joined_r0x10060382;
  }
  pcVar3 = pcVar4;
joined_r0x10060382:
  for (; in_ECX != pcVar3; in_ECX = in_ECX + 1) {
    *in_EAX = *in_ECX;
    in_EAX = in_EAX + 1;
  }
  *in_EAX = '\0';
  return;
}


