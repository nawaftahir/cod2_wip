
void FUN_00479a10(uint *param_1)

{
  int iVar1;
  uint *unaff_EBX;
  uint *unaff_EDI;
  CDialog local_a4 [124];
  uint local_28;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_005259cb;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  FUN_00479920(local_a4,0);
  local_8 = 0;
  iVar1 = DoModal();
  FUN_00479820();
  if (iVar1 == 1) {
    *param_1 = local_28 & 0xff;
    *unaff_EBX = local_28 >> 8 & 0xff;
    *unaff_EDI = local_28 >> 0x10 & 0xff;
  }
  local_8 = 0xffffffff;
  CDialog::~CDialog(local_a4);
  ExceptionList = local_10;
  return;
}

