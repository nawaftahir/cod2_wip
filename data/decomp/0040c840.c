
void FUN_0040c840(CDialog *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  uint local_8;
  
  puStack_c = &LAB_00524703;
  local_10 = ExceptionList;
  local_8 = 1;
  ExceptionList = &local_10;
  FID_conflict__CHotKeyCtrl();
  local_8 = local_8 & 0xffffff00;
  FID_conflict__CHotKeyCtrl();
  local_8 = 0xffffffff;
  CDialog::~CDialog(param_1);
  ExceptionList = local_10;
  return;
}

