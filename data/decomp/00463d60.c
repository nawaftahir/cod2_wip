
undefined4 FUN_00463d60(int param_1)

{
  int iVar1;
  
  if ((param_1 == 0) && (DAT_0124a2cd == '\0')) {
    iVar1 = FUN_0047d980(&DAT_0054e3c8,".\\eclass.cpp",0x1b3,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a2cd = '\x01';
    }
  }
  if (*(int *)(param_1 + 0x15c) != 0) {
    FUN_00463bf0(param_1);
    if ((*(int *)(param_1 + 0x15c) != 0) && (DAT_0124a2cc == '\0')) {
      iVar1 = FUN_0047d980("e->modelpath == NULL",".\\eclass.cpp",0x1b7,1,1);
      if (iVar1 == 0) {
        DebugBreak();
      }
      else if (iVar1 == 2) {
        DAT_0124a2cc = '\x01';
      }
    }
  }
  if (*(int *)(param_1 + 0x154) == 0) {
    return 0;
  }
  iVar1 = *(int *)(*(int *)(param_1 + 0x154) + 4);
  if (iVar1 != 0) {
    iVar1 = FUN_004aa670(iVar1);
    if (iVar1 == 0) {
      return 1;
    }
  }
  return CONCAT31((int3)((uint)*(int *)(param_1 + 0x154) >> 8),
                  *(int *)(*(int *)(param_1 + 0x154) + 0xc) != 0);
}

