
LRESULT FUN_00476dd0(HWND param_1,UINT param_2,WPARAM param_3,LPARAM param_4)

{
  LRESULT LVar1;
  short sVar2;
  HWND hWnd;
  
  sVar2 = (short)param_3;
  if (param_2 == 0x100) {
    if (sVar2 == 9) {
      hWnd = DAT_01129a1c;
      if (param_1 == DAT_01129a1c) {
        SendMessageA(DAT_01129a24,0xc,0,0x53d753);
        hWnd = DAT_01129a24;
      }
    }
    else {
      if (sVar2 != 0xd) goto LAB_00476e97;
      if (param_1 == DAT_01129a1c) {
        SendMessageA(DAT_01129a24,0xc,0,0x53d753);
        hWnd = DAT_01129a24;
      }
      else {
        FUN_00477e80();
        hWnd = DAT_010bcd58;
      }
    }
  }
  else {
    if (param_2 == 0x102) {
      if ((sVar2 != 9) && (sVar2 != 0xd)) {
        if (sVar2 != 0x1b) goto LAB_00476e97;
        SetFocus(DAT_010bcd58);
      }
      return 0;
    }
    hWnd = param_1;
    if (param_2 != 0x201) goto LAB_00476e97;
  }
  SetFocus(hWnd);
LAB_00476e97:
  LVar1 = CallWindowProcA(DAT_01129994,param_1,param_2,param_3,param_4);
  return LVar1;
}

