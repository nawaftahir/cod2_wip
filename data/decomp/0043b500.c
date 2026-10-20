
CWnd * FUN_0043b500(CWnd *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00524fc8;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  CWnd::CWnd(param_1);
  local_8 = 0;
  *(undefined ***)param_1 = &PTR_LAB_00547dcc;
  CWnd::CWnd(param_1 + 0x50);
  *(undefined ***)(param_1 + 0x50) = &PTR_LAB_0054012c;
  ExceptionList = local_10;
  return param_1;
}

