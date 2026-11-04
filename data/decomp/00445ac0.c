
void __thiscall FUN_00445ac0(int param_1,undefined4 param_2,undefined4 *param_3)

{
  HWND pHVar1;
  HWND hWnd;
  int *piVar2;
  int iVar3;
  LRESULT LVar4;
  LPCWSTR unaff_EDI;
  HWND local_18;
  uchar *local_14;
  void *local_10;
  undefined1 *puStack_c;
  uint local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00525680;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  piVar2 = (int *)FUN_004ff4c3();
  iVar3 = (**(code **)(*piVar2 + 0xc))();
  local_18 = (HWND)(iVar3 + 0x10);
  local_8 = 0;
  piVar2 = (int *)FUN_004ff4c3();
  iVar3 = (**(code **)(*piVar2 + 0xc))();
  local_14 = (uchar *)(iVar3 + 0x10);
  local_8 = CONCAT31(local_8._1_3_,1);
  LVar4 = SendMessageA(*(HWND *)(param_1 + 0x1cc),0x400,0,0);
  FUN_004075c0(&local_18,&DAT_00545f4c,LVar4);
  CWnd::GetWindowTextA
            ((CWnd *)(param_1 + 0xc0),
             (CStringT<char,StrTraitMFC<char,ATL::ChTraitsCRT<char>_>_> *)&local_14);
  hWnd = local_18;
  iVar3 = __mbscmp((uchar *)local_18,local_14);
  if (iVar3 != 0) {
    FID_conflict_SetWindowTextW(hWnd,unaff_EDI);
  }
  local_8 = local_8 & 0xffffff00;
  *param_3 = 0;
  piVar2 = (int *)(local_14 + -4);
  LOCK();
  iVar3 = *piVar2;
  *piVar2 = *piVar2 + -1;
  UNLOCK();
  if (iVar3 == 1 || iVar3 + -1 < 0) {
    (**(code **)(**(int **)(local_14 + -0x10) + 4))(local_14 + -0x10);
  }
  local_8 = 0xffffffff;
  pHVar1 = hWnd + -1;
  LOCK();
  iVar3 = pHVar1->unused;
  pHVar1->unused = pHVar1->unused + -1;
  UNLOCK();
  if (iVar3 == 1 || iVar3 + -1 < 0) {
    (**(code **)(*(int *)hWnd[-4].unused + 4))(hWnd + -4);
  }
  ExceptionList = local_10;
  return;
}

