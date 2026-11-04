


unsigned int FUN_10081f16(int param_1,unsigned int *param_2)

{
  unsigned int uVar1;
  
  if (param_2 == (unsigned int *)0x0) {
    uVar1 = 0x8876086c;
  }
  else {
    *param_2 = *(unsigned int *)(param_1 + 0xc);
    (**(void **)(**(int **)(param_1 + 0xc) + 4))(*(int **)(param_1 + 0xc));
    uVar1 = 0;
  }
  return uVar1;
}


