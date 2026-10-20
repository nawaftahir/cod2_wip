
undefined4 __fastcall FUN_004452a0(CDialog *param_1)

{
  CDialog::OnInitDialog(param_1);
  CSliderCtrl::SetRange((CSliderCtrl *)(param_1 + 0x1b0),0,100,0);
  SendMessageA(*(HWND *)(param_1 + 0x1cc),0x405,1,0x2c);
  SendMessageA(*(HWND *)(param_1 + 0x21c),0x14e,0,0);
  return 1;
}

