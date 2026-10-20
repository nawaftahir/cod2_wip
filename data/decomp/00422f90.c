
void __thiscall FUN_00422f90(CWnd *param_1,int param_2)

{
  CWnd *pCVar1;
  CWnd *pCVar2;
  LRESULT LVar3;
  int iVar4;
  
  CWnd::Default(param_1);
  if (param_2 != 1) {
    FUN_00423d20();
    return;
  }
  pCVar1 = CWnd::GetDlgItem(param_1,0x61e);
  pCVar2 = CWnd::GetDlgItem(param_1,0x61c);
  do {
    LVar3 = SendMessageA(*(HWND *)(pCVar1 + 0x1c),0x182,0,0);
  } while (0 < LVar3);
  do {
    LVar3 = SendMessageA(*(HWND *)(pCVar2 + 0x1c),0x182,0,0);
  } while (0 < LVar3);
  iVar4 = 0;
  if (0 < DAT_01234648) {
    do {
      if ((iVar4 < 0) || (DAT_01234648 <= iVar4)) goto LAB_00423068;
      SendMessageA(*(HWND *)(pCVar1 + 0x1c),0x180,0,*(LPARAM *)(DAT_01234644 + iVar4 * 4));
      iVar4 = iVar4 + 1;
    } while (iVar4 < DAT_01234648);
  }
  iVar4 = 0;
  if (0 < DAT_0123465c) {
    do {
      if ((iVar4 < 0) || (DAT_0123465c <= iVar4)) {
LAB_00423068:
                    /* WARNING: Subroutine does not return */
        FUN_004f3bd2();
      }
      SendMessageA(*(HWND *)(pCVar2 + 0x1c),0x180,0,*(LPARAM *)(DAT_01234658 + iVar4 * 4));
      iVar4 = iVar4 + 1;
    } while (iVar4 < DAT_0123465c);
  }
  return;
}

