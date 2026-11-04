
void FUN_0041b590(UINT param_1)

{
  int in_EAX;
  HMENU pHVar1;
  CMenu *pCVar2;
  
  pHVar1 = GetMenu(*(HWND *)(in_EAX + 0x1c));
  pCVar2 = CMenu::FromHandle(pHVar1);
  if (pCVar2 != (CMenu *)0x0) {
    CheckMenuItem(*(HMENU *)(pCVar2 + 4),0x8082,0);
    CheckMenuItem(*(HMENU *)(pCVar2 + 4),0x8081,0);
    CheckMenuItem(*(HMENU *)(pCVar2 + 4),0x8080,0);
    CheckMenuItem(*(HMENU *)(pCVar2 + 4),0x807f,0);
    CheckMenuItem(*(HMENU *)(pCVar2 + 4),0x807e,0);
    CheckMenuItem(*(HMENU *)(pCVar2 + 4),param_1,8);
  }
  FUN_0043aa70();
  FUN_00441f80();
  DAT_01128da0 = 0;
  DAT_0123348c = DAT_0123348c | 0x10;
  return;
}

