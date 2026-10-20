
void __fastcall FUN_0043eec0(undefined4 *param_1)

{
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  puStack_c = &LAB_00525268;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  *param_1 = &PTR_LAB_00548abc;
  local_8 = 0;
  *(undefined ***)(param_1 + 0x15) = &PTR_LAB_0052ea30;
  CGdiObject::DeleteObject((CGdiObject *)(param_1 + 0x15));
  local_8 = 0xffffffff;
  FID_conflict__CHotKeyCtrl();
  ExceptionList = local_10;
  return;
}

