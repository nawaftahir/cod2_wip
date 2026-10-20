
void __fastcall FUN_004bd6d0(undefined4 *param_1)

{
  *param_1 = &PTR_FUN_00529bd4;
  if (-1 < (int)param_1[4]) {
    Ordinal_3(param_1[4]);
    param_1[4] = 0xffffffff;
  }
  Ordinal_116();
  if ((undefined1 *)param_1[5] != &DAT_00598c80) {
    _free((undefined1 *)param_1[5]);
  }
  FUN_004bc6d0();
  return;
}

