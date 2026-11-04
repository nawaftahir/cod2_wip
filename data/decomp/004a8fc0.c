
undefined4 FUN_004a8fc0(void)

{
  char cVar1;
  int in_EAX;
  int iVar2;
  char *pcVar3;
  
  if (in_EAX == 0) {
    if (DAT_0124a71f == '\0') {
      iVar2 = FUN_0047d980("stringValue","\\trees\\cod2src\\src\\script\\scr_stringlist.cpp",0x1b2,0
                           ,1);
      if (iVar2 == 0) {
        DebugBreak();
      }
      else if (iVar2 == 2) {
        DAT_0124a71f = '\x01';
      }
    }
    pcVar3 = (char *)0x0;
  }
  else {
    iVar2 = FUN_004a87b0();
    pcVar3 = (char *)(iVar2 + 4);
  }
  cVar1 = *pcVar3;
  while( true ) {
    if (cVar1 == '\0') {
      return 1;
    }
    iVar2 = _tolower((int)cVar1);
    if (*pcVar3 != (char)iVar2) break;
    cVar1 = pcVar3[1];
    pcVar3 = pcVar3 + 1;
  }
  return 0;
}

