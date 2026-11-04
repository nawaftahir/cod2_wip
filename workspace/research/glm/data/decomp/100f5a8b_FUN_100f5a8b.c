// 100f5a8b size=419 FUN_100f5a8b

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

undefined4 FUN_100f5a8b(int param_1,int param_2,undefined4 param_3,LPCSTR param_4,int param_5)

{
  undefined4 uVar1;
  HWND hWnd;
  int iVar2;
  char *lpText;
  char *lpCaption;
  UINT uType;
  char local_1240 [3000];
  char local_688 [1024];
  char local_288 [256];
  undefined1 local_188 [260];
  char local_84 [124];
  undefined4 uStack_8;
  
  uStack_8 = 0x100f5a9a;
  FID_conflict__StringCbPrintfA(local_84,0x80,"%ld",param_2);
  if (param_1 != 0) {
    FID_conflict__StringCbPrintfA(local_1240,3000,"%s(%s): ",param_1,local_84);
    OutputDebugStringA(local_1240);
  }
  param_2 = 0;
  if (param_4 != (LPCSTR)0x0) {
    FUN_100cc7ab(param_4,0x400,&param_2);
    if (param_2 != 0) {
      OutputDebugStringA(param_4);
      OutputDebugStringA(" ");
    }
  }
  uVar1 = FUN_100cc81b(param_3,param_3);
  FID_conflict__StringCbPrintfA(local_288,0x100,"%s (0x%0.8x)",uVar1);
  FID_conflict__StringCbPrintfA(local_1240,3000,"hr=%s",local_288);
  OutputDebugStringA(local_1240);
  OutputDebugStringA("\n");
  if (param_5 != 0) {
    _StringCopyWorkerA_12(local_188,0x104,&DAT_1019166e);
    if (param_1 != 0) {
      _StringCopyWorkerA_12(local_188,0x104,param_1);
    }
    _StringCopyWorkerA_12(local_688,0x400,&DAT_1019166e);
    if (param_2 != 0) {
      FID_conflict__StringCbPrintfA(local_688,0x400,"Calling: %s\n",param_4);
    }
    FID_conflict__StringCbPrintfA
              (local_1240,3000,
               "File: %S\nLine: %s\nError Code: %s\n%sDo you want to debug the application?",
               local_188,local_84,local_288,local_688);
    uType = 0x14;
    lpCaption = "Unexpected error encountered";
    lpText = local_1240;
    hWnd = GetForegroundWindow();
    iVar2 = MessageBoxA(hWnd,lpText,lpCaption,uType);
    if (iVar2 == 6) {
      DebugBreak();
    }
  }
  return param_3;
}


