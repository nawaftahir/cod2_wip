
void __fastcall FUN_00445900(int param_1)

{
  int iVar1;
  int *piVar2;
  LPCWSTR unaff_EDI;
  int local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00526418;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  local_14 = param_1;
  piVar2 = (int *)FUN_004ff4c3();
  local_14 = (**(code **)(*piVar2 + 0xc))();
  local_14 = local_14 + 0x10;
  local_8 = 0;
  CWnd::GetWindowTextA
            ((CWnd *)(param_1 + 0x70),
             (CStringT<char,StrTraitMFC<char,ATL::ChTraitsCRT<char>_>_> *)&local_14);
  if (*(int *)(local_14 + -0xc) < 1) {
    FID_conflict_SetWindowTextW((HWND)&DAT_0053d753,unaff_EDI);
    FUN_00445420();
  }
  else {
    FUN_00445370();
  }
  local_8 = 0xffffffff;
  piVar2 = (int *)(local_14 + -4);
  LOCK();
  iVar1 = *piVar2;
  *piVar2 = *piVar2 + -1;
  UNLOCK();
  if (iVar1 == 1 || iVar1 + -1 < 0) {
    (**(code **)(**(int **)(local_14 + -0x10) + 4))((undefined4 *)(local_14 + -0x10));
  }
  ExceptionList = local_10;
  return;
}

