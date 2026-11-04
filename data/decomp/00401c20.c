
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_00401c20(void)

{
  uint uVar1;
  int *piVar2;
  double dVar3;
  float local_8;
  
  uVar1 = 0;
  piVar2 = &DAT_0058fb80;
  do {
    if (*piVar2 == 0x592) {
      local_8 = (float)(&DAT_0058fb88)[uVar1 * 8];
      goto LAB_00401c48;
    }
    uVar1 = uVar1 + 1;
    piVar2 = piVar2 + 8;
  } while (uVar1 < 3);
  local_8 = 0.0;
LAB_00401c48:
  dVar3 = _pow(_DAT_00556b18,(double)(local_8 - _DAT_00556bb4));
  return (float10)(float)dVar3;
}

