extern int FUN_1002dc80();


void FUN_10020380(unsigned int param_1)

{
  int iVar1;
  
  iVar1 = (*(void *)RI_XModelGetSurfaces)(param_1);
  if (iVar1 == 0) {
    FUN_1002dc80();
  }
  return;
}


