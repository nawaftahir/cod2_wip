
void FUN_00426e80(undefined4 param_1,undefined4 param_2)

{
  uint uVar1;
  float local_28;
  float local_24;
  float local_20;
  float local_1c;
  float local_18;
  float local_14;
  float local_10 [3];
  
  FUN_00426280(0);
  local_10[0] = local_1c - local_28;
  local_10[1] = local_18 - local_24;
  uVar1 = (uint)(local_18 - local_24 < local_1c - local_28);
  if (local_14 - local_20 < local_10[uVar1]) {
    uVar1 = 2;
  }
  local_10[0] = 0.0;
  local_10[1] = 0.0;
  local_10[2] = 0.0;
  local_10[uVar1] = 1.0;
  FUN_00426e20(param_2,local_10);
  return;
}

