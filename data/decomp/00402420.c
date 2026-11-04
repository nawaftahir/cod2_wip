
void __thiscall FUN_00402420(CWnd *param_1,int param_2,tagDRAWITEMSTRUCT *param_3)

{
  CWnd CVar1;
  HBRUSH pHVar2;
  
  if (param_2 == 0x5b6) {
    pHVar2 = CreateSolidBrush(*(COLORREF *)(param_1 + 0x4d0));
    FillRect(*(HDC *)(param_3 + 0x18),(RECT *)(param_3 + 0x1c),pHVar2);
    DeleteObject(pHVar2);
    return;
  }
  if (param_2 == 0x5ba) {
    CVar1 = param_1[0x4d4];
    pHVar2 = CreateSolidBrush((uint)CONCAT21(CONCAT11(CVar1,CVar1),CVar1));
    FillRect(*(HDC *)(param_3 + 0x18),(RECT *)(param_3 + 0x1c),pHVar2);
    DeleteObject(pHVar2);
    return;
  }
  CWnd::OnDrawItem(param_1,param_2,param_3);
  return;
}

