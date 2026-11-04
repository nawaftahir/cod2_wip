
undefined4 __fastcall FUN_00453720(CWnd *param_1)

{
  long lVar1;
  
  lVar1 = CWnd::Default(param_1);
  if (lVar1 == -1) {
    return 0xffffffff;
  }
  if (param_1 == (CWnd *)0x0) {
    DAT_010bcd6c = param_1;
    return 0;
  }
  DAT_010bcd6c = (CWnd *)*(undefined4 *)(param_1 + 0x1c);
  return 0;
}

