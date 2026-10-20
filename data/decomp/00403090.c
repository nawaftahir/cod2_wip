
void FUN_00403090(int param_1)

{
  AFX_MODULE_STATE *pAVar1;
  BOOL BVar2;
  int iVar3;
  tagWNDCLASSA local_2c;
  
  pAVar1 = AfxGetModuleState();
  BVar2 = GetClassInfoA(*(HINSTANCE *)(pAVar1 + 8),"QCamera",&local_2c);
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
    local_2c.lpszClassName = "QCamera";
    local_2c.hCursor = LoadCursorA((HINSTANCE)0x0,(LPCSTR)0x7f00);
    local_2c.lpfnWndProc = FUN_00403010;
    iVar3 = AfxRegisterClass(&local_2c);
    if (iVar3 == 0) {
      FUN_0047a760("CCamWnd RegisterClass: failed");
    }
  }
  *(char **)(param_1 + 0x28) = "QCamera";
  *(undefined **)(param_1 + 0x24) = &DAT_0053eef8;
  if (*(int *)(param_1 + 0x20) != 0x56c70000) {
    *(undefined4 *)(param_1 + 0x20) = 0x56000000;
  }
  PreCreateWindow(param_1);
  return;
}

