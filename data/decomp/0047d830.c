
char FUN_0047d830(int param_1,int param_2)

{
  ushort uVar1;
  char *lpCaption;
  int iVar2;
  
  if (DAT_01233500 != (code *)0x0) {
    (*DAT_01233500)(&DAT_01142378);
  }
  if (param_1 == 0) {
    lpCaption = "ASSERTION FAILURE... (this text is on the clipboard)";
  }
  else if (param_1 == 1) {
    lpCaption = "SANITY CHECK FAILURE... (this text is on the clipboard)";
  }
  else {
    lpCaption = "INTERNAL ERROR";
  }
  iVar2 = MessageBoxA((HWND)0x0,&DAT_01142378,lpCaption,0x12112);
  if (iVar2 == 3) {
    if (param_2 != 1) {
                    /* WARNING: Subroutine does not return */
      ExitProcess(0xffffffff);
    }
  }
  else if (iVar2 == 5) {
    uVar1 = GetAsyncKeyState(0x10);
    return ((uVar1 & 0x8000) != 0) + '\x01';
  }
  return '\0';
}

