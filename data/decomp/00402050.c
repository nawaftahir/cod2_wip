
void __fastcall FUN_00402050(int param_1)

{
  uint uVar1;
  double dVar2;
  tagRECT local_18;
  float local_8;
  
  GetWindowRect(*(HWND *)(param_1 + 0xdc),&local_18);
  uVar1 = FUN_00401fa0(param_1,&PTR_DAT_0058fa38,local_18.right,local_18.top);
  if ((-1 < (int)uVar1) && (uVar1 < 7)) {
    dVar2 = _atof((&PTR_DAT_0058fa38)[uVar1]);
    local_8 = (float)dVar2;
    FUN_004010c0(0x590,local_8);
  }
  return;
}

