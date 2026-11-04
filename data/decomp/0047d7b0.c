
void FUN_0047d7b0(void)

{
  char cVar1;
  HWND hWndNewOwner;
  BOOL BVar2;
  char *pcVar3;
  HGLOBAL hMem;
  LPVOID pvVar4;
  char *pcVar5;
  
  hWndNewOwner = GetDesktopWindow();
  BVar2 = OpenClipboard(hWndNewOwner);
  if (BVar2 != 0) {
    EmptyClipboard();
    pcVar5 = &DAT_01142378;
    do {
      pcVar3 = pcVar5;
      pcVar5 = pcVar3 + 1;
    } while (*pcVar3 != '\0');
    hMem = GlobalAlloc(2,(SIZE_T)(pcVar3 + -0x1142377));
    if (hMem != (HGLOBAL)0x0) {
      pvVar4 = GlobalLock(hMem);
      if (pvVar4 != (LPVOID)0x0) {
        pcVar5 = &DAT_01142378;
        do {
          cVar1 = *pcVar5;
          pcVar5[(int)pvVar4 + -0x1142378] = cVar1;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        GlobalUnlock(hMem);
        SetClipboardData(1,hMem);
      }
    }
                    /* WARNING: Could not recover jumptable at 0x0047d81b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    CloseClipboard();
    return;
  }
  return;
}

