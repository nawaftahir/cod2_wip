
void FUN_00409640(CDialog *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  puStack_c = &LAB_00524738;
  local_10 = ExceptionList;
  local_8 = 0;
  ExceptionList = &local_10;
  FID_conflict__CHotKeyCtrl();
  local_8 = 0xffffffff;
  CDialog::~CDialog(param_1);
  ExceptionList = local_10;
  return;
}

