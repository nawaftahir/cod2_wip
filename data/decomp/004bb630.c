
void __fastcall FUN_004bb630(undefined4 *param_1)

{
  undefined4 *puVar1;
  
  *param_1 = &PTR_FUN_005298b4;
  if (param_1[2] != 0) {
    if ((int)param_1[0xc] < 2) {
      FUN_004bbfb0(param_1 + 0xc);
    }
    (**(code **)(*(int *)param_1[2] + 0x18))();
    if ((int *)param_1[2] != (int *)0x0) {
      (**(code **)(*(int *)param_1[2] + 4))(1);
    }
    param_1[2] = 0;
  }
  puVar1 = (undefined4 *)param_1[4];
  if (puVar1 != (undefined4 *)0x0) {
    if ((undefined1 *)*puVar1 != &DAT_00598c80) {
      _free((undefined1 *)*puVar1);
    }
    _free(puVar1);
  }
  puVar1 = (undefined4 *)param_1[5];
  if (puVar1 != (undefined4 *)0x0) {
    FUN_004c5e60();
    FUN_004c57d0();
    if ((undefined1 *)*puVar1 != &DAT_00598c80) {
      _free((undefined1 *)*puVar1);
    }
    _free(puVar1);
  }
  FUN_004be650();
  FUN_004be650();
  FUN_004be650();
  FUN_004bdcc0();
  return;
}

