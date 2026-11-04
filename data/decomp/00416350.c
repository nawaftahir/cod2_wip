
void FUN_00416350(CDialog *param_1)

{
  int *piVar1;
  int iVar2;
  undefined4 *puVar3;
  void *local_10;
  undefined1 *puStack_c;
  int local_8;
  
  puStack_c = &LAB_00524d51;
  local_10 = ExceptionList;
  local_8 = 2;
  puVar3 = (undefined4 *)(*(int *)(param_1 + 0x168) + -0x10);
  piVar1 = (int *)(*(int *)(param_1 + 0x168) + -4);
  LOCK();
  iVar2 = *piVar1;
  ExceptionList = &local_10;
  *piVar1 = *piVar1 + -1;
  UNLOCK();
  if (iVar2 + -1 < 1) {
    (**(code **)(*(int *)*puVar3 + 4))(puVar3);
  }
  puVar3 = (undefined4 *)(*(int *)(param_1 + 0x164) + -0x10);
  piVar1 = (int *)(*(int *)(param_1 + 0x164) + -4);
  LOCK();
  iVar2 = *piVar1;
  *piVar1 = *piVar1 + -1;
  UNLOCK();
  if (iVar2 + -1 < 1) {
    (**(code **)(*(int *)*puVar3 + 4))(puVar3);
  }
  puVar3 = (undefined4 *)(*(int *)(param_1 + 0x160) + -0x10);
  piVar1 = (int *)(*(int *)(param_1 + 0x160) + -4);
  LOCK();
  iVar2 = *piVar1;
  *piVar1 = *piVar1 + -1;
  UNLOCK();
  if (iVar2 == 1 || iVar2 + -1 < 0) {
    (**(code **)(*(int *)*puVar3 + 4))(puVar3);
  }
  FID_conflict__CHotKeyCtrl();
  local_8._0_1_ = 1;
  FID_conflict__CHotKeyCtrl();
  local_8 = (uint)local_8._1_3_ << 8;
  FID_conflict__CHotKeyCtrl();
  local_8 = 0xffffffff;
  CDialog::~CDialog(param_1);
  ExceptionList = local_10;
  return;
}

