// 10086d6c size=273 FUN_10086d6c

undefined4 FUN_10086d6c(int *param_1,uint param_2)

{
  uint *puVar1;
  uint *puVar2;
  uint uVar3;
  int *piVar4;
  uint uVar5;
  int in_ECX;
  int *piVar6;
  int iVar7;
  char *pcVar8;
  char *pcVar9;
  bool bVar10;
  uint local_8;
  
  iVar7 = (int)param_1;
  puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) +
                     *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + (int)param_1 * 4) + 0x48) * 4);
  puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) +
                     *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + param_2 * 4) + 0x48) * 4);
  uVar5 = *puVar1;
  if (((uVar5 ^ *puVar2) & 0xfff00000) == 0) {
    local_8 = 0;
    if (puVar1[3] != 0) {
      param_1 = (int *)puVar1[4];
      do {
        if (*param_1 == iVar7) break;
        local_8 = local_8 + 1;
        param_1 = param_1 + 1;
      } while (local_8 < puVar1[3]);
    }
    uVar3 = puVar2[3];
    param_1 = (int *)0x0;
    if (uVar3 != 0) {
      piVar4 = (int *)puVar2[4];
      do {
        if (*piVar4 == param_2) break;
        param_1 = (int *)((int)param_1 + 1);
        piVar4 = piVar4 + 1;
      } while (param_1 < uVar3);
    }
    if ((0xfffffff < (uVar5 & 0xf0000000)) && ((uVar5 & 0xf0000000) < 0x40000001)) {
      uVar5 = puVar1[1] / (uVar5 & 0xfffff);
      param_2 = 0;
      if (uVar5 != 0) {
        piVar4 = (int *)(puVar1[2] + local_8 * 4);
        piVar6 = (int *)(puVar2[2] + (int)param_1 * 4);
        do {
          if (*piVar4 != *piVar6) {
            return 0;
          }
          param_2 = param_2 + 1;
          piVar6 = piVar6 + uVar3;
          piVar4 = piVar4 + puVar1[3];
        } while (param_2 < uVar5);
      }
      return 1;
    }
    if (((int *)local_8 == param_1) && (((uVar5 ^ *puVar2) & 0xfffff) == 0)) {
      iVar7 = puVar1[1] << 2;
      bVar10 = true;
      pcVar8 = (char *)puVar1[2];
      pcVar9 = (char *)puVar2[2];
      do {
        if (iVar7 == 0) break;
        iVar7 = iVar7 + -1;
        bVar10 = *pcVar8 == *pcVar9;
        pcVar8 = pcVar8 + 1;
        pcVar9 = pcVar9 + 1;
      } while (bVar10);
      if (bVar10) {
        return 1;
      }
    }
  }
  return 0;
}


