
undefined4 * FUN_00467ff0(void)

{
  undefined4 *puVar1;
  char cVar2;
  
  puVar1 = DAT_010a4414;
  while( true ) {
    if (puVar1 == &DAT_010a4410) {
      return (undefined4 *)0x0;
    }
    cVar2 = FUN_00465e10();
    if (cVar2 != '\0') break;
    puVar1 = (undefined4 *)puVar1[1];
  }
  return puVar1;
}

