// 10086139 size=96 FUN_10086139

undefined4 FUN_10086139(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined8 param_4)

{
  int iVar1;
  undefined4 uVar2;
  
  iVar1 = FUN_10085d76();
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10085bf1();
  }
  if (iVar1 != 0) {
    iVar1 = FUN_10085bf5(param_1,param_2,param_3,param_4);
    if (-1 < iVar1) {
      uVar2 = FUN_10085ec2();
      return uVar2;
    }
    FUN_1006db35();
  }
  return 0xffffffff;
}


