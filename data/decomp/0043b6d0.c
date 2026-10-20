
CWinApp * __thiscall FUN_0043b6d0(CWinApp *param_1,byte param_2)

{
  CWinApp::~CWinApp(param_1);
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

