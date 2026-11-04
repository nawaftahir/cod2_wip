
void FUN_00481990(void)

{
  int *piVar1;
  int iVar2;
  
  iVar2 = 1;
  piVar1 = &DAT_011437e0;
  do {
    if (*piVar1 != 0) {
      FUN_0047e300(iVar2);
    }
    piVar1 = piVar1 + 0x47;
    iVar2 = iVar2 + 1;
  } while ((int)piVar1 < 0x1147dc4);
  FUN_00481910();
  DAT_01233508 = 0;
  return;
}

