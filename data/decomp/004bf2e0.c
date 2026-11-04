
void __thiscall FUN_004bf2e0(int *param_1,undefined4 *param_2)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  undefined4 *puVar5;
  undefined4 *puVar6;
  
  iVar2 = param_1[1];
  iVar1 = param_2[1] + 1 + iVar2;
  param_1[1] = iVar1;
  if (param_1[2] < iVar1) {
    FUN_004bf1c0(iVar2);
  }
  uVar4 = param_2[1];
  iVar1 = *param_1;
  puVar5 = (undefined4 *)*param_2;
  puVar6 = (undefined4 *)(iVar1 + iVar2);
  for (uVar3 = uVar4 >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
    *puVar6 = *puVar5;
    puVar5 = puVar5 + 1;
    puVar6 = puVar6 + 1;
  }
  for (uVar4 = uVar4 & 3; uVar4 != 0; uVar4 = uVar4 - 1) {
    *(undefined1 *)puVar6 = *(undefined1 *)puVar5;
    puVar5 = (undefined4 *)((int)puVar5 + 1);
    puVar6 = (undefined4 *)((int)puVar6 + 1);
  }
  *(undefined1 *)(iVar1 + iVar2 + param_2[1]) = 0;
  param_1[1] = param_1[1] + -1;
  return;
}

