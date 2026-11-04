


unsigned int FUN_1007e28e(int param_1,unsigned int param_2,unsigned int param_3)

{
  unsigned int uVar1;
  
  if (param_3 < 5) {
    uVar1 = *(unsigned int *)
             (*(int *)(param_1 + (param_2 & 0xfffffffc)) + ((param_2 & 3) + param_3 * 4) * 4);
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


