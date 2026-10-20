
void FUN_0043c7c0(CDialog *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  int local_8;
  
  puStack_c = &LAB_0052460a;
  local_10 = ExceptionList;
  local_8 = 7;
  ExceptionList = &local_10;
  FID_conflict__CHotKeyCtrl();
  local_8._0_1_ = 6;
  FID_conflict__CHotKeyCtrl();
  local_8._0_1_ = 5;
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

