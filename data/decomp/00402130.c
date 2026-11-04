
void __fastcall FUN_00402130(int param_1)

{
  uint uVar1;
  double dVar2;
  tagRECT local_18;
  float local_8;
  
  GetWindowRect(*(HWND *)(param_1 + 300),&local_18);
  uVar1 = FUN_00401fa0(param_1,&PTR_s_0_125_0058f9fc,local_18.right,local_18.top);
  if ((-1 < (int)uVar1) && (uVar1 < 8)) {
    dVar2 = _atof((&PTR_s_0_125_0058f9fc)[uVar1]);
    local_8 = (float)dVar2;
    FUN_00401cd0(local_8);
  }
  return;
}

