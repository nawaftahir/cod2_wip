


unsigned int FUN_10082816(int *param_1)

{
  unsigned int uVar1;
  
  if (param_1 == (int *)0x0) {
    uVar1 = 0;
  }
  else {
    uVar1 = (**(void **)(*param_1 + 4))();
  }
  return uVar1;
}


