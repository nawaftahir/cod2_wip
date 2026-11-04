
/* WARNING: Function: __chkstk replaced with injection: alloca_probe */
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_00478140(void)

{
  int iVar1;
  HWND hWnd;
  WPARAM wParam;
  int iVar2;
  char *lParam;
  char local_1008 [4096];
  undefined4 local_8;
  
  hWnd = DAT_011299e8;
  local_8 = DAT_0058ea68;
  if ((DAT_011299a0 != 0) && (wParam = SendMessageA(DAT_011299e8,0x188,0,0), -1 < (int)wParam)) {
    SendMessageA(hWnd,0x189,wParam,(LPARAM)local_1008);
    iVar2 = 0;
    while (local_1008[0] != '\t') {
      iVar1 = iVar2 + 1;
      iVar2 = iVar2 + 1;
      local_1008[0] = local_1008[iVar1];
    }
    lParam = local_1008 + iVar2 + 1;
    local_1008[iVar2] = '\0';
    if (*lParam == '\t') {
      lParam = local_1008 + iVar2 + 2;
    }
    SendMessageA(DAT_01129a1c,0xc,0,(LPARAM)local_1008);
    SendMessageA(DAT_01129a24,0xc,0,(LPARAM)lParam);
  }
  return;
}

