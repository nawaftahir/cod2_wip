
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_0043cc70(void)

{
  float fVar1;
  int iVar2;
  int iVar3;
  int unaff_EDI;
  float10 fVar4;
  
  iVar3 = 1;
  if ((unaff_EDI == 0) && (DAT_0124a1ac == '\0')) {
    iVar2 = FUN_0047d980(&DAT_0054527c,".\\SurfaceDlg.cpp",0x92);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a1ac = '\x01';
    }
  }
  iVar2 = *(int *)(unaff_EDI + 0x44);
  if (iVar2 != 0) {
    if (*(char *)(iVar2 + 0x382f) != '\0') {
      return (float10)*(float *)(iVar2 + 0x3834);
    }
    return (float10)_DAT_00556a70;
  }
  fVar4 = (float10)FUN_0043cb80();
  fVar1 = (float)fVar4;
  if (fVar1 != _DAT_00556a70) {
    if (1 < *(int *)(unaff_EDI + 0x38)) {
      do {
        fVar4 = (float10)FUN_0043cb80();
        if ((float10)fVar1 != fVar4) goto LAB_0043ccfe;
        iVar3 = iVar3 + 1;
      } while (iVar3 < *(int *)(unaff_EDI + 0x38));
    }
    return (float10)fVar1;
  }
LAB_0043ccfe:
  return (float10)_DAT_00556a70;
}

