
void __fastcall FUN_00449590(CWnd *param_1)

{
  int *piVar1;
  int iVar2;
  void *_Memory;
  undefined4 *puVar3;
  HGDIOBJ unaff_ESI;
  HGDIOBJ unaff_EDI;
  void *local_10;
  undefined1 *puStack_c;
  int local_8;
  
  local_10 = ExceptionList;
  puStack_c = &LAB_00524f54;
  ExceptionList = &local_10;
  *(undefined ***)param_1 = &PTR_LAB_0054bf74;
  local_8 = 2;
  iVar2 = *(int *)(param_1 + 0xf0);
  while (iVar2 != 0) {
    _Memory = *(void **)(param_1 + 0xf0);
    *(undefined4 *)(param_1 + 0xf0) = *(undefined4 *)((int)_Memory + 8);
    if (_Memory != (void *)0x0) {
      puVar3 = (undefined4 *)(*(int *)((int)_Memory + 4) + -0x10);
      piVar1 = (int *)(*(int *)((int)_Memory + 4) + -4);
      LOCK();
      iVar2 = *piVar1;
      *piVar1 = *piVar1 + -1;
      UNLOCK();
      if (iVar2 == 1 || iVar2 + -1 < 0) {
        (**(code **)(*(int *)*puVar3 + 4))(puVar3);
      }
      _free(_Memory);
    }
    iVar2 = *(int *)(param_1 + 0xf0);
  }
  FID_conflict_DeleteObject(unaff_EDI);
  local_8._0_1_ = 1;
  puVar3 = (undefined4 *)(*(int *)(param_1 + 0xec) + -0x10);
  piVar1 = (int *)(*(int *)(param_1 + 0xec) + -4);
  LOCK();
  iVar2 = *piVar1;
  *piVar1 = *piVar1 + -1;
  UNLOCK();
  if (iVar2 == 1 || iVar2 + -1 < 0) {
    (**(code **)(*(int *)*puVar3 + 4))(puVar3);
  }
  local_8 = (uint)local_8._1_3_ << 8;
  *(undefined ***)(param_1 + 0xe0) = &PTR_LAB_0052f5d4;
  FID_conflict_DeleteObject(unaff_ESI);
  local_8 = 0xffffffff;
  CWnd::~CWnd(param_1);
  ExceptionList = local_10;
  return;
}

