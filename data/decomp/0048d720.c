
void FUN_0048d720(undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  int iVar1;
  int unaff_ESI;
  
  if ((unaff_ESI == 0) && (DAT_0124a4a6 == '\0')) {
    iVar1 = FUN_0047d980("outLineCount","\\trees\\cod2src\\src\\universal\\dvar.cpp",0x339);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a4a6 = '\x01';
    }
  }
  FUN_0048d350(param_1,param_2,param_3);
  return;
}

