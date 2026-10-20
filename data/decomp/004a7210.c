
void FUN_004a7210(int param_1,int *param_2)

{
  *(int *)(param_1 + 4) = *param_2 + 0x14;
  *(undefined1 *)(param_1 + 0x19) = *(undefined1 *)*param_2;
  *(int **)(param_1 + 0x1c) = param_2;
  return;
}

