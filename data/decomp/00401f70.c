
bool FUN_00401f70(void)

{
  int in_EAX;
  LRESULT LVar1;
  
  LVar1 = SendMessageA(*(HWND *)(in_EAX + 0x49c),0xf0,0,0);
  return LVar1 != 0;
}

