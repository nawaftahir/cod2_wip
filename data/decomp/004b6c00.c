
void __thiscall FUN_004b6c00(int param_1,int *param_2)

{
  if (1 < *param_2) {
    *(int *)(param_1 + 0xf4) = *(int *)(param_1 + 0xf4) + 1;
    (**(code **)(**(int **)(param_1 + 200 + *(int *)(param_1 + 0xd8) * 4) + 8))(param_2);
    *param_2 = 0;
  }
  return;
}

