
void FUN_004114f0(ushort param_1)

{
  AFX_MODULE_STATE *pAVar1;
  HMENU pHVar2;
  CMenu *this;
  CWnd *unaff_ESI;
  HGDIOBJ in_stack_ffffffe0;
  HGDIOBJ in_stack_ffffffe4;
  undefined **local_18;
  HMENU local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_005250e8;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  GetCursorPos((LPPOINT)&stack0xffffffe0);
  local_18 = &PTR_LAB_0052f5d4;
  local_14 = (HMENU)0x0;
  local_8 = 0;
  pAVar1 = AfxGetModuleState();
  pHVar2 = LoadMenuA(*(HINSTANCE *)(pAVar1 + 0xc),(LPCSTR)(uint)param_1);
  CMenu::Attach((CMenu *)&local_18,pHVar2);
  pHVar2 = GetSubMenu(local_14,0);
  this = CMenu::FromHandle(pHVar2);
  CMenu::TrackPopupMenu
            (this,2,(int)in_stack_ffffffe0,(int)in_stack_ffffffe4,unaff_ESI,(tagRECT *)0x0);
  FID_conflict_DeleteObject(in_stack_ffffffe0);
  CWnd::SetFocus(unaff_ESI);
  local_8 = 0xffffffff;
  local_18 = &PTR_LAB_0052f5d4;
  FID_conflict_DeleteObject(in_stack_ffffffe4);
  ExceptionList = local_10;
  return;
}

