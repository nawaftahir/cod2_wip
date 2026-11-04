
void __fastcall FUN_00402be0(int *param_1)

{
  undefined4 *puVar1;
  int *piVar2;
  int *piVar3;
  int iVar4;
  
  iVar4 = *param_1;
  puVar1 = (undefined4 *)(iVar4 + -0x10);
  piVar3 = (int *)*puVar1;
  if (*(int *)(iVar4 + -0xc) != 0) {
    piVar2 = (int *)(iVar4 + -4);
    if (*(int *)(iVar4 + -4) < 0) {
      if (*(int *)(iVar4 + -8) < 0) {
                    /* WARNING: Subroutine does not return */
        FUN_00402c90(0x80070057);
      }
      *(undefined4 *)(iVar4 + -0xc) = 0;
      *(undefined1 *)*param_1 = 0;
      return;
    }
    LOCK();
    iVar4 = *piVar2;
    *piVar2 = *piVar2 + -1;
    UNLOCK();
    if (iVar4 == 1 || iVar4 + -1 < 0) {
      (**(code **)(*(int *)*puVar1 + 4))(puVar1);
    }
    iVar4 = (**(code **)(*piVar3 + 0xc))();
    *param_1 = iVar4 + 0x10;
  }
  return;
}

