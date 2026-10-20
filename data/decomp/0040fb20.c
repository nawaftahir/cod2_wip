
void __thiscall FUN_0040fb20(int param_1,WPARAM param_2,LPARAM param_3,int param_4)

{
  SendMessageA(*(HWND *)(param_1 + 0x1c),0xb1,param_2,param_3);
  if (param_4 == 0) {
    SendMessageA(*(HWND *)(param_1 + 0x1c),0xb7,0,0);
  }
  return;
}

