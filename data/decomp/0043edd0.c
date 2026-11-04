
void __fastcall FUN_0043edd0(CDialog *param_1)

{
  LRESULT LVar1;
  LRESULT LVar2;
  int iVar3;
  int iVar4;
  
  LVar1 = SendMessageA(*(HWND *)(param_1 + 0xdc),0x147,0,0);
  iVar3 = LVar1 + 2;
  LVar2 = SendMessageA(*(HWND *)(param_1 + 0x8c),0x147,0,0);
  iVar4 = LVar2 + 2;
  if ((((1 < iVar3) && (iVar3 < 0x10)) && (1 < iVar4)) && (iVar4 < 0x10)) {
    FUN_004296f0(iVar3,iVar4,*(undefined4 *)(*(int *)(DAT_01233488 + 0x7e0) + 0xf4),1);
    DAT_0123348c = 0xffffffff;
  }
  DAT_00590a60 = LVar1;
  DAT_00590a64 = LVar2;
  CDialog::OnOK(param_1);
  return;
}

