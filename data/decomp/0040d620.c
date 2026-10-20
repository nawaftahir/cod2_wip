
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void __thiscall FUN_0040d620(CWnd *param_1,int param_2)

{
  char *pcVar1;
  char cVar2;
  CWnd *pCVar3;
  LRESULT LVar4;
  char *pcVar5;
  LPCWSTR unaff_EDI;
  HWND hWnd;
  char local_408 [1024];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  CWnd::Default(param_1);
  if (param_2 == 1) {
    FUN_0040cf30();
    hWnd = (HWND)&DAT_0053d753;
    CWnd::GetDlgItem(param_1,0x470);
    FID_conflict_SetWindowTextW(hWnd,unaff_EDI);
    pCVar3 = CWnd::GetDlgItem(param_1,0x511);
    do {
      LVar4 = SendMessageA(*(HWND *)(pCVar3 + 0x1c),0x182,0,0);
    } while (0 < LVar4);
    pcVar5 = DAT_012345c4;
    do {
      cVar2 = *pcVar5;
      pcVar5[(int)(local_408 + -(int)DAT_012345c4)] = cVar2;
      pcVar5 = pcVar5 + 1;
    } while (cVar2 != '\0');
    if ((0 < *(int *)(DAT_012345c4 + -0xc)) &&
       (pcVar5 = _strtok(local_408,",;"), pcVar5 != (char *)0x0)) {
      cVar2 = *pcVar5;
      while (cVar2 == ' ') {
        pcVar1 = pcVar5 + 1;
        pcVar5 = pcVar5 + 1;
        cVar2 = *pcVar1;
      }
      do {
        SendMessageA(*(HWND *)(pCVar3 + 0x1c),0x180,0,(LPARAM)pcVar5);
        pcVar5 = _strtok((char *)0x0,",;");
      } while (pcVar5 != (char *)0x0);
    }
  }
  return;
}

