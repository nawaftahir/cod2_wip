extern unsigned int DAT_101ce648;
extern int FUN_10020380();


void R_FinishLoadingModels(void)

{
  if (*(int *)(DAT_101ce648 + 8) != 0) {
    (*(void *)RI_DObjBad)(1,FUN_10020380,0,1);
  }
  return;
}


