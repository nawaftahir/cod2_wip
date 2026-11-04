
undefined4 FUN_0048a0a0(void)

{
  undefined4 *puVar1;
  int in_EAX;
  int iVar2;
  uint unaff_EBX;
  char *unaff_EDI;
  
  puVar1 = (undefined4 *)(&DAT_01147dd8)[in_EAX];
  while( true ) {
    if (puVar1 == (undefined4 *)0x0) {
      return 0;
    }
    if ((*(byte *)(puVar1 + 2) == unaff_EBX) &&
       (iVar2 = __stricmp((char *)((int)puVar1 + 9),unaff_EDI), iVar2 == 0)) break;
    puVar1 = (undefined4 *)puVar1[1];
  }
  return *puVar1;
}

