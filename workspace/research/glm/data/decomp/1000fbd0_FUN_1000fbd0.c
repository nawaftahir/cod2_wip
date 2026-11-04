// 1000fbd0 size=86 FUN_1000fbd0

void FUN_1000fbd0(int param_1,int param_2,undefined4 param_3)

{
  int *in_ECX;
  int iVar1;
  
  FUN_1000ee30();
  iVar1 = 0;
  do {
    if (*in_ECX == 4) {
      FUN_1000ec00();
    }
    else {
      FUN_1000ea20(param_3,param_1);
    }
    iVar1 = iVar1 + 1;
    param_1 = param_1 + param_2;
  } while (iVar1 < 6);
  return;
}


