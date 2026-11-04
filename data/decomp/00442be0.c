
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 __fastcall FUN_00442be0(CWnd *param_1)

{
  long lVar1;
  tagRECT local_14;
  
  lVar1 = CWnd::Default(param_1);
  if (lVar1 == -1) {
    return 0xffffffff;
  }
  local_14.right = 0x14;
  local_14.bottom = 0x14;
  local_14.left = 8;
  local_14.top = 5;
  _DAT_01234d58 = 0;
  SetRect(&local_14,8,0,0x14,0x14);
  (**(code **)(*(int *)(param_1 + 0x50) + 0x130))(0x50000080,&local_14,param_1,0x4b1);
  CWnd::ModifyStyleEx(param_1 + 0x50,0,0x200,0);
  *(CWnd **)(param_1 + 0xa0) = param_1;
  _DAT_01234d58 = _DAT_01234d58 + 0x19;
  if (*(int *)(DAT_01233b64 + 0x1fc) == 0) {
    CWnd::ShowWindow(param_1 + 0x50,0);
    _DAT_01234d58 = _DAT_01234d58 + -0x19;
  }
  ShowScrollBar(*(HWND *)(param_1 + 0x1c),1,*(BOOL *)(DAT_01233b64 + 0x260));
  param_1[0xfc] = (CWnd)0x1;
  return 0;
}

