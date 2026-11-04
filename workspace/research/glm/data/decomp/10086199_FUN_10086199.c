// 10086199 size=87 FUN_10086199

undefined4 FUN_10086199(undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  
  iVar1 = FUN_10085814(0x74);
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10085379();
  }
  if (iVar1 != 0) {
    iVar2 = FUN_1008585f(param_1,param_2,param_3,0);
    if (-1 < iVar2) {
      uVar3 = FUN_10086026(iVar1);
      return uVar3;
    }
    FUN_1006c418(1);
  }
  return 0xffffffff;
}


