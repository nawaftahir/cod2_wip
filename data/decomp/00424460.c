
undefined4 __fastcall FUN_00424460(CDialog *param_1)

{
  CDialog::OnInitDialog(param_1);
  SendMessageA(*(HWND *)(param_1 + 0x8c),0x14e,DAT_012334ac,0);
  SendMessageA(*(HWND *)(param_1 + 0xdc),0x14e,DAT_012334b0,0);
  return 1;
}

