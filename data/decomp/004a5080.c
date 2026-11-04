
undefined1 FUN_004a5080(int param_1,int param_2)

{
  int iVar1;
  
  if ((param_1 == 0) && (DAT_0124a65b == '\0')) {
    iVar1 = FUN_0047d980(&PTR_DAT_00555460,"\\trees\\cod2src\\src\\xanim\\dobj.cpp",0x566,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a65b = 1;
      return *(undefined1 *)(param_2 + 0x44);
    }
  }
  return *(undefined1 *)(param_1 + 0x44 + param_2);
}

