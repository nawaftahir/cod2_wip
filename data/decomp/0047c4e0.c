
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_0047c4e0(void)

{
  short sVar1;
  HWND hWnd;
  HDC hdc;
  short *psVar2;
  int iVar3;
  short local_608 [256];
  short local_408 [256];
  short local_208 [256];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  ChangeDisplaySettingsA((DEVMODEA *)0x0,0);
  hWnd = GetDesktopWindow();
  hdc = GetDC(hWnd);
  sVar1 = 0;
  psVar2 = local_408;
  iVar3 = 0x100;
  do {
    psVar2[-0x100] = sVar1;
    *psVar2 = sVar1;
    psVar2[0x100] = sVar1;
    sVar1 = sVar1 + 0x101;
    psVar2 = psVar2 + 1;
    iVar3 = iVar3 + -1;
  } while (iVar3 != 0);
  SetDeviceGammaRamp(hdc,local_608);
  ReleaseDC(hWnd,hdc);
  return;
}

