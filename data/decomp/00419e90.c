
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void __fastcall FUN_00419e90(CWnd *param_1)

{
  int iVar1;
  int *piVar2;
  int local_1dc;
  CFileDialog local_1d8 [452];
  undefined4 local_14;
  void *local_10;
  undefined1 *puStack_c;
  int local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00526706;
  local_10 = ExceptionList;
  local_14 = DAT_0058ea68;
  ExceptionList = &local_10;
  CFileDialog::CFileDialog
            (local_1d8,0,(char *)&PTR_DAT_00541a54,(char *)0x0,6,"Map files (*.map)|*.map||",param_1
             ,0);
  local_8 = 0;
  iVar1 = CFileDialog::DoModal(local_1d8);
  if (iVar1 == 1) {
    piVar2 = (int *)CFileDialog::GetPathName(local_1d8);
    local_8._0_1_ = 1;
    if ((int)(*(uint *)(*piVar2 + -8) | 1U - *(int *)(*piVar2 + -4)) < 0) {
      FUN_00402d30(0);
    }
    FUN_0046ad90();
    local_8 = (uint)local_8._1_3_ << 8;
    piVar2 = (int *)(local_1dc + -4);
    LOCK();
    iVar1 = *piVar2;
    *piVar2 = *piVar2 + -1;
    UNLOCK();
    if (iVar1 == 1 || iVar1 + -1 < 0) {
      (**(code **)(**(int **)(local_1dc + -0x10) + 4))((undefined4 *)(local_1dc + -0x10));
    }
  }
  local_8 = 0xffffffff;
  CFileDialog::~CFileDialog(local_1d8);
  ExceptionList = local_10;
  return;
}

