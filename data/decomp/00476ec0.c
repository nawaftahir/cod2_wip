
LRESULT FUN_00476ec0(HWND param_1,UINT param_2,WPARAM param_3,LPARAM param_4)

{
  LRESULT LVar1;
  
  if ((param_2 == 0x100) && ((short)param_3 == 0xd)) {
    SendMessageA(DAT_010bcd60,0x111,0x2047f,0);
    return 0;
  }
  LVar1 = CallWindowProcA(DAT_01129990,param_1,param_2,param_3,param_4);
  return LVar1;
}

