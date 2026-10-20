
CColorDialog * __fastcall
FUN_00479920(ulong param_1,ulong param_2,CColorDialog *param_3,CWnd *param_4)

{
  bool bVar1;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00525928;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  CColorDialog::CColorDialog(param_3,param_2,param_1,param_4);
  local_8 = 0;
  bVar1 = DAT_00591d84 != '\0';
  *(undefined ***)param_3 = &PTR_LAB_005504bc;
  if (bVar1) {
    FUN_00479760();
  }
  *(undefined4 **)(param_3 + 0x80) = &DAT_01129a78;
  ExceptionList = local_10;
  return param_3;
}

