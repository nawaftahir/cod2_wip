
undefined4 __fastcall FUN_0049fda0(char *param_1,char *param_2)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  
  do {
    iVar1 = (int)*param_2;
    iVar2 = (int)*param_1;
    param_2 = param_2 + 1;
    param_1 = param_1 + 1;
    if (in_EAX == 0) {
      return 0;
    }
    if (iVar1 != iVar2) {
      if ((0x60 < iVar1) && (iVar1 < 0x7b)) {
        iVar1 = iVar1 + -0x20;
      }
      if ((0x60 < iVar2) && (iVar2 < 0x7b)) {
        iVar2 = iVar2 + -0x20;
      }
      if (iVar1 < iVar2) {
        return 0xffffffff;
      }
      if (iVar2 < iVar1) {
        return 1;
      }
    }
    in_EAX = in_EAX + -1;
    if (iVar1 == 0) {
      return 0;
    }
  } while( true );
}

