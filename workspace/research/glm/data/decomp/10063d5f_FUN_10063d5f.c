// 10063d5f size=59 FUN_10063d5f

int FUN_10063d5f(int param_1,int param_2,undefined4 param_3,undefined4 param_4)

{
  int iVar1;
  int in_ECX;
  
  if ((param_2 == 0) || (param_1 != 0)) {
    *(int *)(in_ECX + 100) = param_1;
    *(int *)(in_ECX + 0x68) = param_2;
    iVar1 = FUN_1006771f(param_1,param_2,0,1,param_3,param_4);
    if (-1 < iVar1) {
      iVar1 = 0;
    }
  }
  else {
    iVar1 = -0x7789f794;
  }
  return iVar1;
}


