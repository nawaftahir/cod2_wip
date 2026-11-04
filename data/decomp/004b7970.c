
void FUN_004b7970(int param_1,int *param_2)

{
  char cVar1;
  char cVar2;
  undefined4 *puVar3;
  int iVar4;
  char *pcVar5;
  char *pcVar6;
  
  FUN_004b5770();
  puVar3 = (undefined4 *)FUN_004be450("trans");
  if (puVar3 != (undefined4 *)0x0) {
    iVar4 = 3;
    pcVar5 = (char *)*puVar3;
    pcVar6 = "no";
    do {
      if (iVar4 == 0) break;
      iVar4 = iVar4 + -1;
      cVar2 = *pcVar6;
      cVar1 = *pcVar5;
      pcVar5 = pcVar5 + 1;
      pcVar6 = pcVar6 + 1;
    } while (cVar1 == cVar2);
  }
  puVar3 = (undefined4 *)FUN_004be490(&DAT_00528ecc,param_2);
  if (*param_2 < 2) {
    (**(code **)(**(int **)(param_1 + 200 + *(int *)(param_1 + 0xd8) * 4) + 0x1c))
              (*puVar3,puVar3[1]);
  }
  else if (*param_2 != 4) {
    *(int *)(param_1 + 0xf4) = *(int *)(param_1 + 0xf4) + 1;
    (**(code **)(**(int **)(param_1 + 200 + *(int *)(param_1 + 0xd8) * 4) + 8))(param_2);
    *param_2 = 0;
    return;
  }
  return;
}

