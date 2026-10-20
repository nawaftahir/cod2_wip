
void FUN_00440d90(HMENU param_1,LPCSTR param_2,int param_3,int param_4,int param_5)

{
  LPCSTR lpNewItem;
  HMENU hMenu;
  int iVar1;
  UINT uFlags;
  UINT_PTR uIDNewItem;
  
  hMenu = CreateMenu();
  iVar1 = 0;
  if (0 < param_4) {
    do {
      lpNewItem = *(LPCSTR *)(param_3 + iVar1 * 8);
      if (lpNewItem == (LPCSTR)0x0) {
        uFlags = 0x800;
        uIDNewItem = 0;
      }
      else {
        uIDNewItem = iVar1 + param_5;
        uFlags = 0;
      }
      AppendMenuA(hMenu,uFlags,uIDNewItem,lpNewItem);
      iVar1 = iVar1 + 1;
    } while (iVar1 < param_4);
  }
  AppendMenuA(param_1,0x10,(UINT_PTR)hMenu,param_2);
  return;
}

