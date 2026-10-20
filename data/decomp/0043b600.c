
undefined4 __fastcall FUN_0043b600(CWnd *param_1)

{
  long lVar1;
  tagRECT local_14;
  
  lVar1 = CWnd::Default(param_1);
  if (lVar1 == -1) {
    return 0xffffffff;
  }
  GetClientRect(*(HWND *)(param_1 + 0x1c),&local_14);
  (**(code **)(*(int *)(param_1 + 0x50) + 0x130))(0x50200084,&local_14,param_1,0x65);
  return 0;
}

