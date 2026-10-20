
char * FUN_00495d90(void)

{
  char *in_EAX;
  int iVar1;
  char *pcVar2;
  char *pcVar3;
  char cVar4;
  
  if ((in_EAX == (char *)0x0) && (DAT_0124a506 == '\0')) {
    iVar1 = FUN_0047d980("filename","\\trees\\cod2src\\src\\universal\\q_shared.cpp",0xaa);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a506 = '\x01';
    }
  }
  cVar4 = *in_EAX;
  pcVar2 = (char *)0x0;
  if (cVar4 != '\0') {
    do {
      pcVar3 = in_EAX;
      if ((cVar4 != '.') && ((cVar4 == '/' || (pcVar3 = pcVar2, cVar4 == '\\')))) {
        pcVar3 = (char *)0x0;
      }
      cVar4 = in_EAX[1];
      in_EAX = in_EAX + 1;
      pcVar2 = pcVar3;
    } while (cVar4 != '\0');
    if (pcVar3 != (char *)0x0) {
      return pcVar3;
    }
  }
  return in_EAX;
}

