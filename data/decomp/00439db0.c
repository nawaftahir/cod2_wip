
undefined4 __fastcall FUN_00439db0(CDialog *param_1)

{
  CWnd *this;
  int iVar1;
  
  CDialog::OnInitDialog(param_1);
  SendMessageA(*(HWND *)(param_1 + 0x17c),0x465,0,0x1003c);
  CSliderCtrl::SetRange((CSliderCtrl *)(param_1 + 0x110),10,0x640,0);
  SendMessageA(*(HWND *)(param_1 + 300),0x405,1,*(LPARAM *)(param_1 + 0x2b8));
  SendMessageA(*(HWND *)(param_1 + 0xdc),0x465,0,0x40018);
  SendMessageA(*(HWND *)(param_1 + 0x8c),0x465,0,0x10040);
  iVar1 = 1;
  this = CWnd::GetDlgItem((CWnd *)param_1,0x4e7);
  CWnd::EnableWindow(this,iVar1);
  return 1;
}

