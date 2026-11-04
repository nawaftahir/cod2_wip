
void __fastcall FUN_004baf20(int param_1)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  long lVar3;
  
  puVar1 = (undefined4 *)FUN_004be450(&DAT_0052acfc);
  puVar2 = (undefined4 *)FUN_004be450(&DAT_0052ae98);
  if (puVar1 != (undefined4 *)0x0) {
    lVar3 = _atol((char *)*puVar1);
    *(int *)(param_1 + 0x1c) = *(int *)(param_1 + 0x1c) - lVar3;
  }
  if (puVar2 != (undefined4 *)0x0) {
    lVar3 = _atol((char *)*puVar2);
    *(int *)(param_1 + 0x24) = *(int *)(param_1 + 0x24) - lVar3;
  }
  return;
}

