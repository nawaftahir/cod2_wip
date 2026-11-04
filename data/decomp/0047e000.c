
undefined4 FUN_0047e000(void)

{
  char cVar1;
  char *pcVar2;
  char *unaff_EDI;
  
  pcVar2 = _strstr(unaff_EDI,"..");
  if ((pcVar2 == (char *)0x0) && (pcVar2 = _strstr(unaff_EDI,"::"), pcVar2 == (char *)0x0)) {
    cVar1 = unaff_EDI[1];
    while (cVar1 != '\0') {
      pcVar2 = unaff_EDI + 1;
      if (*pcVar2 == '\\') {
        *pcVar2 = '\0';
        FUN_004db240();
        *pcVar2 = '\\';
      }
      cVar1 = unaff_EDI[2];
      unaff_EDI = pcVar2;
    }
    return 0;
  }
  FUN_00408f20("WARNING: refusing to create relative path \"%s\"\n");
  return 1;
}

