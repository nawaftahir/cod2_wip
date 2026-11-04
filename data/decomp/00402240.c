
void __fastcall FUN_00402240(int param_1)

{
  undefined1 uVar1;
  int iVar2;
  CColorDialog local_a4 [124];
  uint local_28;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00524edb;
  local_10 = ExceptionList;
  uVar1 = *(undefined1 *)(param_1 + 0x4d4);
  ExceptionList = &local_10;
  CColorDialog::CColorDialog(local_a4,(uint)CONCAT21(CONCAT11(uVar1,uVar1),uVar1),0,(CWnd *)0x0);
  local_8 = 0;
  iVar2 = DoModal();
  if (iVar2 == 1) {
    *(char *)(param_1 + 0x4d4) =
         (char)((ulonglong)
                ((longlong)
                 (int)((local_28 >> 8 & 0xff) + (local_28 >> 0x10 & 0xff) + (local_28 & 0xff)) *
                0x55555556) >> 0x20);
    InvalidateRect(*(HWND *)(param_1 + 0x1c),(RECT *)0x0,0);
  }
  local_8 = 0xffffffff;
  CDialog::~CDialog((CDialog *)local_a4);
  ExceptionList = local_10;
  return;
}

