
void __thiscall FUN_00402d90(int *param_1,int param_2)

{
  int *piVar1;
  undefined4 *puVar2;
  int iVar3;
  undefined4 *puVar4;
  int iVar5;
  uint uVar6;
  undefined4 *puVar7;
  int iVar8;
  undefined4 *puVar9;
  
  puVar2 = (undefined4 *)*param_1;
  puVar7 = puVar2 + -4;
  iVar3 = puVar2[-3];
  puVar4 = (undefined4 *)(**(code **)(*(int *)*puVar7 + 0x10))();
  iVar5 = (**(code **)*puVar4)(param_2,1);
  if (iVar5 == 0) {
    iVar5 = FUN_00402e20();
  }
  iVar8 = iVar3;
  if (param_2 <= iVar3) {
    iVar8 = param_2;
  }
  puVar9 = (undefined4 *)(iVar5 + 0x10);
  puVar4 = puVar2;
  for (uVar6 = iVar8 + 1U >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
    *puVar9 = *puVar4;
    puVar9 = puVar9 + 1;
    puVar4 = puVar4 + 1;
  }
  for (uVar6 = iVar8 + 1U & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
    *(undefined1 *)puVar9 = *(undefined1 *)puVar4;
    puVar4 = (undefined4 *)((int)puVar4 + 1);
    puVar9 = (undefined4 *)((int)puVar9 + 1);
  }
  *(int *)(iVar5 + 4) = iVar3;
  piVar1 = puVar2 + -1;
  LOCK();
  iVar3 = *piVar1;
  *piVar1 = *piVar1 + -1;
  UNLOCK();
  if (iVar3 == 1 || iVar3 + -1 < 0) {
    (**(code **)(*(int *)*puVar7 + 4))(puVar7);
  }
  *param_1 = iVar5 + 0x10;
  return;
}

