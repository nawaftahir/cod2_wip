
void __thiscall FUN_0044a030(int param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  int iVar1;
  SHORT SVar2;
  
  iVar1 = DAT_01233488;
  if (*(int *)(DAT_01233488 + 0x7e0) != 0) {
    *(undefined1 *)(*(int *)(DAT_01233488 + 0x7e0) + 0x50) = 0;
  }
  *(int *)(iVar1 + 0x7e0) = param_1;
  if (param_1 != 0) {
    *(undefined1 *)(param_1 + 0x50) = 1;
  }
  iVar1 = DAT_01233b64;
  *(undefined4 *)(param_1 + 0x118) = param_3;
  *(undefined4 *)(param_1 + 0x11c) = param_4;
  *(undefined1 *)(param_1 + 0x84) = 1;
  if (*(int *)(iVar1 + 0x2b0) == 3) {
    SVar2 = GetKeyState(0x11);
    if (SVar2 < 0) {
      if (DAT_0109fe5e == '\0') {
        FUN_0044abf0();
        DAT_0109fe5d = 1;
      }
      FUN_00449a30(param_3,param_4);
      return;
    }
  }
  FUN_0044a210(param_3,param_4);
  return;
}

