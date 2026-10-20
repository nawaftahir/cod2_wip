
void __thiscall FUN_004be7d0(int param_1,undefined4 *param_2,undefined4 *param_3)

{
  undefined4 uVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  undefined4 *puVar5;
  
  if (*(int *)(param_1 + 0x70) == 10) {
    *(undefined4 *)(param_1 + 0x70) = 9;
  }
  iVar2 = *(int *)(param_1 + 0x70) * 0x10;
  *(int *)(param_1 + 0x70) = *(int *)(param_1 + 0x70) + 1;
  uVar1 = param_2[1];
  *(undefined4 *)(iVar2 + 0x74 + param_1) = *param_2;
  iVar2 = iVar2 + 0x74 + param_1;
  *(undefined4 *)(iVar2 + 4) = uVar1;
  *(undefined4 *)(iVar2 + 8) = *(undefined4 *)(param_1 + 0x50);
  *(undefined4 *)(iVar2 + 0xc) = param_3[1];
  uVar4 = param_3[1];
  iVar2 = *(int *)(param_1 + 0x50);
  param_3 = (undefined4 *)*param_3;
  *(uint *)(param_1 + 0x50) = iVar2 + uVar4;
  if (*(int *)(param_1 + 0x54) < (int)(iVar2 + uVar4)) {
    FUN_004bf1c0(iVar2);
  }
  puVar5 = (undefined4 *)(*(int *)(param_1 + 0x4c) + iVar2);
  for (uVar3 = uVar4 >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
    *puVar5 = *param_3;
    param_3 = param_3 + 1;
    puVar5 = puVar5 + 1;
  }
  for (uVar4 = uVar4 & 3; uVar4 != 0; uVar4 = uVar4 - 1) {
    *(undefined1 *)puVar5 = *(undefined1 *)param_3;
    param_3 = (undefined4 *)((int)param_3 + 1);
    puVar5 = (undefined4 *)((int)puVar5 + 1);
  }
  return;
}

