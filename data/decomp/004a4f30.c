
int FUN_004a4f30(int param_1)

{
  int iVar1;
  
  if ((param_1 == 0) && (DAT_0124a65e == '\0')) {
    iVar1 = FUN_0047d980(&PTR_DAT_00555460,"\\trees\\cod2src\\src\\xanim\\dobj.cpp",0x53b,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a65e = '\x01';
    }
  }
  if (*(int *)(param_1 + 4) != 0) {
    return *(int *)(param_1 + 4) + 0x30;
  }
  return 0;
}

