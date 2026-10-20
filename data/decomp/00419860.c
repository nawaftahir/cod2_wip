
void __fastcall FUN_00419860(int param_1)

{
  if (*(int *)(param_1 + 0x7e0) != 0) {
    if (DAT_0109fe5e != '\0') {
      FUN_004171b0();
    }
    if (DAT_0109fe5f != '\0') {
      DAT_0109fe5f = '\0';
      RedrawWindow(*(HWND *)(*(int *)(param_1 + 0x7e0) + 0x1c),(RECT *)0x0,(HRGN)0x0,0x105);
      SendMessageA(*(HWND *)(param_1 + 0x180),0x402,0x802d,0);
    }
    if (DAT_0109fe64 != '\0') {
      DAT_0109fe64 = 0;
      RedrawWindow(*(HWND *)(*(int *)(param_1 + 0x7e0) + 0x1c),(RECT *)0x0,(HRGN)0x0,0x105);
      SendMessageA(*(HWND *)(param_1 + 0x180),0x402,0x802d,0);
      return;
    }
    DAT_0109fe64 = '\x01';
    RedrawWindow(*(HWND *)(*(int *)(param_1 + 0x7e0) + 0x1c),(RECT *)0x0,(HRGN)0x0,0x105);
    SendMessageA(*(HWND *)(param_1 + 0x180),0x402,0x802d,1);
  }
  return;
}

