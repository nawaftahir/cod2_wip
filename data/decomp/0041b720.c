
void FUN_0041b720(void)

{
  int iVar1;
  undefined **local_88 [28];
  int local_18;
  undefined4 local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_0052645b;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  FUN_004433b0();
  FUN_00443a90();
  FUN_00443ec0();
  CDialog::CDialog((CDialog *)local_88,0xa4,(CWnd *)0x0);
  local_88[0] = &PTR_LAB_0053f854;
  local_18 = 1;
  local_14 = 8;
  local_8 = 0;
  iVar1 = FUN_004fa9b3();
  if (iVar1 == 1) {
    FUN_004348e0(local_14,local_18 != 0);
    DAT_0123348c = 0xffffffff;
  }
  FUN_00443f80();
  FUN_00444150();
  local_8 = 0xffffffff;
  CDialog::~CDialog((CDialog *)local_88);
  ExceptionList = local_10;
  return;
}

