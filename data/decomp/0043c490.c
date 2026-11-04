
undefined4 __fastcall FUN_0043c490(CDialog *param_1)

{
  CDialog::OnInitDialog(param_1);
  SendMessageA(*(HWND *)(param_1 + 300),0x465,0,0x167);
  SendMessageA(*(HWND *)(param_1 + 0xdc),0x465,0,0x167);
  SendMessageA(*(HWND *)(param_1 + 0x8c),0x465,0,0x167);
  return 1;
}

