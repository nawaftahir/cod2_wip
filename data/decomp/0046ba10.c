
uint FUN_0046ba10(void)

{
  uint uVar1;
  int *piVar2;
  
  if (DAT_010a4908 != 0) {
    return CONCAT31((int3)((uint)DAT_010a4908 >> 8),1);
  }
  uVar1 = 0;
  if (0 < DAT_012334f0) {
    piVar2 = &DAT_0109fed0;
    do {
      if (*piVar2 != 0) {
        return CONCAT31((int3)(uVar1 >> 8),1);
      }
      uVar1 = uVar1 + 1;
      piVar2 = piVar2 + 0x114;
    } while ((int)uVar1 < DAT_012334f0);
  }
  return uVar1 & 0xffffff00;
}

