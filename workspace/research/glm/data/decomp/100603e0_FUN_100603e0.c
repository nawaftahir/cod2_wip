// 100603e0 size=108 FUN_100603e0

void FUN_100603e0(undefined4 param_1,undefined4 param_2)

{
  char cVar1;
  char *in_EAX;
  char *pcVar2;
  char local_40 [63];
  undefined1 local_1;
  
  pcVar2 = in_EAX;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  cVar1 = in_EAX[(int)(pcVar2 + (-1 - (int)(in_EAX + 1)))];
  for (pcVar2 = in_EAX + (int)(pcVar2 + (-1 - (int)(in_EAX + 1)));
      (cVar1 != '/' && (pcVar2 != in_EAX)); pcVar2 = pcVar2 + -1) {
    if (cVar1 == '.') {
      return;
    }
    cVar1 = pcVar2[-1];
  }
  _strncpy(local_40,in_EAX,0x3f);
  local_1 = 0;
  FUN_10060c10(&DAT_10194930,local_40,param_2);
  return;
}


