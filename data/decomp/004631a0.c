
void FUN_004631a0(void)

{
  undefined4 *puVar1;
  
  while (DAT_012334dc != (undefined4 *)0x0) {
    puVar1 = (undefined4 *)*DAT_012334dc;
    FUN_004630c0(DAT_012334dc);
    DAT_012334dc = puVar1;
  }
  DAT_012334dc = (undefined4 *)0x0;
  while (DAT_012334e4 != (undefined4 *)0x0) {
    puVar1 = (undefined4 *)*DAT_012334e4;
    FUN_004630c0(DAT_012334e4);
    DAT_012334e4 = puVar1;
  }
  DAT_012334e4 = (undefined4 *)0x0;
  if (DAT_012334e0 != (void *)0x0) {
    _free(*(void **)((int)DAT_012334e0 + 4));
    _free(*(void **)((int)DAT_012334e0 + 0x50));
    _free(DAT_012334e0);
    DAT_012334e0 = (void *)0x0;
  }
  return;
}

