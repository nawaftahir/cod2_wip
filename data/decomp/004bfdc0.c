
undefined4 * __fastcall FUN_004bfdc0(undefined4 *param_1)

{
  byte unaff_retaddr;
  
  *param_1 = &PTR_FUN_00529dc0;
  FUN_004c0410(param_1);
  if ((undefined1 *)param_1[4] != &DAT_00598c80) {
    _free((undefined1 *)param_1[4]);
  }
  if ((unaff_retaddr & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

