
void __thiscall FUN_004aa560(undefined1 *param_1,int param_2)

{
  char *in_EAX;
  int iVar1;
  uint _C;
  
  if ((param_2 == 0) && (DAT_0124a701 == '\0')) {
    iVar1 = FUN_0047d980("count","\\trees\\cod2src\\src\\script\\scr_stringlist.cpp",0x4ce,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a701 = '\x01';
    }
  }
  do {
    do {
      do {
        _C = (uint)*in_EAX;
        in_EAX = in_EAX + 1;
      } while (_C == 0x5c);
    } while (_C == 0x2f);
    while (0x1f < _C) {
      while( true ) {
        iVar1 = _tolower(_C);
        *param_1 = (char)iVar1;
        param_1 = param_1 + 1;
        param_2 = param_2 + -1;
        if (param_2 == 0) {
          FUN_0047ae50(1,"Filename \'%s\' exceeds maximum length of %d",in_EAX,0);
        }
        if (_C == 0x2f) goto LAB_004aa604;
        _C = (uint)*in_EAX;
        in_EAX = in_EAX + 1;
        if (_C != 0x5c) break;
        _C = 0x2f;
      }
    }
LAB_004aa604:
    if (_C == 0) {
      *param_1 = 0;
      return;
    }
  } while( true );
}

