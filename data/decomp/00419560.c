
void FUN_00419560(void)

{
  undefined4 *puVar1;
  int iVar2;
  int *piVar3;
  undefined4 uVar4;
  int local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_00525868;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  piVar3 = (int *)FUN_004ff4c3();
  local_14 = (**(code **)(*piVar3 + 0xc))();
  local_14 = local_14 + 0x10;
  local_8 = 0;
  uVar4 = FUN_00449760(*(undefined4 *)(DAT_01233b64 + 0x2c4),
                       ((*(int *)(DAT_01233b64 + 0x1b8) == 0) - 1U & 0x2d) + 0x20,
                       ((*(int *)(DAT_01233b64 + 0x244) == 0) - 1U & 0x32) + 0x20,
                       ((*(int *)(DAT_01233b64 + 0x1bc) == 0) - 1U & 0x2c) + 0x20);
  FUN_004075c0(&local_14,"G:%i T:%i R:%i C:%i L:%c%c",DAT_010bcd2c,DAT_0112988c,uVar4);
  iVar2 = local_14;
  if (local_14 != 0) {
    FUN_00402a70(local_14);
    FUN_00417cf0();
  }
  puVar1 = (undefined4 *)(iVar2 + -0x10);
  local_8 = 0xffffffff;
  piVar3 = (int *)(iVar2 + -4);
  LOCK();
  iVar2 = *piVar3;
  *piVar3 = *piVar3 + -1;
  UNLOCK();
  if (iVar2 == 1 || iVar2 + -1 < 0) {
    (**(code **)(*(int *)*puVar1 + 4))(puVar1);
  }
  ExceptionList = local_10;
  return;
}

