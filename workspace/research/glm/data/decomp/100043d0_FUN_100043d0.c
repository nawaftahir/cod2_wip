// 100043d0 size=82 FUN_100043d0

void FUN_100043d0(int *param_1)

{
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  int iVar4;
  
  iVar2 = FUN_10001940();
  iVar4 = *(int *)(*param_1 + 100);
  iVar1 = param_1[1];
  puVar3 = (undefined4 *)(*(code *)RI_Hunk_AllocInternal)(iVar2 * 4);
  DAT_101ae494 = puVar3;
  if (0 < iVar2) {
    iVar4 = (iVar4 + iVar1) - (int)puVar3;
    do {
      *puVar3 = *(undefined4 *)(iVar4 + (int)puVar3);
      puVar3 = puVar3 + 1;
      iVar2 = iVar2 + -1;
    } while (iVar2 != 0);
  }
  return;
}


