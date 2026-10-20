
void FUN_00464c20(int param_1)

{
  int iVar1;
  
  iVar1 = *(int *)(param_1 + 0x38);
  if (iVar1 != 0) {
    if (*(int *)(iVar1 + 4) != iVar1) {
      do {
        FUN_004678c0();
      } while (*(int *)(*(int *)(param_1 + 0x38) + 4) != *(int *)(param_1 + 0x38));
    }
    _free(*(void **)(param_1 + 0x38));
    *(undefined4 *)(param_1 + 0x38) = 0;
  }
  return;
}

