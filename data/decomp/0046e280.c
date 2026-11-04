
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

char * FUN_0046e280(void)

{
  char *pcVar1;
  char *in_EAX;
  char cVar2;
  int iVar3;
  int iVar4;
  
  iVar3 = 0;
  DAT_010bc920 = 0;
  if (in_EAX != (char *)0x0) {
    cVar2 = *in_EAX;
    while( true ) {
      while (' ' < cVar2) {
        if (cVar2 != '/') {
          if (cVar2 == '\"') {
            cVar2 = in_EAX[1];
            pcVar1 = in_EAX + 2;
            while (cVar2 != '\"') {
              (&DAT_010bc920)[iVar3] = cVar2;
              iVar3 = iVar3 + 1;
              cVar2 = *pcVar1;
              pcVar1 = pcVar1 + 1;
            }
            (&DAT_010bc920)[iVar3] = 0;
            return pcVar1;
          }
          if ((((cVar2 == '{') || (cVar2 == '}')) || (cVar2 == ')')) ||
             (((cVar2 == '(' || (cVar2 == '\'')) || (cVar2 == ':')))) {
            DAT_010bc920 = cVar2;
            DAT_010bc921 = 0;
            return in_EAX + 1;
          }
          goto LAB_0046e320;
        }
        if (in_EAX[1] != '/') goto LAB_0046e320;
        cVar2 = *in_EAX;
        while ((cVar2 != '\0' && (cVar2 != '\n'))) {
          pcVar1 = in_EAX + 1;
          in_EAX = in_EAX + 1;
          cVar2 = *pcVar1;
        }
      }
      if (cVar2 == '\0') break;
      cVar2 = in_EAX[1];
      in_EAX = in_EAX + 1;
    }
    _DAT_010bc918 = 1;
  }
  return (char *)0x0;
LAB_0046e320:
  iVar4 = iVar3;
  in_EAX = in_EAX + 1;
  (&DAT_010bc920)[iVar4] = cVar2;
  cVar2 = *in_EAX;
  if ((cVar2 == '{') || (cVar2 == '}')) {
LAB_0046e34e:
    (&DAT_010bc921)[iVar4] = 0;
    return in_EAX;
  }
  if ((cVar2 == ')') ||
     ((((cVar2 == '(' || (cVar2 == '\'')) || (cVar2 == ':')) || (iVar3 = iVar4 + 1, cVar2 < '!'))))
  goto LAB_0046e34e;
  goto LAB_0046e320;
}

