
void FUN_004b6c40(undefined4 param_1,int *param_2)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  int iVar3;
  
  uVar1 = FUN_004be490("handle",param_2);
  puVar2 = (undefined4 *)FUN_004be490(&DAT_00528ecc,param_2);
  if (*param_2 < 2) {
    iVar3 = FUN_004c2460(uVar1,param_2);
    if ((*param_2 < 2) && (*(int *)(iVar3 + 8) == 0)) {
      (**(code **)(**(int **)(iVar3 + 0xc) + 0x14))(*puVar2,puVar2[1],param_2);
      if (1 < *param_2) {
        *(undefined4 *)(iVar3 + 8) = 1;
      }
      FUN_004b6c00(param_2);
    }
  }
  return;
}

