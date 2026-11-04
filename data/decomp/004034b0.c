
undefined4 __fastcall FUN_004034b0(CWnd *param_1)

{
  long lVar1;
  
  lVar1 = CWnd::Default(param_1);
  if (lVar1 == -1) {
    return 0xffffffff;
  }
  if (param_1 == (CWnd *)0x0) {
    DAT_010bcd58 = param_1;
    return 0;
  }
  DAT_010bcd58 = (CWnd *)*(undefined4 *)(param_1 + 0x1c);
  return 0;
}

