
int __thiscall FUN_004ac860(undefined4 param_1,undefined4 param_2)

{
  int iVar1;
  
  FUN_0047db10(0x400);
  iVar1 = FUN_0048a0a0();
  if (iVar1 == 0) {
    iVar1 = FUN_004ac650(param_2,param_1);
    if (iVar1 == 0) {
      FUN_00408f20("^1ERROR: Cannot find \'xmodelsurfs \'%s\'.\n",param_1);
      return 0;
    }
    FUN_0048a170(iVar1);
  }
  return iVar1;
}

