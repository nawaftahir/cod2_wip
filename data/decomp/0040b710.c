
void __fastcall FUN_0040b710(int param_1)

{
  undefined4 *puVar1;
  int iVar2;
  
  iVar2 = 0;
  if (0 < *(int *)(param_1 + 0x28)) {
    do {
      puVar1 = (undefined4 *)FUN_0040b780();
      _free((void *)*puVar1);
      puVar1 = (undefined4 *)FUN_0040b780();
      *puVar1 = 0;
      iVar2 = iVar2 + 1;
    } while (iVar2 < *(int *)(param_1 + 0x28));
  }
  if (*(void **)(param_1 + 0x34) != (void *)0x0) {
    _free(*(void **)(param_1 + 0x34));
  }
  *(undefined4 *)(param_1 + 0x34) = 0;
  *(int *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0;
  return;
}

