
void FUN_00459430(undefined4 param_1)

{
  int iVar1;
  int unaff_EBX;
  int unaff_EDI;
  
  if ((unaff_EDI == 0) && (DAT_0124a267 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_0054527c,".\\brush.cpp",0x829);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a267 = '\x01';
    }
  }
  if ((unaff_EBX == 0) && (DAT_0124a266 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_00546b30,".\\brush.cpp",0x82a);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a266 = '\x01';
    }
  }
  iVar1 = (unaff_EBX - *(int *)(unaff_EDI + 0x3c)) / 0xa8;
  if ((((iVar1 < 0) || (*(int *)(unaff_EDI + 0x38) <= iVar1)) ||
      (unaff_EBX != iVar1 * 0xa8 + *(int *)(unaff_EDI + 0x3c))) && (DAT_0124a265 == '\0')) {
    iVar1 = FUN_0047d980("f - b->faces >= 0 && f - b->faces < b->faceCount && f == &b->faces[f - b->faces]"
                         ,".\\brush.cpp",0x82b,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a265 = '\x01';
    }
  }
  *(undefined4 *)(DAT_01128d90 * 0x1c + 0x24 + unaff_EBX) = param_1;
  *(short *)(unaff_EDI + 0x42) = *(short *)(unaff_EDI + 0x42) + 1;
  return;
}

