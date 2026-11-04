
void __fastcall FUN_004b7c70(undefined4 *param_1)

{
  *param_1 = &PTR_FUN_00528ff4;
  if ((undefined4 *)param_1[3] != (undefined4 *)0x0) {
    (*(code *)**(undefined4 **)param_1[3])(1);
  }
  if ((undefined4 *)param_1[4] != (undefined4 *)0x0) {
    (*(code *)**(undefined4 **)param_1[4])(1);
  }
  if ((undefined1 *)param_1[9] != &DAT_00598c80) {
    _free((undefined1 *)param_1[9]);
  }
  if ((undefined1 *)param_1[6] != &DAT_00598c80) {
    _free((undefined1 *)param_1[6]);
  }
  FUN_004c2250();
  return;
}

