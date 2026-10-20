
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void __fastcall FUN_0043b410(CWnd *param_1)

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  int local_1dc;
  CFileDialog local_1d8 [452];
  undefined4 local_14;
  void *local_10;
  undefined1 *puStack_c;
  int local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00525746;
  local_10 = ExceptionList;
  local_14 = DAT_0058ea68;
  ExceptionList = &local_10;
  FUN_004fc069(1);
  CFileDialog::CFileDialog
            (local_1d8,1,(char *)0x0,(char *)0x0,6,"INI files (*.ini)|*.ini||",param_1,0);
  local_8 = 0;
  iVar2 = CFileDialog::DoModal(local_1d8);
  if (iVar2 == 1) {
    uVar3 = CFileDialog::GetPathName(local_1d8);
    local_8._0_1_ = 1;
    FUN_0041f2d0(uVar3);
    local_8 = (uint)local_8._1_3_ << 8;
    piVar1 = (int *)(local_1dc + -4);
    LOCK();
    iVar2 = *piVar1;
    *piVar1 = *piVar1 + -1;
    UNLOCK();
    if (iVar2 == 1 || iVar2 + -1 < 0) {
      (**(code **)(**(int **)(local_1dc + -0x10) + 4))((undefined4 *)(local_1dc + -0x10));
    }
    FUN_004fc069(0);
  }
  local_8 = 0xffffffff;
  CFileDialog::~CFileDialog(local_1d8);
  ExceptionList = local_10;
  return;
}

