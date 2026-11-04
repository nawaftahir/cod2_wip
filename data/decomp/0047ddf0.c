
void FUN_0047ddf0(void)

{
  char cVar1;
  bool bVar2;
  char *in_EAX;
  char *pcVar3;
  
  cVar1 = *in_EAX;
  bVar2 = false;
  pcVar3 = in_EAX;
  do {
    if (cVar1 == '\0') {
      *pcVar3 = '\0';
      return;
    }
    cVar1 = *in_EAX;
    if ((cVar1 == '/') || (cVar1 == '\\')) {
      if (!bVar2) {
        bVar2 = true;
        *pcVar3 = '\\';
        goto LAB_0047de1b;
      }
    }
    else {
      bVar2 = false;
      *pcVar3 = cVar1;
LAB_0047de1b:
      pcVar3 = pcVar3 + 1;
    }
    cVar1 = in_EAX[1];
    in_EAX = in_EAX + 1;
  } while( true );
}

