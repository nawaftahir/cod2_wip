// 10011560 size=132 FUN_10011560

void FUN_10011560(void)

{
  HMONITOR hMonitor;
  BOOL BVar1;
  int iVar2;
  int *unaff_EBX;
  int *unaff_ESI;
  int unaff_EDI;
  DWORD DStack_30;
  int iStack_28;
  int iStack_24;
  int iStack_20;
  
  if (DAT_101d4c78 != 0) {
    DStack_30 = DAT_101d1bfc;
    hMonitor = (HMONITOR)(**(code **)(*DAT_101d1bf4 + 0x3c))(DAT_101d1bf4);
    DStack_30 = 0x28;
    BVar1 = GetMonitorInfoA(hMonitor,(LPMONITORINFO)&DStack_30);
    if (BVar1 != 0) {
      *unaff_ESI = iStack_24 - unaff_EDI;
      *unaff_EBX = iStack_20 - iStack_28;
      return;
    }
    iVar2 = GetSystemMetrics(0);
    *unaff_ESI = iVar2;
    iVar2 = GetSystemMetrics(1);
    *unaff_EBX = iVar2;
    if ((0 < *unaff_ESI) && (0 < iVar2)) {
      return;
    }
  }
  iVar2 = DAT_101d4c70;
  *unaff_ESI = DAT_101d4c6c;
  *unaff_EBX = iVar2;
  return;
}


