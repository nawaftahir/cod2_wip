// 100860e0 size=89 FUN_100860e0

undefined4 FUN_100860e0(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  void *pvVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  
  pvVar1 = operator_new(0x34);
  if (pvVar1 == (void *)0x0) {
    iVar2 = 0;
  }
  else {
    iVar2 = FUN_100cb926();
  }
  if (iVar2 != 0) {
    iVar3 = FUN_100cb92a(param_1,param_2,param_3,param_4);
    if (-1 < iVar3) {
      uVar4 = FUN_10085e08(iVar2);
      return uVar4;
    }
    FUN_10085de7(1);
  }
  return 0xffffffff;
}


