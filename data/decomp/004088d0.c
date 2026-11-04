
char * FUN_004088d0(void)

{
  char *pcVar1;
  char *in_EAX;
  int iVar2;
  char *pcVar3;
  char *unaff_EDI;
  
  if ((unaff_EDI == (char *)0x0) && (DAT_0124a0ab == '\0')) {
    iVar2 = FUN_0047d980(&DAT_0053f3d4,"\\trees\\cod2src\\libs\\cmdlib\\cmdlib.cpp",0x203);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a0ab = '\x01';
    }
  }
  if (in_EAX != (char *)0x0) {
    if ((in_EAX < unaff_EDI) && (DAT_0124a0aa == '\0')) {
      iVar2 = FUN_0047d980("pos >= path","\\trees\\cod2src\\libs\\cmdlib\\cmdlib.cpp",0x208,0,1);
      if (iVar2 == 0) {
        DebugBreak();
      }
      else if (iVar2 == 2) {
        DAT_0124a0aa = '\x01';
      }
    }
    if (*in_EAX != '\0') {
      if (in_EAX == unaff_EDI) {
        return (char *)0x0;
      }
      if ((in_EAX[-1] != '/') && (DAT_0124a0a9 == '\0')) {
        iVar2 = FUN_0047d980("*pos == \'\\0\' || pos == path || pos[-1] == \'/\'",
                             "\\trees\\cod2src\\libs\\cmdlib\\cmdlib.cpp",0x209,0,1);
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_0124a0a9 = '\x01';
        }
      }
    }
    if (in_EAX != unaff_EDI) {
      do {
        pcVar3 = in_EAX + -1;
        if (pcVar3 == unaff_EDI) {
          return pcVar3;
        }
        pcVar1 = in_EAX + -2;
        in_EAX = pcVar3;
      } while (*pcVar1 != '/');
      return pcVar3;
    }
  }
  return (char *)0x0;
}

