
void FUN_00401df0(CWnd *param_1)

{
  CWnd *pCVar1;
  int unaff_EBX;
  uint uVar2;
  
  uVar2 = 0;
  do {
    pCVar1 = CWnd::GetDlgItem(param_1,*(int *)((int)&DAT_0058fa58 + uVar2));
    if (pCVar1 != (CWnd *)0x0) {
      SendMessageA(*(HWND *)(pCVar1 + 0x1c),0xf1,
                   (uint)(unaff_EBX == *(int *)((int)&DAT_0058fa5c + uVar2)),0);
    }
    uVar2 = uVar2 + 0xc;
  } while (uVar2 < 0x54);
  InvalidateRect(*(HWND *)(param_1 + 0x1c),(RECT *)0x0,0);
  return;
}

