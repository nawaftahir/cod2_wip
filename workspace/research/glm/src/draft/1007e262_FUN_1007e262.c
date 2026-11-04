


unsigned int FUN_1007e262(int param_1,int param_2,unsigned int param_3,unsigned int param_4)

{
  unsigned int uVar1;
  
  if ((param_3 < 5) && (param_4 < 5)) {
    uVar1 = *(unsigned int *)(*(int *)(param_1 + param_2 * 4) + (param_3 + param_4 * 4) * 4);
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


