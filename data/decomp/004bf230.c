
void __thiscall FUN_004bf230(int *param_1,undefined4 *param_2,uint param_3)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  undefined4 *puVar4;
  
  iVar2 = param_1[1];
  iVar1 = iVar2 + 1 + param_3;
  param_1[1] = iVar1;
  if (param_1[2] < iVar1) {
    FUN_004bf1c0(iVar2);
  }
  iVar1 = *param_1;
  puVar4 = (undefined4 *)(iVar1 + iVar2);
  for (uVar3 = param_3 >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
    *puVar4 = *param_2;
    param_2 = param_2 + 1;
    puVar4 = puVar4 + 1;
  }
  for (uVar3 = param_3 & 3; uVar3 != 0; uVar3 = uVar3 - 1) {
    *(undefined1 *)puVar4 = *(undefined1 *)param_2;
    param_2 = (undefined4 *)((int)param_2 + 1);
    puVar4 = (undefined4 *)((int)puVar4 + 1);
  }
  *(undefined1 *)(iVar1 + iVar2 + param_3) = 0;
  param_1[1] = param_1[1] + -1;
  return;
}

