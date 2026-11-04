
void FUN_0044c280(void)

{
  CWnd *in_EAX;
  tagPOINT local_c;
  
  if (*(int *)(DAT_01233b64 + 0x1e8) != 0) {
    if (((CMenu *)(in_EAX + 0xe0) == (CMenu *)0x0) || (*(int *)(in_EAX + 0xe4) == 0)) {
      FUN_0044be20();
    }
    GetCursorPos(&local_c);
    CMenu::TrackPopupMenu((CMenu *)(in_EAX + 0xe0),2,local_c.x,local_c.y,in_EAX,(tagRECT *)0x0);
  }
  return;
}

