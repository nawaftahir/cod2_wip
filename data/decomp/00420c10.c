
undefined4 * __thiscall FUN_00420c10(undefined4 *param_1,int param_2)

{
  undefined4 *puVar1;
  
  puVar1 = _malloc(param_2 + 8);
  if (puVar1 == (undefined4 *)0x0) {
    return (undefined4 *)0x0;
  }
  *puVar1 = *param_1;
  *param_1 = puVar1;
  return puVar1 + 2;
}

