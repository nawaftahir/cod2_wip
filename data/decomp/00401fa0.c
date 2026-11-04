
int FUN_00401fa0(CWnd *param_1,int param_2,int param_3,int param_4)

{
  HMENU pHVar1;
  UINT_PTR uIDNewItem;
  int iVar2;
  HGDIOBJ unaff_ESI;
  int unaff_EDI;
  undefined **local_18;
  HMENU local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  puStack_c = &LAB_00524ef8;
  local_10 = ExceptionList;
  local_18 = &PTR_LAB_0052f5d4;
  local_14 = (HMENU)0x0;
  local_8 = 0;
  ExceptionList = &local_10;
  pHVar1 = CreatePopupMenu();
  CMenu::Attach((CMenu *)&local_18,pHVar1);
  uIDNewItem = 0;
  if (0 < unaff_EDI) {
    do {
      iVar2 = uIDNewItem * 4;
      uIDNewItem = uIDNewItem + 1;
      AppendMenuA(local_14,0,uIDNewItem,*(LPCSTR *)(param_2 + iVar2));
    } while ((int)uIDNewItem < unaff_EDI);
  }
  iVar2 = CMenu::TrackPopupMenu((CMenu *)&local_18,0x100,param_3,param_4,param_1,(tagRECT *)0x0);
  local_8 = 0xffffffff;
  local_18 = &PTR_LAB_0052f5d4;
  FID_conflict_DeleteObject(unaff_ESI);
  ExceptionList = local_10;
  return iVar2 + -1;
}

