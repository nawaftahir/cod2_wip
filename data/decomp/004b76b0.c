
void FUN_004b76b0(int param_1,int *param_2)

{
  undefined4 *puVar1;
  
  FUN_004b5770();
  puVar1 = (undefined4 *)FUN_004be490(&DAT_00528ecc,param_2);
  if (*param_2 < 2) {
    (**(code **)(**(int **)(param_1 + 200 + *(int *)(param_1 + 0xd8) * 4) + 0x28))(*puVar1,param_2);
  }
  return;
}

