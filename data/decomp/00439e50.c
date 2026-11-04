
void __fastcall FUN_00439e50(CDialog *param_1)

{
  int iVar1;
  LRESULT LVar2;
  undefined4 uVar3;
  
  LVar2 = SendMessageA(*(HWND *)(param_1 + 300),0x400,0,0);
  *(LRESULT *)(param_1 + 0x2b8) = LVar2;
  uVar3 = FUN_004df760();
  *(undefined4 *)(param_1 + 0x2b4) = uVar3;
  FUN_0043aa70();
  if (DAT_01233488 != 0) {
    FUN_00419560();
  }
  iVar1 = *(int *)(param_1 + 0x29c);
  DAT_0123348c = 0xffffffff;
  FUN_00443590();
  DAT_00591b24 = 1;
  if (0 < iVar1) {
    DAT_00591b24 = iVar1;
  }
  CDialog::OnOK(param_1);
  return;
}

