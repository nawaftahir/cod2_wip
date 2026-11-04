
void __fastcall FUN_00409ce0(int param_1)

{
  int *piVar1;
  int iVar2;
  bool bVar3;
  CDialog local_88 [112];
  undefined4 local_18;
  int local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00526276;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  FUN_00402940(local_88,0);
  local_8 = 0;
  iVar2 = FUN_004fa9b3();
  if (iVar2 == 1) {
    FUN_0049eae0(local_14,local_18);
    FUN_00409f90(param_1);
    SendMessageA(*(HWND *)(param_1 + 300),0x14e,*(WPARAM *)(PTR_DAT_00597154 + 0x1c),0);
    FUN_00409e10();
    FUN_004fc069(1);
    iVar2 = DAT_011298b0;
    bVar3 = DAT_011298b0 == 0xb;
    DAT_011298b0 = 8;
    if (bVar3) {
      FUN_0041b190();
    }
    else if (iVar2 == 10) {
      FUN_0042beb0();
    }
  }
  local_8 = 1;
  piVar1 = (int *)(local_14 + -4);
  LOCK();
  iVar2 = *piVar1;
  *piVar1 = *piVar1 + -1;
  UNLOCK();
  if (iVar2 == 1 || iVar2 + -1 < 0) {
    (**(code **)(**(int **)(local_14 + -0x10) + 4))((undefined4 *)(local_14 + -0x10));
  }
  local_8 = 0xffffffff;
  CDialog::~CDialog(local_88);
  ExceptionList = local_10;
  return;
}

