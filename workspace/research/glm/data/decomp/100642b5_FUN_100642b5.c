// 100642b5 size=96 FUN_100642b5

undefined4 FUN_100642b5(int param_1)

{
  void *pvVar1;
  int iVar2;
  undefined4 uVar3;
  int in_ECX;
  
  pvVar1 = operator_new(0x10);
  if (pvVar1 == (void *)0x0) {
    iVar2 = 0;
  }
  else {
    iVar2 = FUN_10063a3e(param_1,*(undefined4 *)(in_ECX + 0x50));
  }
  if (iVar2 == 0) {
    uVar3 = 0x8007000e;
  }
  else {
    *(undefined4 *)(iVar2 + 0xc) = *(undefined4 *)(*(int *)(in_ECX + 0x268) + 0x38);
    *(int *)(*(int *)(in_ECX + 0x268) + 0x38) = iVar2;
    if ((*(int *)(in_ECX + 0x50) == 0) || (param_1 == 0)) {
      uVar3 = 0;
    }
    else {
      uVar3 = 1;
    }
    *(undefined4 *)(in_ECX + 0x54) = uVar3;
    uVar3 = 0;
  }
  return uVar3;
}


