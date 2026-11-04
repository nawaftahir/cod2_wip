
void __fastcall FUN_00404d70(int param_1)

{
  int iVar1;
  
  *(undefined4 *)(param_1 + 0xd0) = 0;
  FUN_00462760();
  *(undefined4 *)(param_1 + 0x120) = 0;
  *(undefined4 *)(param_1 + 0x124) = 0;
  *(undefined1 *)(param_1 + 0x128) = 1;
  do {
    iVar1 = ShowCursor(1);
  } while (iVar1 < 0);
  return;
}

