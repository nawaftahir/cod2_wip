
undefined4 FUN_0047fb90(int param_1,int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  
  if (DAT_01233508 == 0) {
    FUN_0047ae50(0,"Filesystem call made without initialization\n");
  }
  if ((param_1 == 0) && (DAT_0124a3a7 == '\0')) {
    iVar1 = FUN_0047d980("qpath","\\trees\\cod2src\\src\\universal\\com_files.cpp",0x888,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a3a7 = '\x01';
    }
  }
  if ((param_2 == 0) && (DAT_0124a3a6 == '\0')) {
    iVar1 = FUN_0047d980("buffer","\\trees\\cod2src\\src\\universal\\com_files.cpp",0x889,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a3a6 = '\x01';
    }
  }
  iVar1 = FUN_0047e430();
  if (iVar1 == 0) {
    FUN_00408f20("Failed to open %s\n",param_1);
    return 0;
  }
  iVar2 = FUN_0047f660(param_2,param_3,iVar1);
  FUN_0047e300(iVar1);
  if (iVar2 == param_3) {
    return 1;
  }
  FUN_0047f3d0();
  return 0;
}

