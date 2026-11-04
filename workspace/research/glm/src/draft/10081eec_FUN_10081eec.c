


unsigned int FUN_10081eec(int param_1,unsigned int *param_2)

{
  unsigned int uVar1;
  
  if (param_2 == (unsigned int *)0x0) {
    uVar1 = 0x8876086c;
  }
  else {
    *param_2 = *(unsigned int *)(param_1 + 8);
    (**(void **)(**(int **)(param_1 + 8) + 4))(*(int **)(param_1 + 8));
    uVar1 = 0;
  }
  return uVar1;
}


