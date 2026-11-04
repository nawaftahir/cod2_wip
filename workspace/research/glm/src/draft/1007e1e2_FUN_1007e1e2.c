


unsigned int FUN_1007e1e2(int param_1,int param_2,unsigned int param_3,unsigned int param_4)

{
  unsigned int uVar1;
  
  if ((param_3 < 5) && (param_4 < 5)) {
    uVar1 = *(unsigned int *)(param_1 + (param_3 + (param_4 + param_2 * 4) * 4) * 4);
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


