
void __fastcall FUN_0040c8f0(int param_1)

{
  int iVar1;
  _TREEITEM *p_Var2;
  ulong uVar3;
  
  p_Var2 = (_TREEITEM *)SendMessageA(*(HWND *)(param_1 + 0xdc),0x110a,9,0);
  if (p_Var2 == (_TREEITEM *)0x0) {
    DAT_0123348c = 0xffffffff;
    return;
  }
  uVar3 = CTreeCtrl::GetItemData((CTreeCtrl *)(param_1 + 0xc0),p_Var2);
  if (uVar3 != 0) {
    FUN_0046fbe0(1);
    for (iVar1 = *(int *)(uVar3 + 0x18); iVar1 != uVar3 + 0xc; iVar1 = *(int *)(iVar1 + 0xc)) {
      FUN_0046f0b0(1,1,1);
    }
  }
  DAT_0123348c = 0xffffffff;
  return;
}

