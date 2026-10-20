
void FUN_00454ef0(int param_1)

{
  int iVar1;
  
  iVar1 = 0;
  if (0 < *(int *)(param_1 + 0x38)) {
    do {
      FUN_00454ab0();
      iVar1 = iVar1 + 1;
    } while (iVar1 < *(int *)(param_1 + 0x38));
  }
  return;
}

