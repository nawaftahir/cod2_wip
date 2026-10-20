
void * FUN_00489c10(size_t param_1)

{
  void *pvVar1;
  
  pvVar1 = _malloc(param_1);
  if (pvVar1 != (void *)0x0) {
    FUN_0048b5a0(pvVar1,0,param_1);
    return pvVar1;
  }
  FUN_00489b70();
  return (void *)0x0;
}

