
int FUN_004a7230(int param_1)

{
  int iVar1;
  int iVar2;
  
  if (param_1 == 0) {
    return 0;
  }
  iVar1 = FUN_004a7230(*(undefined2 *)(&DAT_01182f02 + param_1 * 8));
  iVar2 = FUN_004a7230(*(undefined2 *)(&DAT_01182f00 + param_1 * 8));
  return iVar1 + 1 + iVar2;
}

