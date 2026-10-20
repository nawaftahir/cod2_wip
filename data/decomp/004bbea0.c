
void __fastcall FUN_004bbea0(undefined4 *param_1)

{
  *param_1 = &PTR_FUN_00529934;
  if (param_1[0x805] != 0) {
    FUN_004b0180(param_1[0x805]);
  }
  if (param_1[0x806] != 0) {
    FUN_004adac0(param_1[0x806]);
  }
  _free((void *)param_1[0x805]);
  _free((void *)param_1[0x806]);
  if ((int *)param_1[1] != (int *)0x0) {
    (**(code **)(*(int *)param_1[1] + 4))(1);
  }
  FUN_004bc6c0();
  return;
}

