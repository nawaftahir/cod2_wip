
void __fastcall FUN_004b9440(undefined4 *param_1)

{
  undefined4 *puVar1;
  int iVar2;
  
  *param_1 = &PTR_FUN_00529620;
  if ((undefined4 *)param_1[0x13] != (undefined4 *)0x0) {
    (*(code *)**(undefined4 **)param_1[0x13])(1);
  }
  if ((undefined4 *)param_1[0x14] != (undefined4 *)0x0) {
    (*(code *)**(undefined4 **)param_1[0x14])(1);
  }
  if ((undefined4 *)param_1[0x15] != (undefined4 *)0x0) {
    (*(code *)**(undefined4 **)param_1[0x15])(1);
  }
  if ((undefined4 *)param_1[0x16] != (undefined4 *)0x0) {
    (*(code *)**(undefined4 **)param_1[0x16])(1);
  }
  _free((void *)param_1[0x17]);
  _free((void *)param_1[0x18]);
  _free((void *)param_1[0x19]);
  if ((undefined1 *)param_1[0x2b] != &DAT_00598c80) {
    _free((undefined1 *)param_1[0x2b]);
  }
  if ((undefined1 *)param_1[0x20] != &DAT_00598c80) {
    _free((undefined1 *)param_1[0x20]);
  }
  if ((undefined1 *)param_1[0x1d] != &DAT_00598c80) {
    _free((undefined1 *)param_1[0x1d]);
  }
  if ((undefined1 *)param_1[0x1a] != &DAT_00598c80) {
    _free((undefined1 *)param_1[0x1a]);
  }
  param_1 = param_1 + 0x13;
  iVar2 = 5;
  do {
    puVar1 = param_1 + -3;
    param_1 = param_1 + -3;
    if ((undefined1 *)*puVar1 != &DAT_00598c80) {
      _free((undefined1 *)*puVar1);
    }
    iVar2 = iVar2 + -1;
  } while (iVar2 != 0);
  FUN_004b9210();
  return;
}

