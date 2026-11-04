
void FUN_004b7a10(int param_1,int *param_2)

{
  undefined4 *puVar1;
  
  puVar1 = (undefined4 *)FUN_004be490(&DAT_00528ecc,param_2);
  if (*param_2 < 2) {
    (**(code **)(**(int **)(param_1 + 200 + *(int *)(param_1 + 0xd8) * 4) + 0x18))
              (*puVar1,puVar1[1]);
  }
  return;
}

