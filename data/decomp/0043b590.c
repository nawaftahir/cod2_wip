
void __fastcall FUN_0043b590(CWnd *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  puStack_c = &LAB_00524b58;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  *(undefined ***)param_1 = &PTR_LAB_00547dcc;
  local_8 = 0;
  *(undefined ***)(param_1 + 0x50) = &PTR_LAB_0054012c;
  FID_conflict__CHotKeyCtrl();
  local_8 = 0xffffffff;
  CWnd::~CWnd(param_1);
  ExceptionList = local_10;
  return;
}

