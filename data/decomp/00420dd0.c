
void __thiscall FUN_00420dd0(undefined4 *param_1,size_t param_2)

{
  void *pvVar1;
  
  pvVar1 = _malloc(param_2);
  if (pvVar1 == (void *)0x0) {
                    /* WARNING: Subroutine does not return */
    FUN_00402c90(0x8007000e);
  }
  *param_1 = pvVar1;
  return;
}

