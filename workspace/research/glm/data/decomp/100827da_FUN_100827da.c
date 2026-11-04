// 100827da size=27 FUN_100827da

bool FUN_100827da(int param_1)

{
  int in_ECX;
  bool bVar1;
  
  bVar1 = false;
  if (param_1 != 0) {
    bVar1 = *(int *)(param_1 + 4) == *(int *)(in_ECX + 4);
  }
  return bVar1;
}


