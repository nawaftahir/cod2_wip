
void FUN_00494400(void)

{
  int iVar1;
  int unaff_ESI;
  
  if ((unaff_ESI == 0) && (DAT_0124a4d2 == '\0')) {
    iVar1 = FUN_0047d980("solver","\\trees\\cod2src\\src\\universal\\linearmapping.cpp",0xbd);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a4d2 = '\x01';
    }
  }
  FUN_00494260();
  return;
}

