
void __fastcall FUN_004ba3b0(undefined4 *param_1)

{
  *param_1 = &PTR_FUN_005297a8;
  if ((undefined4 *)param_1[4] != (undefined4 *)0x0) {
    (*(code *)**(undefined4 **)param_1[4])(1);
  }
  if ((undefined4 *)param_1[5] != (undefined4 *)0x0) {
    (*(code *)**(undefined4 **)param_1[5])(1);
  }
  _free((void *)param_1[6]);
  if ((undefined1 *)param_1[0xd] != &DAT_00598c80) {
    _free((undefined1 *)param_1[0xd]);
  }
  if ((undefined1 *)param_1[10] != &DAT_00598c80) {
    _free((undefined1 *)param_1[10]);
  }
  if ((undefined1 *)param_1[7] != &DAT_00598c80) {
    _free((undefined1 *)param_1[7]);
  }
  FUN_004b9210();
  return;
}

