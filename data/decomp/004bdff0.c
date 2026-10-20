
int * __thiscall FUN_004bdff0(int *param_1,undefined4 *param_2,undefined4 param_3)

{
  int *piVar1;
  char cVar2;
  int iVar3;
  int *piVar4;
  uint uVar5;
  undefined4 *puVar6;
  undefined4 *local_20;
  int local_1c;
  
  iVar3 = param_2[1];
  piVar1 = param_1 + 2;
  puVar6 = (undefined4 *)*param_2;
  piVar4 = piVar1;
  for (uVar5 = iVar3 + 1U >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
    *piVar4 = *puVar6;
    puVar6 = puVar6 + 1;
    piVar4 = piVar4 + 1;
  }
  for (uVar5 = iVar3 + 1U & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
    *(undefined1 *)piVar4 = *(undefined1 *)puVar6;
    puVar6 = (undefined4 *)((int)puVar6 + 1);
    piVar4 = (undefined4 *)((int)piVar4 + 1);
  }
  FUN_004bf160(param_3);
  piVar4 = piVar1;
  do {
    cVar2 = *(char *)piVar4;
    piVar4 = (int *)((int)piVar4 + 1);
  } while (cVar2 != '\0');
  puVar6 = (undefined4 *)(((int)piVar4 - ((int)param_1 + 9)) + (int)piVar1);
  for (uVar5 = local_1c + 1U >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
    *puVar6 = *local_20;
    local_20 = local_20 + 1;
    puVar6 = puVar6 + 1;
  }
  for (uVar5 = local_1c + 1U & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
    *(undefined1 *)puVar6 = *(undefined1 *)local_20;
    local_20 = (undefined4 *)((int)local_20 + 1);
    puVar6 = (undefined4 *)((int)puVar6 + 1);
  }
  piVar4 = piVar1;
  do {
    cVar2 = *(char *)piVar4;
    piVar4 = (int *)((int)piVar4 + 1);
  } while (cVar2 != '\0');
  param_1[1] = (int)piVar4 - ((int)param_1 + 9);
  *param_1 = (int)piVar1;
  return param_1;
}

