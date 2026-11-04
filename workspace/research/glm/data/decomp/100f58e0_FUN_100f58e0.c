// 100f58e0 size=427 FUN_100f58e0

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

undefined4 FUN_100f58e0(int param_1,int param_2,undefined4 param_3,LPCWSTR param_4,int param_5)

{
  undefined4 uVar1;
  HWND hWnd;
  int iVar2;
  wchar_t *lpText;
  wchar_t *lpCaption;
  UINT uType;
  wchar_t local_2378 [3000];
  wchar_t local_c08 [1024];
  wchar_t local_408 [256];
  undefined1 local_208 [260];
  wchar_t local_104 [126];
  undefined4 uStack_8;
  
  uStack_8 = 0x100f58ef;
  _StringCchPrintfW(local_104,0x80,L"%ld",param_2);
  if (param_1 != 0) {
    _StringCchPrintfW(local_2378,3000,L"%S(%s): ",param_1,local_104);
    OutputDebugStringW(local_2378);
  }
  param_2 = 0;
  if (param_4 != (LPCWSTR)0x0) {
    FUN_100cc7e2(param_4,0x400,&param_2);
    if (param_2 != 0) {
      OutputDebugStringW(param_4);
      OutputDebugStringW(L" ");
    }
  }
  uVar1 = FUN_100de367(param_3,param_3);
  _StringCchPrintfW(local_408,0x100,L"%s (0x%0.8x)",uVar1);
  _StringCchPrintfW(local_2378,3000,L"hr=%s",local_408);
  OutputDebugStringW(local_2378);
  OutputDebugStringW(L"\n");
  if (param_5 != 0) {
    _StringCopyWorkerA_12(local_208,0x104,&DAT_1019166e);
    if (param_1 != 0) {
      _StringCopyWorkerA_12(local_208,0x104,param_1);
    }
    _StringCopyWorkerW_12(local_c08,0x400,&DAT_1017c2b0);
    if (param_2 != 0) {
      _StringCchPrintfW(local_c08,0x400,L"Calling: %s\n",param_4);
    }
    _StringCchPrintfW(local_2378,3000,
                      L"File: %S\nLine: %s\nError Code: %s\n%sDo you want to debug the application?"
                      ,local_208,local_104,local_408,local_c08);
    uType = 0x14;
    lpCaption = L"Unexpected error encountered";
    lpText = local_2378;
    hWnd = GetForegroundWindow();
    iVar2 = MessageBoxW(hWnd,lpText,lpCaption,uType);
    if (iVar2 == 6) {
      DebugBreak();
    }
  }
  return param_3;
}


