
void __fastcall FUN_004021a0(int param_1)

{
  int iVar1;
  CColorDialog local_a4 [124];
  undefined4 local_28;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_0052479b;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  CColorDialog::CColorDialog(local_a4,*(ulong *)(param_1 + 0x4d0),0,(CWnd *)0x0);
  local_8 = 0;
  iVar1 = DoModal();
  if (iVar1 == 1) {
    *(undefined4 *)(param_1 + 0x4d0) = local_28;
    InvalidateRect(*(HWND *)(param_1 + 0x1c),(RECT *)0x0,0);
  }
  local_8 = 0xffffffff;
  CDialog::~CDialog((CDialog *)local_a4);
  ExceptionList = local_10;
  return;
}

