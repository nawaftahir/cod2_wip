
void __fastcall FUN_004bfd10(undefined4 *param_1)

{
  *param_1 = &PTR_FUN_00529dc0;
  FUN_004c0410(param_1);
  if ((undefined1 *)param_1[4] != &DAT_00598c80) {
    _free((undefined1 *)param_1[4]);
  }
  return;
}

