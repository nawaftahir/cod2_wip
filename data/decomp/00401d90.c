
undefined4 FUN_00401d90(CWnd *param_1)

{
  CWnd *pCVar1;
  LRESULT LVar2;
  uint uVar3;
  int iVar4;
  
  iVar4 = 0;
  uVar3 = 0;
  do {
    pCVar1 = CWnd::GetDlgItem(param_1,*(int *)((int)&DAT_0058fa58 + uVar3));
    if (pCVar1 != (CWnd *)0x0) {
      LVar2 = SendMessageA(*(HWND *)(pCVar1 + 0x1c),0xf0,0,0);
      if (LVar2 != 0) {
        return (&DAT_0058fa5c)[iVar4 * 3];
      }
    }
    uVar3 = uVar3 + 0xc;
    iVar4 = iVar4 + 1;
  } while (uVar3 < 0x54);
  return 6;
}

