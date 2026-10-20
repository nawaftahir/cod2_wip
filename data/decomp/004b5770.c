
void __fastcall FUN_004b5770(int param_1)

{
  int iVar1;
  
  if (*(int *)(param_1 + 0xac) != param_1) {
    *(undefined4 *)(*(int *)(param_1 + 0xac) + 0xc) = 0;
  }
  iVar1 = *(int *)(param_1 + 0xb0);
  if ((iVar1 != param_1) && (iVar1 != *(int *)(param_1 + 0xac))) {
    *(undefined4 *)(iVar1 + 0xc) = 0;
  }
  return;
}

