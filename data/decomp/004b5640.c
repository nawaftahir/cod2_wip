
undefined4 __thiscall FUN_004b5640(int param_1,int *param_2)

{
  int iVar1;
  
  FUN_004bbac0();
  FUN_004bad20();
  if (*param_2 < 2) {
    iVar1 = param_1 + 0x30;
    if (*(int *)(param_1 + 0x30) < 2) {
      iVar1 = param_1 + 0x3c;
    }
    FUN_004bec60(iVar1);
    if ((*param_2 < 2) && (*(int *)(param_1 + 0xf4) == 0)) {
      return 0;
    }
  }
  return 1;
}

