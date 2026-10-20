
void FUN_00463310(void)

{
  int iVar1;
  undefined4 uVar2;
  char *unaff_ESI;
  int *unaff_EDI;
  
  iVar1 = __strnicmp(unaff_ESI,"xmodel",6);
  if ((iVar1 == 0) && ((unaff_ESI[6] == '/' || (unaff_ESI[6] == '\\')))) {
    FUN_0047a5b0("Loading model %s...");
    uVar2 = (*DAT_0059c308)();
    *(undefined4 *)(*unaff_EDI + 4) = uVar2;
    if ((*(int *)(*unaff_EDI + 4) == 0) && (DAT_0124a2d1 == '\0')) {
      iVar1 = FUN_0047d980("(*model)->handle",".\\eclass.cpp",0x91,0,1);
      if (iVar1 == 0) {
        DebugBreak();
      }
      else if (iVar1 == 2) {
        DAT_0124a2d1 = '\x01';
      }
    }
    iVar1 = FUN_004aa670(*(undefined4 *)(*unaff_EDI + 4));
    if (iVar1 == 0) {
      FUN_0047a5b0(" successful.\n");
      return;
    }
  }
  FUN_0047a5b0(" failed.\n");
  return;
}

