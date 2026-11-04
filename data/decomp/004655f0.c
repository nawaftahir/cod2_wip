
void FUN_004655f0(void)

{
  int iVar1;
  int unaff_ESI;
  char *unaff_EDI;
  
  if ((unaff_ESI == 0) && (DAT_0124a2fb == '\0')) {
    iVar1 = FUN_0047d980(&DAT_0054e3c8,".\\entity.cpp",0xca);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a2fb = '\x01';
    }
  }
  if ((*(int *)(unaff_ESI + 0x50) != 0) && (*(int *)(*(int *)(unaff_ESI + 0x50) + 8) != 0)) {
    iVar1 = __stricmp(unaff_EDI,"angles");
    if (iVar1 != 0) {
      iVar1 = __stricmp(unaff_EDI,"modelscale");
      if (iVar1 != 0) {
        iVar1 = __stricmp(unaff_EDI,"modelscale_vec");
        if (iVar1 != 0) goto LAB_0046567e;
      }
    }
    FUN_00467470();
    *(short *)(unaff_ESI + 0x68) = *(short *)(unaff_ESI + 0x68) + 1;
  }
LAB_0046567e:
  iVar1 = __stricmp(unaff_EDI,"model");
  if (iVar1 == 0) {
    *(undefined4 *)(unaff_ESI + 0x54) = 0;
    *(undefined1 *)(*(int *)(unaff_ESI + 0xc) + 0x40) = 0;
    *(short *)(unaff_ESI + 0x68) = *(short *)(unaff_ESI + 0x68) + 1;
  }
  return;
}

