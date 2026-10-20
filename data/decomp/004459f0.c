
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_004459f0(int param_1)

{
  int *piVar1;
  int iVar2;
  long lVar3;
  char *local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_005263f8;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  piVar1 = (int *)FUN_004ff4c3();
  iVar2 = (**(code **)(*piVar1 + 0xc))();
  local_14 = (char *)(iVar2 + 0x10);
  local_8 = 0;
  CWnd::GetWindowTextA
            ((CWnd *)(param_1 + 0xc0),
             (CStringT<char,StrTraitMFC<char,ATL::ChTraitsCRT<char>_>_> *)&local_14);
  if (*(int *)(local_14 + -0xc) < 1) {
    FUN_00445c60();
  }
  else {
    lVar3 = _atol(local_14);
    FUN_004075c0(&local_14,&DAT_0054a814,(double)((float)lVar3 / _DAT_00556c8c));
    FUN_00445370();
  }
  local_8 = 0xffffffff;
  piVar1 = (int *)(local_14 + -4);
  LOCK();
  iVar2 = *piVar1;
  *piVar1 = *piVar1 + -1;
  UNLOCK();
  if (iVar2 == 1 || iVar2 + -1 < 0) {
    (**(code **)(**(int **)(local_14 + -0x10) + 4))(local_14 + -0x10);
  }
  ExceptionList = local_10;
  return;
}

