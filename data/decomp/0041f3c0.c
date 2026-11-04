
void __fastcall FUN_0041f3c0(int param_1,int param_2)

{
  if (*(int *)(param_2 + 0x7e0) != 0) {
    *(undefined1 *)(*(int *)(param_2 + 0x7e0) + 0x50) = 0;
  }
  *(int *)(param_2 + 0x7e0) = param_1;
  if (param_1 != 0) {
    *(undefined1 *)(param_1 + 0x50) = 1;
  }
  return;
}

