// 10063cf7 size=104 FUN_10063cf7

int FUN_10063cf7(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                undefined4 param_5)

{
  int iVar1;
  int in_ECX;
  
  iVar1 = FUN_10082325(param_1,param_2,0,param_3);
  if (iVar1 < 0) {
    FUN_10067c3e(param_5,0,0x5e8,"failed to open resource");
  }
  else {
    *(undefined4 *)(in_ECX + 0x68) = *(undefined4 *)(in_ECX + 0x54);
    *(undefined4 *)(in_ECX + 100) = *(undefined4 *)(in_ECX + 0x50);
    iVar1 = FUN_1006771f(*(undefined4 *)(in_ECX + 0x50),*(undefined4 *)(in_ECX + 0x54),0,1,param_4,
                         param_5);
    if (-1 < iVar1) {
      iVar1 = 0;
    }
  }
  return iVar1;
}


