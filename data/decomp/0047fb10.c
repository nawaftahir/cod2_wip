
void FUN_0047fb10(int param_1)

{
  int iVar1;
  
  if (DAT_01233508 == 0) {
    FUN_0047ae50(0,"Filesystem call made without initialization\n");
  }
  if ((param_1 == 0) && (DAT_0124a3a8 == '\0')) {
    iVar1 = FUN_0047d980("buffer","\\trees\\cod2src\\src\\universal\\com_files.cpp",0x870,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a3a8 = '\x01';
    }
  }
  DAT_011435a4 = DAT_011435a4 + -1;
  FUN_0048acc0(param_1);
  return;
}

