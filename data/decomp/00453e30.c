
void FUN_00453e30(void)

{
  int iVar1;
  int unaff_ESI;
  
  if ((unaff_ESI == 0) && (DAT_0124a2ac == '\0')) {
    iVar1 = FUN_0047d980(&DAT_00546b30,".\\brush.cpp",0x40);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a2ac = '\x01';
    }
  }
  if (*(void **)(unaff_ESI + 0xa0) != (void *)0x0) {
    _free(*(void **)(unaff_ESI + 0xa0));
    *(undefined4 *)(unaff_ESI + 0xa0) = 0;
  }
  return;
}

