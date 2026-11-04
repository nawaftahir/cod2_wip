
undefined4 __fastcall FUN_00446490(CDialog *param_1)

{
  HWND pHVar1;
  LONG LVar2;
  uint uVar3;
  
  CDialog::OnInitDialog(param_1);
  uVar3 = 0;
  do {
    if (param_1 == (CDialog *)0x0) {
      pHVar1 = (HWND)0x0;
    }
    else {
      pHVar1 = *(HWND *)(param_1 + 0x1c);
    }
    pHVar1 = GetDlgItem(pHVar1,*(int *)((int)&DAT_00591b38 + uVar3));
    *(HWND *)((int)&DAT_00591b3c + uVar3) = pHVar1;
    LVar2 = GetWindowLongA(pHVar1,-4);
    *(LONG *)((int)&DAT_00591b40 + uVar3) = LVar2;
    SetWindowLongA(*(HWND *)((int)&DAT_00591b3c + uVar3),-4,0x446410);
    uVar3 = uVar3 + 0xc;
  } while (uVar3 < 0x84);
  CSliderCtrl::SetRange((CSliderCtrl *)(param_1 + 0x90),0,0xff,0);
  CSliderCtrl::SetRange((CSliderCtrl *)(param_1 + 0xe0),0,0xf0,0);
  CSliderCtrl::SetRange((CSliderCtrl *)(param_1 + 0x130),0,0xf0,0);
  CSliderCtrl::SetRange((CSliderCtrl *)(param_1 + 0x180),0,0xf0,0);
  SendMessageA(*(HWND *)(param_1 + 0x28c),0xf1,1,0);
  FUN_004fc069(0);
  return 1;
}

