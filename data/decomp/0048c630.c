
undefined4 * FUN_0048c630(void)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  int iVar4;
  char *unaff_EDI;
  
  if ((unaff_EDI == (char *)0x0) && (DAT_0124a4b7 == '\0')) {
    iVar4 = FUN_0047d980("string","\\trees\\cod2src\\src\\universal\\dvar.cpp",0x172);
    if (iVar4 == 0) {
      DebugBreak();
    }
    else if (iVar4 == 2) {
      DAT_0124a4b7 = '\x01';
    }
  }
  if (0xc < DAT_01148e1c + 3U) {
    DAT_01148e1c = 0;
  }
  puVar3 = &DAT_01148de4 + DAT_01148e1c;
  puVar1 = &DAT_01148dec + DAT_01148e1c;
  puVar2 = &DAT_01148de8 + DAT_01148e1c;
  DAT_01148e1c = DAT_01148e1c + 3;
  *puVar3 = 0;
  *puVar2 = 0;
  *puVar1 = 0;
  _sscanf(unaff_EDI,"%g %g %g",puVar3,puVar2,puVar1);
  return puVar3;
}

