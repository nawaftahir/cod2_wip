
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_0043cb80(void)

{
  int iVar1;
  int unaff_ESI;
  
  if ((unaff_ESI == 0) && (DAT_0124a1ae == '\0')) {
    iVar1 = FUN_0047d980(&DAT_00546b30,".\\SurfaceDlg.cpp",0x82,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a1ae = '\x01';
    }
  }
  iVar1 = *(int *)(*(int *)(unaff_ESI + 0x40) + 0x14);
  if ((float)iVar1 * *(float *)(unaff_ESI + 0x48) !=
      (float)*(int *)(*(int *)(unaff_ESI + 0x40) + 0x18) * *(float *)(unaff_ESI + 0x44)) {
    return (float10)_DAT_00556a70;
  }
  if ((iVar1 == 0) && (DAT_0124a1ad == '\0')) {
    iVar1 = FUN_0047d980("td->radMat->size[0]",".\\SurfaceDlg.cpp",0x88,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a1ad = 1;
      return (float10)*(float *)(unaff_ESI + 0x44) /
             (float10)*(int *)(*(int *)(unaff_ESI + 0x40) + 0x14);
    }
  }
  return (float10)*(float *)(unaff_ESI + 0x44) /
         (float10)*(int *)(*(int *)(unaff_ESI + 0x40) + 0x14);
}

