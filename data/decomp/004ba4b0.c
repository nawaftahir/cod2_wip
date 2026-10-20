
void __thiscall FUN_004ba4b0(int param_1,undefined4 *param_2)

{
  undefined4 unaff_retaddr;
  
  (**(code **)(**(int **)(param_1 + 0x10) + 4))(param_2);
  if (*(int *)(param_1 + 0x50) != 0) {
    FUN_004c1410(param_1 + 0x28,param_2);
  }
  FUN_004c0250(*param_2);
  *(undefined4 *)(*(int *)(param_1 + 0x14) + 8) = 1;
  (**(code **)(**(int **)(param_1 + 0x14) + 0x10))(1,param_2);
  (**(code **)(**(int **)(param_1 + 0x14) + 0xc))(unaff_retaddr);
  return;
}

