
undefined4 __fastcall FUN_0043ed80(CDialog *param_1)

{
  CDialog::OnInitDialog(param_1);
  SendMessageA(*(HWND *)(param_1 + 0xdc),0x14e,DAT_00590a60,0);
  SendMessageA(*(HWND *)(param_1 + 0x8c),0x14e,DAT_00590a64,0);
  return 1;
}

