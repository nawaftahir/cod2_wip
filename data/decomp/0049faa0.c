
undefined4 * FUN_0049faa0(undefined4 *param_1)

{
  int iVar1;
  void *local_14;
  void *local_10;
  undefined1 *puStack_c;
  uint local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00525c21;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  FUN_004997b0();
  local_8 = 1;
  FUN_0049f800();
  *param_1 = local_14;
  *(int *)((int)local_14 + 4) = *(int *)((int)local_14 + 4) + 1;
  local_8 = local_8 & 0xffffff00;
  iVar1 = *(int *)((int)local_14 + 4) + -1;
  *(int *)((int)local_14 + 4) = iVar1;
  if (iVar1 < 0) {
    if (*(void **)((int)local_14 + 8) != (void *)0x0) {
      _free(*(void **)((int)local_14 + 8));
    }
    _free(local_14);
  }
  ExceptionList = local_10;
  return param_1;
}

