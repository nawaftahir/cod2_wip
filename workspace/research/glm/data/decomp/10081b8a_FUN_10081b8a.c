// 10081b8a size=271 FUN_10081b8a

undefined4 FUN_10081b8a(char *param_1)

{
  char cVar1;
  int iVar2;
  char *pcVar3;
  int iVar4;
  uint uVar5;
  undefined4 *puVar6;
  int *piVar7;
  int in_ECX;
  uint uVar8;
  undefined4 *puVar9;
  undefined4 *puVar10;
  undefined4 *puVar11;
  uint local_8;
  
  pcVar3 = param_1;
  do {
    cVar1 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  iVar4 = (int)pcVar3 - (int)(param_1 + 1);
  if ((*(int *)(in_ECX + 0x14) - iVar4) - 1U < *(int *)(in_ECX + 0x10) + 4U) {
    iVar2 = *(int *)(in_ECX + 8);
    uVar5 = __ftol();
    local_8 = iVar2 + iVar4;
    if (local_8 <= uVar5) {
      local_8 = uVar5;
    }
    puVar6 = operator_new(local_8 + 3 & 0xfffffffc);
    if (puVar6 == (undefined4 *)0x0) {
      return 0x8007000e;
    }
    uVar8 = (*(int *)(in_ECX + 0xc) - (int)*(undefined4 **)(in_ECX + 0x14)) + *(int *)(in_ECX + 8);
    puVar9 = (undefined4 *)((int)puVar6 + (local_8 - uVar8));
    puVar10 = *(undefined4 **)(in_ECX + 0x14);
    puVar11 = puVar9;
    for (uVar5 = uVar8 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
      *puVar11 = *puVar10;
      puVar10 = puVar10 + 1;
      puVar11 = puVar11 + 1;
    }
    for (uVar8 = uVar8 & 3; uVar8 != 0; uVar8 = uVar8 - 1) {
      *(undefined1 *)puVar11 = *(undefined1 *)puVar10;
      puVar10 = (undefined4 *)((int)puVar10 + 1);
      puVar11 = (undefined4 *)((int)puVar11 + 1);
    }
    iVar2 = *(int *)(in_ECX + 0x14);
    puVar10 = puVar6;
    for (piVar7 = *(int **)(in_ECX + 0xc); piVar7 < *(int **)(in_ECX + 0x10); piVar7 = piVar7 + 1) {
      *puVar10 = (undefined1 *)((int)puVar9 + (*piVar7 - iVar2));
      puVar10 = puVar10 + 1;
    }
    _free(*(void **)(in_ECX + 0xc));
    *(undefined4 **)(in_ECX + 0xc) = puVar6;
    *(uint *)(in_ECX + 8) = local_8;
    *(undefined4 **)(in_ECX + 0x10) = puVar10;
    *(undefined4 **)(in_ECX + 0x14) = puVar9;
  }
  *(int *)(in_ECX + 0x14) = *(int *)(in_ECX + 0x14) + (-1 - iVar4);
  pcVar3 = *(char **)(in_ECX + 0x14);
  do {
    cVar1 = *param_1;
    param_1 = param_1 + 1;
    *pcVar3 = cVar1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  **(undefined4 **)(in_ECX + 0x10) = *(undefined4 *)(in_ECX + 0x14);
  *(int *)(in_ECX + 0x10) = *(int *)(in_ECX + 0x10) + 4;
  return 0;
}


