
float10 FUN_00401bd0(void)

{
  uint uVar1;
  int *piVar2;
  
  uVar1 = 0;
  piVar2 = &DAT_0058fb80;
  do {
    if (*piVar2 == 0x591) {
      return (float10)(float)(&DAT_0058fb88)[uVar1 * 8];
    }
    uVar1 = uVar1 + 1;
    piVar2 = piVar2 + 8;
  } while (uVar1 < 3);
  return (float10)0.0;
}

