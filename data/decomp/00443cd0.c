
undefined4 FUN_00443cd0(void)

{
  int iVar1;
  undefined3 uVar2;
  int unaff_ESI;
  int unaff_EDI;
  
  if ((unaff_ESI == 0) && (DAT_0124a1f4 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_00549cec,".\\Undo.cpp",0x15f);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a1f4 = '\x01';
    }
  }
  if ((unaff_EDI == 0) && (DAT_0124a1f3 == '\0')) {
    iVar1 = FUN_0047d980(&PTR_DAT_0054175c,".\\Undo.cpp",0x160);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a1f3 = '\x01';
    }
  }
  uVar2 = (undefined3)((uint)*(int *)(unaff_EDI + 0x6c) >> 8);
  if (*(int *)(unaff_EDI + 0x6c) == *(int *)(unaff_ESI + 8)) {
    return CONCAT31(uVar2,1);
  }
  return CONCAT31(uVar2,unaff_EDI == *(int *)(DAT_012334ec + 8));
}

