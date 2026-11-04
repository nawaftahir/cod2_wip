
uint __fastcall FUN_0045b630(undefined4 *param_1)

{
  undefined4 *puVar1;
  
  puVar1 = DAT_010a44b8;
  if (DAT_010a44b8 != &DAT_010a44b4) {
    do {
      if (puVar1 == param_1) {
        return CONCAT31((int3)((uint)puVar1 >> 8),1);
      }
      puVar1 = (undefined4 *)puVar1[1];
    } while (puVar1 != &DAT_010a44b4);
  }
  return (uint)puVar1 & 0xffffff00;
}

