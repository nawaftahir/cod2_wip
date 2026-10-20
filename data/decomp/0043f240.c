
void FUN_0043f240(int param_1,undefined4 *param_2)

{
  uint uVar1;
  
  *param_2 = 0;
  uVar1 = (int)DAT_0112988c >> 0x1f;
  if (*(int *)(param_1 + 0x10) < 0) {
    FUN_00472860((float)(int)((DAT_0112988c ^ uVar1) - uVar1),0);
    FUN_0043f460();
    return;
  }
  FUN_00472860((float)(int)-((DAT_0112988c ^ uVar1) - uVar1),0);
  FUN_0043f460();
  return;
}

