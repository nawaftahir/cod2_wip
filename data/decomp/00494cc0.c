
void FUN_00494cc0(void)

{
  int iVar1;
  
  iVar1 = DAT_00596d48 * 0x45c;
  if ((&DAT_00592b8c)[iVar1] != '\0') {
    FUN_00494b60("UngetToken called twice");
    (&DAT_00592b8c)[iVar1] = 1;
    DAT_00596d4c = DAT_00596d50;
    return;
  }
  (&DAT_00592b8c)[iVar1] = 1;
  DAT_00596d4c = DAT_00596d50;
  return;
}

