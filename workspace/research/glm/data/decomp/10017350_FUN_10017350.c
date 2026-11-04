// 10017350 size=64 FUN_10017350

void FUN_10017350(void)

{
  undefined4 uVar1;
  int unaff_EBX;
  int iVar2;
  int unaff_EDI;
  
  iVar2 = 0;
  if (0 < unaff_EBX) {
    do {
      uVar1 = FUN_10017100(0);
      **(undefined4 **)(unaff_EDI + 4 + iVar2 * 8) = uVar1;
      if (**(int **)(unaff_EDI + 4 + iVar2 * 8) == 0) {
        FUN_10061cd0(0,"Could not find material \'%s\'",*(undefined4 *)(unaff_EDI + iVar2 * 8));
      }
      iVar2 = iVar2 + 1;
    } while (iVar2 < unaff_EBX);
  }
  return;
}


