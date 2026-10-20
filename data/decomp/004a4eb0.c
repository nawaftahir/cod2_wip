
void FUN_004a4eb0(int param_1,undefined4 *param_2,undefined4 *param_3)

{
  int iVar1;
  
  if ((param_1 == 0) && (DAT_0124a65f == '\0')) {
    iVar1 = FUN_0047d980(&PTR_DAT_00555460,"\\trees\\cod2src\\src\\xanim\\dobj.cpp",0x52d,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a65f = '\x01';
    }
  }
  *param_2 = *(undefined4 *)(param_1 + 0x4c);
  param_2[1] = *(undefined4 *)(param_1 + 0x50);
  param_2[2] = *(undefined4 *)(param_1 + 0x54);
  *param_3 = *(undefined4 *)(param_1 + 0x58);
  param_3[1] = *(undefined4 *)(param_1 + 0x5c);
  param_3[2] = *(undefined4 *)(param_1 + 0x60);
  return;
}

