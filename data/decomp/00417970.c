
void FUN_00417970(void)

{
  CDialog local_d0 [192];
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00524d18;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  FUN_0041f9d0(local_d0,0);
  local_8 = 0;
  FUN_004fa9b3();
  local_8 = 1;
  FID_conflict__CListBox();
  local_8 = 0xffffffff;
  CDialog::~CDialog(local_d0);
  ExceptionList = local_10;
  return;
}

