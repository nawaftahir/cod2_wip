// 10086292 size=79 FUN_10086292

undefined4 FUN_10086292(undefined4 param_1)

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
    iVar2 = FUN_10085abe(param_1);
    if (-1 < iVar2) {
      uVar3 = FUN_10086026(iVar1);
      return uVar3;
    }
    FUN_1006c418(1);
  }
  return 0xffffffff;
}


