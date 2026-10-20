
void __thiscall FUN_00446bc0(CWnd *param_1,int param_2,tagDRAWITEMSTRUCT *param_3)

{
  HBRUSH hbr;
  
  if (param_2 == 0x5b7) {
    hbr = CreateSolidBrush((uint)CONCAT21(CONCAT11(param_1[0x7c],param_1[0x78]),param_1[0x74]));
    FillRect(*(HDC *)(param_3 + 0x18),(RECT *)(param_3 + 0x1c),hbr);
    DeleteObject(hbr);
    return;
  }
  CWnd::OnDrawItem(param_1,param_2,param_3);
  return;
}

