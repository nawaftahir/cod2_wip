// 10086240 size=82 FUN_10086240

undefined4 FUN_10086240(undefined4 param_1)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  
  iVar1 = FUN_10085d76(0x80);
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10085bf1();
  }
  if (iVar1 != 0) {
    iVar2 = FUN_10085c65(param_1);
    if (-1 < iVar2) {
      uVar3 = FUN_10085ec2(iVar1);
      return uVar3;
    }
    FUN_1006db35(1);
  }
  return 0xffffffff;
}


