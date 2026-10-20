
undefined4 FUN_004aac40(int param_1,int param_2)

{
  int iVar1;
  
  if ((param_2 < 0) && (DAT_0124a731 == '\0')) {
    iVar1 = FUN_0047d980("lod >= 0","\\trees\\cod2src\\src\\xanim\\xmodel.cpp",0x180,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a731 = 1;
      return *(undefined4 *)(param_1 + 8 + param_2 * 0x14);
    }
  }
  return *(undefined4 *)(param_1 + 8 + param_2 * 0x14);
}

