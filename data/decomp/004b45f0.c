
void FUN_004b45f0(undefined4 param_1,int param_2,int param_3,int param_4,int param_5,int param_6,
                 undefined4 param_7)

{
  undefined1 *local_c;
  undefined4 local_8;
  undefined4 local_4;
  
  _fflush((FILE *)&DAT_0058e770);
  FUN_004c03c0();
  local_4 = 0;
  local_8 = 0;
  local_c = &DAT_00598c80;
  FUN_004bf280(param_1);
  if (param_2 != 0) {
    FUN_004bf4a0(param_2);
  }
  if (param_3 != 0) {
    FUN_004bf4a0(param_3);
  }
  if (param_4 != 0) {
    FUN_004bf4a0(param_4);
  }
  if (param_5 != 0) {
    FUN_004bf4a0(param_5);
  }
  if (param_6 != 0) {
    FUN_004bf280(&DAT_00528a34);
    FUN_004bf280(param_6);
  }
  FUN_004bf670(&local_c,param_7);
  FUN_004c04e0();
  if (local_c != &DAT_00598c80) {
    _free(local_c);
  }
  return;
}

