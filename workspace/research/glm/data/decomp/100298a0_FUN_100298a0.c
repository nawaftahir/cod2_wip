// 100298a0 size=97 FUN_100298a0

void FUN_100298a0(int param_1)

{
  undefined4 *puVar1;
  uint uVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  int iVar6;
  
  if (*(int *)(param_1 + 0x20) != 0) {
    puVar1 = (undefined4 *)(*(code *)RI_Hunk_AllocAlignInternal)(*(int *)(param_1 + 0x20) << 2,4);
    puVar4 = *(undefined4 **)(param_1 + 0x24);
    puVar5 = puVar1;
    for (uVar2 = *(uint *)(param_1 + 0x20) & 0x3fffffff; uVar2 != 0; uVar2 = uVar2 - 1) {
      *puVar5 = *puVar4;
      puVar4 = puVar4 + 1;
      puVar5 = puVar5 + 1;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(undefined1 *)puVar5 = *(undefined1 *)puVar4;
      puVar4 = (undefined4 *)((int)puVar4 + 1);
      puVar5 = (undefined4 *)((int)puVar5 + 1);
    }
    *(undefined4 **)(param_1 + 0x24) = puVar1;
  }
  iVar3 = 0;
  if (0 < *(int *)(param_1 + 0x28)) {
    iVar6 = 0;
    do {
      FUN_100298a0(*(int *)(param_1 + 0x2c) + iVar6);
      iVar3 = iVar3 + 1;
      iVar6 = iVar6 + 0x30;
    } while (iVar3 < *(int *)(param_1 + 0x28));
  }
  return;
}


