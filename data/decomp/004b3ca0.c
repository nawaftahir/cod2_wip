
void * FUN_004b3ca0(undefined4 param_1,int param_2,int param_3)

{
  void *pvVar1;
  
  pvVar1 = _malloc(param_2 * param_3);
  if (pvVar1 != (void *)0x0) {
    FUN_0048b5a0(pvVar1,0,param_2 * param_3);
    return pvVar1;
  }
  FUN_00489b70();
  return (void *)0x0;
}

