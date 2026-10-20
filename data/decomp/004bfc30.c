
void __fastcall FUN_004bfc30(int *param_1)

{
  undefined4 local_c [2];
  undefined4 local_4;
  
  local_4 = 0;
  local_c[0] = 0;
  (**(code **)(*param_1 + 0x1c))(local_c);
  if (param_1[8] != 0) {
    (**(code **)(*param_1 + 0x2c))(0);
  }
  FUN_004be650();
  return;
}

