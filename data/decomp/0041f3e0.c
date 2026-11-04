
void __fastcall FUN_0041f3e0(LPARAM param_1,int param_2)

{
  int in_EAX;
  
  if (in_EAX == 0) {
    SendMessageA(*(HWND *)(param_2 + 0x1c),0x30,0,param_1);
    return;
  }
  SendMessageA(*(HWND *)(param_2 + 0x1c),0x30,*(WPARAM *)(in_EAX + 4),param_1);
  return;
}

