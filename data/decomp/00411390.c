
void FUN_00411390(CDialogBar *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  int local_8;
  
  puStack_c = &LAB_005246e0;
  local_10 = ExceptionList;
  local_8 = 4;
  ExceptionList = &local_10;
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
  CDialogBar::~CDialogBar(param_1);
  ExceptionList = local_10;
  return;
}

