
undefined4 __fastcall FUN_00424a80(CDialog *param_1)

{
  CDialog::OnInitDialog(param_1);
  SendMessageA(*(HWND *)(param_1 + 0x1d0),0x465,0,1000);
  SendMessageA(*(HWND *)(param_1 + 0xe0),0x465,0,1000);
  SendMessageA(*(HWND *)(param_1 + 0x180),0x465,0,1000);
  SendMessageA(*(HWND *)(param_1 + 0x90),0x465,0,1000);
  SendMessageA(*(HWND *)(param_1 + 0x130),0x465,0,1000);
  FUN_00424b10();
  return 1;
}

