


unsigned int FUN_100827f5(unsigned int *param_1,int param_2)

{
  unsigned int uVar1;
  
  if (param_1 == (unsigned int *)0x0) {
    uVar1 = (unsigned int)(param_2 == 0);
  }
  else {
    uVar1 = (**(void **)*param_1)(param_2);
  }
  return uVar1;
}


