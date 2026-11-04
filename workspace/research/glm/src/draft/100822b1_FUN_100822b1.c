extern int FUN_10063863();


unsigned int FUN_100822b1(int param_1)

{
  int *piVar1;
  unsigned int uVar2;
  
  piVar1 = (int *)(param_1 + 4);
  *piVar1 = *piVar1 + -1;
  uVar2 = *(unsigned int *)(param_1 + 4);
  if (*piVar1 == 0) {
    FUN_10063863(1);
    uVar2 = 0;
  }
  return uVar2;
}


