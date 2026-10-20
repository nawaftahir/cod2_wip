
void FUN_0043f380(int param_1,undefined4 *param_2)

{
  int iVar1;
  uint uVar2;
  
  *param_2 = 0;
  uVar2 = (int)DAT_0112988c >> 0x1f;
  if (*(int *)(param_1 + 0x10) < 0) {
    iVar1 = (DAT_0112988c ^ uVar2) - uVar2;
  }
  else {
    iVar1 = -((DAT_0112988c ^ uVar2) - uVar2);
  }
  FUN_00472ff0(0,iVar1);
  FUN_0043f460();
  return;
}

