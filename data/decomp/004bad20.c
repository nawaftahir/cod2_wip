
void __fastcall FUN_004bad20(int param_1)

{
  if (*(int *)(param_1 + 8) != 0) {
    if (*(int *)(param_1 + 0x30) < 2) {
      FUN_004bbfb0(param_1 + 0x30);
    }
    (**(code **)(**(int **)(param_1 + 8) + 0x18))();
    if (*(int **)(param_1 + 8) != (int *)0x0) {
      (**(code **)(**(int **)(param_1 + 8) + 4))(1);
    }
    *(undefined4 *)(param_1 + 8) = 0;
  }
  return;
}

