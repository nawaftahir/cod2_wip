// 10063e32 size=68 FUN_10063e32

undefined4 FUN_10063e32(undefined4 param_1)

{
  void *pvVar1;
  int iVar2;
  undefined4 uVar3;
  int in_ECX;
  undefined8 uVar4;
  
  pvVar1 = operator_new(0xc);
  if (pvVar1 == (void *)0x0) {
    iVar2 = 0;
  }
  else {
    uVar4 = FUN_10063d9a(param_1);
    param_1 = (undefined4)((ulonglong)uVar4 >> 0x20);
    iVar2 = (int)uVar4;
  }
  if (iVar2 == 0) {
    uVar3 = 0x8007000e;
  }
  else {
    *(undefined4 *)(iVar2 + 4) = *(undefined4 *)(in_ECX + 0x68);
    *(int *)(in_ECX + 0x68) = iVar2;
    *(undefined4 *)(in_ECX + 0x298) = param_1;
    uVar3 = 0;
  }
  return uVar3;
}


