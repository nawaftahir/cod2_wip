
void FUN_00477270(void)

{
  undefined4 *lParam;
  WPARAM wParam;
  
  SendMessageA(DAT_011299b0,0x184,0,0);
  for (lParam = DAT_012334dc; lParam != (undefined4 *)0x0; lParam = (undefined4 *)*lParam) {
    wParam = SendMessageA(DAT_011299b0,0x180,0,lParam[1]);
    SendMessageA(DAT_011299b0,0x19a,wParam,(LPARAM)lParam);
  }
  return;
}

