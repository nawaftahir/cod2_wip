// 10099ab4 size=36 FUN_10099ab4

bool FUN_10099ab4(int param_1)

{
  bool bVar1;
  
  if ((param_1 == 0) || (*(int *)(param_1 + 4) != 9)) {
    bVar1 = false;
  }
  else {
    bVar1 = *(int *)(param_1 + 0x10) == 0;
  }
  return bVar1;
}


