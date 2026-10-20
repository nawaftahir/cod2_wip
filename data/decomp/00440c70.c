
int FUN_00440c70(void)

{
  int iVar1;
  int iVar2;
  char *unaff_EDI;
  
  iVar1 = DAT_01244d70;
  while( true ) {
    if (iVar1 == 0) {
      return 0;
    }
    iVar2 = __stricmp(unaff_EDI,*(char **)(iVar1 + 4));
    if (iVar2 == 0) break;
    iVar1 = *(int *)(iVar1 + 0x24);
  }
  return iVar1;
}

