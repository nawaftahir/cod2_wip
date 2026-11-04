// 10037670 size=78 FUN_10037670

void FUN_10037670(void)

{
  char cVar1;
  char *in_EAX;
  char *pcVar2;
  char *pcVar3;
  
  FUN_10060350();
  pcVar2 = in_EAX;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  if ((char *)0x3f < pcVar2 + (5 - (int)(in_EAX + 1))) {
    FUN_10061cd0(1,&DAT_1019838c);
  }
  pcVar2 = in_EAX + -1;
  do {
    pcVar3 = pcVar2;
    pcVar2 = pcVar3 + 1;
  } while (pcVar3[1] != '\0');
  builtin_strncpy(pcVar3 + 1,".grid",6);
  return;
}


