
undefined4 __fastcall FUN_004241c0(CDialog *param_1)

{
  LPCWSTR unaff_ESI;
  
  CDialog::OnInitDialog(param_1);
  FID_conflict_SetWindowTextW(*(HWND *)(param_1 + 0x70),unaff_ESI);
  return 1;
}

