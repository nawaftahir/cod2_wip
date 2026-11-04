


unsigned int FUN_1007e01e(int param_1,int param_2,unsigned int param_3,unsigned int param_4)

{
  unsigned int uVar1;
  
  if ((param_3 < 2) && (param_4 < 2)) {
    uVar1 = *(unsigned int *)(param_1 + (param_2 + param_3 + param_4) * 4);
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


