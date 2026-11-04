// 1001d8c0 size=33 R_FinishLoadingModels

void R_FinishLoadingModels(void)

{
  if (*(int *)(DAT_101ce648 + 8) != 0) {
    (*(code *)RI_DObjBad)(1,FUN_10020380,0,1);
  }
  return;
}


