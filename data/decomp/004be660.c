
int __thiscall FUN_004be660(int param_1,int param_2)

{
  int iVar1;
  
  iVar1 = *(int *)(param_1 + 8);
  if (((iVar1 != 0) && (-1 < param_2)) && (param_2 < *(int *)(iVar1 + 8))) {
    return iVar1 + 0xc + param_2 * 8;
  }
  return 0;
}

