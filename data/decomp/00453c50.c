
void FUN_00453c50(int param_1)

{
  AFX_MODULE_STATE *pAVar1;
  BOOL BVar2;
  int iVar3;
  tagWNDCLASSA local_2c;
  
  pAVar1 = AfxGetModuleState();
  BVar2 = GetClassInfoA(*(HINSTANCE *)(pAVar1 + 8),"QZ",&local_2c);
  if (BVar2 == 0) {
    local_2c.lpfnWndProc = (WNDPROC)0x0;
    local_2c.cbClsExtra = 0;
    local_2c.cbWndExtra = 0;
    local_2c.hInstance = (HINSTANCE)0x0;
    local_2c.hIcon = (HICON)0x0;
    local_2c.hCursor = (HCURSOR)0x0;
    local_2c.hbrBackground = (HBRUSH)0x0;
    local_2c.lpszMenuName = (LPCSTR)0x0;
    local_2c.style = 0x200;
    local_2c.lpszClassName = "QZ";
    local_2c.hCursor = LoadCursorA((HINSTANCE)0x0,(LPCSTR)0x7f00);
    local_2c.lpfnWndProc = DefWindowProcA_exref;
    iVar3 = AfxRegisterClass(&local_2c);
    if (iVar3 == 0) {
      FUN_0047a760("CZWnd RegisterClass: failed");
    }
  }
  *(undefined **)(param_1 + 0x28) = &DAT_00541d30;
  *(undefined **)(param_1 + 0x24) = &DAT_0054cdbc;
  if (*(int *)(param_1 + 0x20) != 0x56c70000) {
    *(undefined4 *)(param_1 + 0x20) = 0x56000000;
  }
  PreCreateWindow(param_1);
  return;
}

