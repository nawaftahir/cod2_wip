
void __fastcall FUN_0040fe80(CDialog *param_1)

{
  tagRECT local_14;
  
  FUN_004fc069(1);
  GetWindowRect(*(HWND *)(param_1 + 0x1c),&local_14);
  FUN_0047a140("Radiant::TextureFindWindow",&local_14,0x10);
  FUN_00473940(*(undefined4 *)(param_1 + 0x74),*(undefined4 *)(param_1 + 0x78),
               CONCAT31((int3)((uint)*(int *)(param_1 + 0x80) >> 8),*(int *)(param_1 + 0x70) != 0),
               *(int *)(param_1 + 0x7c) != 0,*(int *)(param_1 + 0x80) != 0);
  CDialog::OnOK(param_1);
  return;
}

