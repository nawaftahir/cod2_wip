
void FUN_004b5570(int *param_1)

{
  undefined4 *puVar1;
  
  if (*param_1 < 2) {
    puVar1 = (undefined4 *)FUN_004b61e0();
    FUN_004bac20(*puVar1,param_1);
    if ((*param_1 < 2) && (FUN_004bb8f0(param_1), *param_1 < 2)) {
      return;
    }
  }
  FUN_004becd0(&DAT_005631bc);
  return;
}

