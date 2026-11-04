// 10066fbb size=115 FUN_10066fbb

int FUN_10066fbb(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                undefined4 param_5)

{
  void *pvVar1;
  int iVar2;
  int in_ECX;
  
  pvVar1 = operator_new(0x70);
  if (pvVar1 == (void *)0x0) {
    iVar2 = 0;
  }
  else {
    iVar2 = FUN_10063a97();
  }
  *(int *)(in_ECX + 0x268) = iVar2;
  if (iVar2 == 0) {
    iVar2 = -0x7ff8fff2;
  }
  else {
    iVar2 = FUN_10063cf7(param_1,param_2,param_3,in_ECX,in_ECX + 0x18);
    if (-1 < iVar2) {
      iVar2 = FUN_100663c0(param_4);
      if (-1 < iVar2) {
        *(undefined4 *)(in_ECX + 0x26c) = *(undefined4 *)(in_ECX + 0x268);
        *(undefined4 *)(in_ECX + 0x270) = param_5;
        iVar2 = 0;
      }
    }
  }
  return iVar2;
}


