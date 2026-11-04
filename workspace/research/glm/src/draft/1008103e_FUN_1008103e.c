extern int FUN_100636bc();


int FUN_1008103e(int param_1)

{
  int iVar1;
  int iVar2;
  
  iVar2 = *(int *)(param_1 + 4);
  iVar1 = iVar2 + -1;
  *(int *)(param_1 + 4) = iVar1;
  if (iVar2 == 1) {
    FUN_100636bc(1);
  }
  return iVar1;
}


