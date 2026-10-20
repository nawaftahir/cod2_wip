
void FUN_00491380(int param_1,undefined4 param_2)

{
  int iVar1;
  
  if ((param_1 == 0) && (DAT_0124a456 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_005536a4,"\\trees\\cod2src\\src\\universal\\dvar.cpp",0x918,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a456 = '\x01';
    }
  }
  FUN_0048da90(*(undefined4 *)(param_1 + 0x10),param_2);
  return;
}

