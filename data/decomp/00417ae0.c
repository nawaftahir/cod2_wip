
void FUN_00417ae0(void)

{
  CDialog local_d0 [192];
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00524cc8;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  FUN_00408fe0(local_d0,0);
  local_8 = 0;
  FUN_004fa9b3();
  local_8 = 1;
  FID_conflict__CListBox();
  local_8 = 0xffffffff;
  CDialog::~CDialog(local_d0);
  ExceptionList = local_10;
  return;
}

