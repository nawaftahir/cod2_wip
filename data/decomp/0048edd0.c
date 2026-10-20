
void FUN_0048edd0(int *param_1,undefined4 param_2)

{
  int iVar1;
  undefined4 uVar2;
  
  if ((param_1 == (int *)0x0) && (DAT_0124a485 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_005536a4,"\\trees\\cod2src\\src\\universal\\dvar.cpp",0x57f,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a485 = '\x01';
    }
  }
  if ((*param_1 == 0) && (DAT_0124a484 == '\0')) {
    iVar1 = FUN_0047d980("dvar->name","\\trees\\cod2src\\src\\universal\\dvar.cpp",0x580,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a484 = '\x01';
    }
  }
  if (((*(byte *)((int)param_1 + 5) & 2) == 0) && (DAT_0124a483 == '\0')) {
    uVar2 = FUN_004969e0("%s\n\t%s","dvar->flags & DVAR_CHANGEABLE_RESET",*param_1,
                         "\\trees\\cod2src\\src\\universal\\dvar.cpp",0x581,0,1);
    iVar1 = FUN_0047d980(uVar2);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a483 = 1;
      FUN_0048ecf0(param_2);
      return;
    }
  }
  FUN_0048ecf0(param_2);
  return;
}

