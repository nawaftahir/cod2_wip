// 100c1571 size=279 FUN_100c1571

undefined4 FUN_100c1571(int param_1,int *param_2,int *param_3)

{
  int iVar1;
  uint *puVar2;
  int in_ECX;
  uint uVar3;
  int *piVar4;
  int *piVar5;
  int *piVar6;
  uint local_8;
  
  iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4);
  if ((*(int *)(iVar1 + 0x58) == *(int *)(iVar1 + 0x54)) &&
     (uVar3 = 0xffffffff, *(int *)(iVar1 + 0x48) != -1)) {
    puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar1 + 0x48) * 4);
    if ((*puVar2 & 0xfff00000) == 0x20400000) {
      local_8 = 0;
      if (puVar2[3] != 0) {
        piVar5 = (int *)puVar2[4];
        do {
          if (*piVar5 == param_1) {
            uVar3 = local_8;
          }
          local_8 = local_8 + 1;
          piVar5 = piVar5 + 1;
        } while (local_8 < puVar2[3]);
        if (uVar3 != 0xffffffff) {
          piVar5 = (int *)(puVar2[2] + uVar3 * 4);
          piVar6 = (int *)(puVar2[2] + (uVar3 + (*puVar2 & 0xfffff)) * 4);
          piVar4 = piVar5;
          if (((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                    *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar6 * 4) + 4) *
                                    4) + 5) & 1) != 0) ||
               (piVar4 = piVar6, piVar6 = piVar5,
               (*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                  *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar5 * 4) + 4) * 4)
                         + 5) & 1) != 0)) &&
              (*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar6 * 4) + 0x20) == 1.0)) &&
             ((*(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar4 * 4) + 0x3c) & 0x1f0000) ==
              0x80000)) {
            *param_3 = *piVar4;
            *param_2 = (int)puVar2;
            return 0;
          }
        }
      }
    }
  }
  return 1;
}


