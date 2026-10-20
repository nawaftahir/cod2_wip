
void FUN_00449ff0(int param_1)

{
  int iVar1;
  
  iVar1 = *(int *)(param_1 + 4);
  while ((iVar1 != 0 && (iVar1 != param_1))) {
    iVar1 = *(int *)(iVar1 + 4);
    FUN_004592f0();
    FUN_00459210();
  }
  return;
}

