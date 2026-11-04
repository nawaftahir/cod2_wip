// 100861f0 size=80 FUN_100861f0

undefined4 FUN_100861f0(undefined4 param_1)

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
    iVar3 = FUN_100cb972(param_1);
    if (-1 < iVar3) {
      uVar4 = FUN_10085e08(iVar2);
      return uVar4;
    }
    FUN_10085de7(1);
  }
  return 0xffffffff;
}


