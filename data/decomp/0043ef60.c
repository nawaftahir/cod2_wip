
void __fastcall FUN_0043ef60(CWnd *param_1)

{
  int *piVar1;
  int iVar2;
  CWnd *local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00525248;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  local_14 = param_1;
  piVar1 = (int *)FUN_004ff4c3();
  iVar2 = (**(code **)(*piVar1 + 0xc))();
  local_14 = (CWnd *)(iVar2 + 0x10);
  local_8 = 0;
  CWnd::GetWindowTextA
            (param_1,(CStringT<char,StrTraitMFC<char,ATL::ChTraitsCRT<char>_>_> *)&local_14);
  if (*(int *)(param_1 + 0x50) != 0) {
    FUN_00442d60();
  }
  local_8 = 0xffffffff;
  piVar1 = (int *)((int)local_14 + -4);
  LOCK();
  iVar2 = *piVar1;
  *piVar1 = *piVar1 + -1;
  UNLOCK();
  if (iVar2 == 1 || iVar2 + -1 < 0) {
    (**(code **)(**(int **)((int)local_14 + -0x10) + 4))((undefined4 *)((int)local_14 + -0x10));
  }
  ExceptionList = local_10;
  return;
}

