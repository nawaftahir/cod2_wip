// 10012770 size=95 FUN_10012770

void FUN_10012770(void)

{
  POINT pt;
  undefined4 local_8;
  int local_4;
  
  if (*(char *)(DAT_101ce60c + 8) != '\0') {
    local_8 = *(undefined4 *)(DAT_101ce610 + 8);
    local_4 = 0;
    EnumDisplayMonitors((HDC)0x0,(LPCRECT)0x0,(MONITORENUMPROC)&LAB_10012750,(LPARAM)&local_8);
    if (local_4 != 0) {
      return;
    }
  }
  pt.y = *(LONG *)(DAT_101ce66c + 8);
  pt.x = *(LONG *)(DAT_101ce6cc + 8);
  MonitorFromPoint(pt,1);
  return;
}


