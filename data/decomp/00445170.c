
void __fastcall FUN_00445170(CDialog *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  int local_8;
  
  puStack_c = &LAB_0052458b;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  *(undefined ***)param_1 = &PTR_LAB_00549e0c;
  local_8 = 5;
  FID_conflict__CHotKeyCtrl();
  local_8._0_1_ = 4;
  FID_conflict__CHotKeyCtrl();
  local_8._0_1_ = 3;
  FID_conflict__CHotKeyCtrl();
  local_8._0_1_ = 2;
  FID_conflict__CHotKeyCtrl();
  local_8._0_1_ = 1;
  FID_conflict__CHotKeyCtrl();
  local_8 = (uint)local_8._1_3_ << 8;
  FID_conflict__CHotKeyCtrl();
  local_8 = 0xffffffff;
  CDialog::~CDialog(param_1);
  ExceptionList = local_10;
  return;
}

