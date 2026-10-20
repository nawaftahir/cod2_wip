
void __fastcall FUN_0040a4c0(int param_1)

{
  int nMaxPos;
  BOOL bRedraw;
  
  FUN_004fc069(1);
  *(undefined4 *)(PTR_DAT_00597154 + 0x5c) = *(undefined4 *)(param_1 + 0x164);
  FUN_0040b010();
  FUN_0049b7a0(PTR_DAT_00597154);
  bRedraw = 1;
  nMaxPos = FUN_004df760();
  SetScrollRange(*(HWND *)(param_1 + 0x8c),2,0,nMaxPos,bRedraw);
  return;
}

