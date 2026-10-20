
void __thiscall FUN_0049eae0(int param_1,undefined4 param_2,undefined4 param_3)

{
  int *piVar1;
  int iVar2;
  
  iVar2 = FUN_00499ec0(param_3);
  if (iVar2 != 0) {
    FUN_0040b010();
    piVar1 = (int *)(param_1 + 0x1c);
    if (*(int *)(param_1 + 0x28) == 0) {
      FUN_0049f4d0();
    }
    if (*piVar1 == *(int *)(param_1 + 0x20)) {
      FUN_0049f4d0();
    }
    *(int *)(*(int *)(param_1 + 0x28) + *piVar1 * 4) = iVar2;
    iVar2 = *piVar1;
    *piVar1 = iVar2 + 1;
    *(int *)(param_1 + 0x54) = iVar2;
    if (iVar2 == 0) {
      FUN_0049c5c0(4,param_2,0);
    }
  }
  return;
}

