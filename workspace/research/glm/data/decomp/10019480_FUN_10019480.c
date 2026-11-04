// 10019480 size=103 FUN_10019480

undefined4 FUN_10019480(int param_1,int *param_2)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  
  iVar1 = FUN_1005faf0(&DAT_101958cc,1);
  if (iVar1 == 0) {
    return 0;
  }
  iVar1 = FUN_1005ff30();
  if ((iVar1 < 0) || (in_EAX <= iVar1)) {
    FUN_1005f360("array index must be in range [0, %i]\n",in_EAX + -1);
  }
  else {
    iVar2 = FUN_1005faf0(&DAT_101958a8,1);
    if (iVar2 != 0) {
      *param_2 = iVar1 * param_1;
      return 1;
    }
  }
  return 0;
}


