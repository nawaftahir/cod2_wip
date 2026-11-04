// 100835f3 size=66 FUN_100835f3

bool FUN_100835f3(int param_1)

{
  int iVar1;
  int in_ECX;
  
  iVar1 = FUN_100827da(param_1);
  if (((iVar1 != 0) && (iVar1 = FUN_10082999(), iVar1 != 0)) &&
     (*(int *)(param_1 + 0x30) == *(int *)(in_ECX + 0x30))) {
    return *(int *)(param_1 + 0x34) == *(int *)(in_ECX + 0x34);
  }
  return false;
}


