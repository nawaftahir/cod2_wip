
void FUN_00462ff0(void)

{
  int iVar1;
  int iVar2;
  int unaff_EDI;
  
  if ((*(int *)(unaff_EDI + 0xc) == 0) && (DAT_0124a2d5 == '\0')) {
    iVar1 = FUN_0047d980("model->entities.next",".\\eclass.cpp",0x23,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a2d5 = '\x01';
    }
  }
  iVar1 = *(int *)(unaff_EDI + 0xc);
  while (iVar1 != unaff_EDI + 8) {
    iVar1 = *(int *)(unaff_EDI + 0xc);
    if ((*(int *)(iVar1 + 0x78) != 1) && (DAT_0124a2d4 == '\0')) {
      iVar2 = FUN_0047d980("e->refCount == 1",".\\eclass.cpp",0x27,1,1);
      if (iVar2 == 0) {
        DebugBreak();
      }
      else if (iVar2 == 2) {
        DAT_0124a2d4 = '\x01';
      }
    }
    for (iVar2 = *(int *)(iVar1 + 0xc); iVar2 != iVar1 + 8; iVar2 = *(int *)(iVar2 + 4)) {
      *(int *)(iVar2 + 0x1c) = *(int *)(iVar2 + 0x1c) + -1;
    }
    *(int *)(iVar1 + 0x78) = *(int *)(iVar1 + 0x78) + -1;
    FUN_004661f0();
    iVar1 = *(int *)(unaff_EDI + 0xc);
  }
  *(undefined4 *)(unaff_EDI + 0xc) = 0;
  return;
}

