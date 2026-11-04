// 100a97cd size=90 FUN_100a97cd

undefined4 FUN_100a97cd(int param_1,undefined4 param_2)

{
  undefined4 *puVar1;
  uint uVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  
  if ((*(uint *)(param_1 + 0x1c) & 7) == 0) {
    puVar1 = (undefined4 *)FUN_100857f7(*(uint *)(param_1 + 0x1c) + 8);
    if (puVar1 == (undefined4 *)0x0) {
      return 0x8007000e;
    }
    puVar4 = *(undefined4 **)(param_1 + 0x20);
    puVar5 = puVar1;
    for (uVar2 = *(uint *)(param_1 + 0x1c) & 0x3fffffff; uVar2 != 0; uVar2 = uVar2 - 1) {
      *puVar5 = *puVar4;
      puVar4 = puVar4 + 1;
      puVar5 = puVar5 + 1;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(undefined1 *)puVar5 = *(undefined1 *)puVar4;
      puVar4 = (undefined4 *)((int)puVar4 + 1);
      puVar5 = (undefined4 *)((int)puVar5 + 1);
    }
    *(undefined4 **)(param_1 + 0x20) = puVar1;
  }
  *(undefined4 *)(*(int *)(param_1 + 0x20) + *(int *)(param_1 + 0x1c) * 4) = param_2;
  *(int *)(param_1 + 0x1c) = *(int *)(param_1 + 0x1c) + 1;
  return 0;
}


