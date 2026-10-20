
void __fastcall FUN_004171b0(int param_1)

{
  if (*(int *)(param_1 + 0x7e0) != 0) {
    if (DAT_0109fe5e != '\0') {
      FUN_0044abf0();
      SendMessageA(*(HWND *)(param_1 + 0x180),0x402,0x800f,0);
      return;
    }
    if (DAT_0109fe5f != '\0') {
      FUN_00418ec0();
    }
    FUN_0044abf0();
    SendMessageA(*(HWND *)(param_1 + 0x180),0x402,0x800f,1);
  }
  return;
}

