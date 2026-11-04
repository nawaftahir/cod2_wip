// 10081a12 size=44 FUN_10081a12

undefined4 FUN_10081a12(uint param_1)

{
  void *pvVar1;
  undefined4 uVar2;
  int in_ECX;
  
  pvVar1 = operator_new(param_1);
  *(void **)(in_ECX + 0xc) = pvVar1;
  if (pvVar1 == (void *)0x0) {
    uVar2 = 0x8007000e;
  }
  else {
    *(uint *)(in_ECX + 8) = param_1;
    uVar2 = 0;
  }
  return uVar2;
}


