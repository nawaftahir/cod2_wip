
void __fastcall FUN_00409be0(int param_1)

{
  int *piVar1;
  int iVar2;
  CDialog local_88 [112];
  int local_18;
  int local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_005261a6;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  FUN_0040bcf0(local_88,0);
  local_8 = 0;
  iVar2 = FUN_004fa9b3();
  if (iVar2 == 1) {
    iVar2 = GetScrollPos(*(HWND *)(param_1 + 0x8c),2);
    FUN_0049c5c0(local_14 + 1,local_18,((int)(iVar2 + (iVar2 >> 0x1f & 3U)) >> 2) * 1000);
    FUN_00409f90(param_1);
  }
  local_8 = 1;
  piVar1 = (int *)(local_18 + -4);
  LOCK();
  iVar2 = *piVar1;
  *piVar1 = *piVar1 + -1;
  UNLOCK();
  if (iVar2 == 1 || iVar2 + -1 < 0) {
    (**(code **)(**(int **)(local_18 + -0x10) + 4))((undefined4 *)(local_18 + -0x10));
  }
  local_8 = 0xffffffff;
  CDialog::~CDialog(local_88);
  ExceptionList = local_10;
  return;
}

