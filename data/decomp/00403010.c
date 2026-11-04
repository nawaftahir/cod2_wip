
LRESULT FUN_00403010(HWND param_1,uint param_2,WPARAM param_3,LPARAM param_4)

{
  LRESULT LVar1;
  tagRECT local_14;
  
  GetClientRect(param_1,&local_14);
  if (6 < param_2) {
    if (param_2 < 9) {
      SendMessageA(param_1,0x86,(uint)(param_2 == 7),0);
      return 0;
    }
    if (param_2 == 0x83) {
      DefWindowProcA(param_1,0x83,param_3,param_4);
      return 0x300;
    }
  }
  LVar1 = DefWindowProcA(param_1,param_2,param_3,param_4);
  return LVar1;
}

