
void __thiscall FUN_004bac60(undefined4 *param_1,int *param_2)

{
  int iVar1;
  
  *param_1 = 1;
  (**(code **)(*(int *)param_1[2] + 8))(param_2);
  if (1 < *param_2) {
    iVar1 = param_1[2] + 4;
    FUN_004becd0(&DAT_005632e8);
    FUN_004bed80(iVar1);
    *param_1 = 0;
  }
  return;
}

