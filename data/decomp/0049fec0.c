
undefined4 FUN_0049fec0(void)

{
  char cVar1;
  bool bVar2;
  char *in_EAX;
  char *pcVar3;
  int iVar4;
  int iVar5;
  
  if (*in_EAX == '-') {
    in_EAX = in_EAX + 1;
  }
  bVar2 = false;
  pcVar3 = in_EAX;
  do {
    cVar1 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  iVar5 = 0;
  if (0 < (int)pcVar3 - (int)(in_EAX + 1)) {
    do {
      iVar4 = _isdigit((int)in_EAX[iVar5]);
      if (iVar4 == 0) {
        if ((in_EAX[iVar5] != '.') || (bVar2)) {
          return 0;
        }
        bVar2 = true;
      }
      iVar5 = iVar5 + 1;
    } while (iVar5 < (int)pcVar3 - (int)(in_EAX + 1));
  }
  return 1;
}

