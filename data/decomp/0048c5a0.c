
undefined4 * FUN_0048c5a0(void)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  int iVar3;
  char *unaff_EDI;
  
  if ((unaff_EDI == (char *)0x0) && (DAT_0124a4b8 == '\0')) {
    iVar3 = FUN_0047d980("string","\\trees\\cod2src\\src\\universal\\dvar.cpp",0x165);
    if (iVar3 == 0) {
      DebugBreak();
    }
    else if (iVar3 == 2) {
      DAT_0124a4b8 = '\x01';
    }
  }
  if (0xc < DAT_01148e1c + 2U) {
    DAT_01148e1c = 0;
  }
  puVar2 = &DAT_01148de4 + DAT_01148e1c;
  puVar1 = &DAT_01148de8 + DAT_01148e1c;
  DAT_01148e1c = DAT_01148e1c + 2;
  *puVar2 = 0;
  *puVar1 = 0;
  _sscanf(unaff_EDI,"%g %g",puVar2,puVar1);
  return puVar2;
}

