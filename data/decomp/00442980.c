
void __fastcall FUN_00442980(CWnd *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  uint local_8;
  
  puStack_c = &LAB_005256a3;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  *(undefined ***)param_1 = &PTR_LAB_005491dc;
  local_8 = 1;
  FID_conflict__CHotKeyCtrl();
  local_8 = local_8 & 0xffffff00;
  FUN_0043eec0();
  local_8 = 0xffffffff;
  CWnd::~CWnd(param_1);
  ExceptionList = local_10;
  return;
}

