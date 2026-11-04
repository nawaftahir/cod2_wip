


unsigned char FUN_10099ab4(int param_1)

{
  unsigned char bVar1;
  
  if ((param_1 == 0) || (*(int *)(param_1 + 4) != 9)) {
    bVar1 = false;
  }
  else {
    bVar1 = *(int *)(param_1 + 0x10) == 0;
  }
  return bVar1;
}


