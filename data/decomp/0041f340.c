
undefined8 FUN_0041f340(int *param_1)

{
  undefined4 *puVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  int *piVar5;
  int *piVar6;
  undefined8 uVar7;
  
  puVar1 = (undefined4 *)(**(code **)(*(int *)*param_1 + 0x10))();
  piVar5 = param_1 + 3;
  if ((-1 < param_1[3]) && (puVar1 == (undefined4 *)*param_1)) {
    LOCK();
    iVar2 = *piVar5;
    *piVar5 = *piVar5 + 1;
    UNLOCK();
    return CONCAT44(iVar2,param_1);
  }
  iVar2 = (**(code **)*puVar1)(param_1[1],1);
  if (iVar2 == 0) {
    uVar7 = FUN_00402e20();
    return uVar7;
  }
  *(int *)(iVar2 + 4) = param_1[1];
  uVar3 = param_1[1] + 1;
  piVar5 = param_1 + 4;
  piVar6 = (int *)(iVar2 + 0x10);
  for (uVar4 = uVar3 >> 2; uVar4 != 0; uVar4 = uVar4 - 1) {
    *piVar6 = *piVar5;
    piVar5 = piVar5 + 1;
    piVar6 = piVar6 + 1;
  }
  for (uVar4 = uVar3 & 3; uVar4 != 0; uVar4 = uVar4 - 1) {
    *(char *)piVar6 = (char)*piVar5;
    piVar5 = (int *)((int)piVar5 + 1);
    piVar6 = (int *)((int)piVar6 + 1);
  }
  return CONCAT44(uVar3,iVar2);
}

