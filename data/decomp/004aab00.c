
int FUN_004aab00(undefined4 param_1,code *param_2)

{
  int iVar1;
  undefined4 uVar2;
  
  FUN_0047db10(0x400);
  iVar1 = FUN_0048a0a0();
  if (iVar1 == 0) {
    iVar1 = FUN_004ac9a0();
    if (iVar1 != 0) {
      uVar2 = FUN_0048a170(iVar1,param_2);
      *(undefined4 *)(iVar1 + 0x88) = uVar2;
      return iVar1;
    }
    FUN_00408f20("^1ERROR: Cannot find xmodel \'%s\'.\n",param_1);
    iVar1 = (*param_2)(0x90);
    FUN_004aa8c0();
    FUN_0048a170(iVar1,param_2);
  }
  return iVar1;
}

