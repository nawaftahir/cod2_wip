
uint FUN_00433a20(void)

{
  undefined4 *puVar1;
  
  puVar1 = DAT_012485bc;
  if (((int)DAT_012485bc < 1) && (puVar1 = DAT_010a44b8, DAT_010a44b8 != &DAT_010a44b4)) {
    while (puVar1[8] != 0) {
      puVar1 = (undefined4 *)puVar1[1];
      if (puVar1 == &DAT_010a44b4) {
        return 0x10a4401;
      }
    }
  }
  return (uint)puVar1 & 0xffffff00;
}

