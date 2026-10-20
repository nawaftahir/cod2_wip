
void __fastcall FUN_0040a790(undefined4 param_1)

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
  puStack_c = &LAB_0052629e;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  FUN_00424090(local_88,"Open Camera File",0);
  local_8 = 0;
  iVar2 = FUN_004fa9b3();
  if (iVar2 == 1) {
    FUN_0040aaa0();
    DAT_011298b4 = FUN_0040b350();
    FUN_004969e0("cameras/%s.camera",local_14);
    FUN_0049c2b0();
    FUN_00409f90(param_1);
    DAT_0123348c = 0xffffffff;
  }
  local_8 = 2;
  piVar1 = (int *)(local_14 + -4);
  LOCK();
  iVar2 = *piVar1;
  *piVar1 = *piVar1 + -1;
  UNLOCK();
  if (iVar2 == 1 || iVar2 + -1 < 0) {
    (**(code **)(**(int **)(local_14 + -0x10) + 4))((undefined4 *)(local_14 + -0x10));
  }
  local_8 = CONCAT31(local_8._1_3_,1);
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

