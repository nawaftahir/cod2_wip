
undefined4 FUN_00466030(void)

{
  undefined4 *puVar1;
  int in_EAX;
  char *pcVar2;
  char *unaff_EDI;
  
  puVar1 = *(undefined4 **)(in_EAX + 100);
  while( true ) {
    if (puVar1 == (undefined4 *)0x0) {
      return 0;
    }
    pcVar2 = _strstr((char *)puVar1[2],unaff_EDI);
    if (pcVar2 != (char *)0x0) break;
    puVar1 = (undefined4 *)*puVar1;
  }
  return 1;
}

