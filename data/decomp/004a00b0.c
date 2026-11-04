
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

undefined4 * FUN_004a00b0(undefined4 *param_1,undefined4 *param_2,undefined4 param_3)

{
  void *_Memory;
  int iVar1;
  char local_28 [20];
  undefined4 local_14;
  void *local_10;
  undefined1 *puStack_c;
  uint local_8;
  
  puStack_c = &LAB_00525b91;
  local_10 = ExceptionList;
  local_14 = DAT_0058ea68;
  _Memory = (void *)*param_2;
  ExceptionList = &local_10;
  *(int *)((int)_Memory + 4) = *(int *)((int)_Memory + 4) + 1;
  local_8 = 1;
  _sprintf(local_28,"%u",param_3);
  FUN_0049f740();
  *param_1 = _Memory;
  *(int *)((int)_Memory + 4) = *(int *)((int)_Memory + 4) + 1;
  local_8 = local_8 & 0xffffff00;
  iVar1 = *(int *)((int)_Memory + 4) + -1;
  *(int *)((int)_Memory + 4) = iVar1;
  if (iVar1 < 0) {
    if (*(void **)((int)_Memory + 8) != (void *)0x0) {
      _free(*(void **)((int)_Memory + 8));
    }
    _free(_Memory);
  }
  ExceptionList = local_10;
  return param_1;
}

