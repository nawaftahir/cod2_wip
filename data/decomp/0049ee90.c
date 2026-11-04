
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 __thiscall FUN_0049ee90(uint param_1,float param_2)

{
  uint uVar1;
  undefined4 local_8;
  
  uVar1 = param_1;
  if ((int)param_1 < 0) {
    uVar1 = -param_1;
  }
  local_8 = 1.0;
  while( true ) {
    if ((uVar1 & 1) != 0) {
      local_8 = local_8 * param_2;
    }
    uVar1 = uVar1 >> 1;
    if (uVar1 == 0) break;
    param_2 = param_2 * param_2;
  }
  if ((int)param_1 < 0) {
    return (float10)(_DAT_00556a58 / local_8);
  }
  return (float10)local_8;
}

