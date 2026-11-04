
void FUN_004431f0(void)

{
  undefined4 uVar1;
  int iVar2;
  int *unaff_ESI;
  int unaff_EDI;
  
  if ((unaff_ESI[7] < 0) && (DAT_0124a208 == '\0')) {
    uVar1 = FUN_004969e0("%s\n\t(brush->refCount) = %i","(brush->refCount >= 0)",unaff_ESI[7],
                         ".\\Undo.cpp",0x55,0,1);
    iVar2 = FUN_0047d980(uVar1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a208 = '\x01';
    }
  }
  if ((unaff_ESI[2] != 0) && (DAT_0124a207 == '\0')) {
    iVar2 = FUN_0047d980("brush->owner == NULL",".\\Undo.cpp",0x56,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a207 = '\x01';
    }
  }
  unaff_ESI[7] = unaff_ESI[7] + 1;
  unaff_ESI[1] = *(int *)(unaff_EDI + 4);
  **(int **)(unaff_EDI + 4) = (int)unaff_ESI;
  *(int **)(unaff_EDI + 4) = unaff_ESI;
  *unaff_ESI = unaff_EDI;
  return;
}

