
void FUN_004a4e10(int param_1,undefined4 *param_2,undefined4 param_3)

{
  int iVar1;
  
  if ((param_2 == (undefined4 *)0x0) && (DAT_0124a660 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_00555134,"\\trees\\cod2src\\src\\xanim\\dobj.cpp",0x501,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a660 = '\x01';
    }
  }
  *(undefined4 **)(param_1 + 4) = param_2;
  *(undefined4 *)(param_1 + 8) = param_3;
  *param_2 = 0;
  param_2[4] = 0;
  param_2[8] = 0;
  param_2[1] = 0;
  param_2[5] = 0;
  param_2[9] = 0;
  param_2[2] = 0;
  param_2[6] = 0;
  param_2[10] = 0;
  param_2[3] = 0;
  param_2[7] = 0;
  param_2[0xb] = 0;
  return;
}

