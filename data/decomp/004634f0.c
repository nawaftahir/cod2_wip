
void FUN_004634f0(void)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  
  puVar1 = &DAT_012334dc;
  for (puVar2 = DAT_012334dc; puVar2 != (undefined4 *)0x0; puVar2 = (undefined4 *)*puVar2) {
    if (puVar2[0x55] != 0) {
      *puVar1 = *puVar2;
      FUN_004630c0(puVar2);
      puVar2 = puVar1;
    }
    puVar1 = puVar2;
  }
  while (DAT_012334e4 != (undefined4 *)0x0) {
    puVar1 = (undefined4 *)*DAT_012334e4;
    FUN_004630c0(DAT_012334e4);
    DAT_012334e4 = puVar1;
  }
  DAT_012334e4 = (undefined4 *)0x0;
  return;
}

