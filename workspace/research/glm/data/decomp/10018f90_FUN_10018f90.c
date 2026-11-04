// 10018f90 size=89 FUN_10018f90

bool FUN_10018f90(int *param_1)

{
  int in_EAX;
  int iVar1;
  
  iVar1 = FUN_1005faf0(&DAT_101958cc,1);
  if (iVar1 == 0) {
    return false;
  }
  iVar1 = FUN_1005ff30();
  *param_1 = iVar1;
  if ((iVar1 < 0) || (in_EAX <= iVar1)) {
    FUN_1005f360("index \'%i\' is not in the range [0, %i]\n",iVar1,in_EAX + -1);
  }
  iVar1 = FUN_1005faf0(&DAT_101958a8,1);
  return iVar1 != 0;
}


