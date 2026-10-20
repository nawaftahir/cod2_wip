
undefined1 * FUN_0047a4f0(void)

{
  char cVar1;
  int iVar2;
  char *unaff_ESI;
  
  if ((unaff_ESI == (char *)0x0) && (DAT_0124a38f == '\0')) {
    iVar2 = FUN_0047d980("string",".\\win_qe3.cpp",0x53);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a38f = '\x01';
    }
  }
  cVar1 = *unaff_ESI;
  iVar2 = 0;
  while( true ) {
    if (cVar1 == '\0') {
      (&DAT_01129e30)[iVar2] = 0;
      return &DAT_01129e30;
    }
    if (iVar2 == 0x10000) break;
    if (*unaff_ESI == '\n') {
      (&DAT_01129e30)[iVar2] = 0xd;
      (&DAT_01129e31)[iVar2] = 10;
      iVar2 = iVar2 + 1;
    }
    else {
      (&DAT_01129e30)[iVar2] = *unaff_ESI;
    }
    cVar1 = unaff_ESI[1];
    iVar2 = iVar2 + 1;
    unaff_ESI = unaff_ESI + 1;
  }
  FUN_0047a760("TranslateString buffer exceeded");
  return (undefined1 *)0x0;
}

