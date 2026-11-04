// 100c7166 size=354 FUN_100c7166

undefined4 FUN_100c7166(void)

{
  uint *puVar1;
  int iVar2;
  uint uVar3;
  int *piVar4;
  undefined4 uVar5;
  int in_ECX;
  int *piVar6;
  int *piVar7;
  uint uVar8;
  uint local_c;
  
  *(undefined4 *)(in_ECX + 0x15c) = 0;
  puVar1 = *(uint **)(in_ECX + 0x100);
  uVar3 = *puVar1;
  if ((uVar3 & 0xfff00000) == 0x20500000) {
    uVar3 = uVar3 & 0xfffff;
    piVar6 = (int *)puVar1[2];
    piVar7 = piVar6 + uVar3;
    iVar2 = *(int *)(in_ECX + 0x14);
    piVar4 = piVar7;
    if (((*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) +
                            *(int *)(*(int *)(iVar2 + *piVar6 * 4) + 4) * 4) + 4) & 0x100) == 0) &&
       (piVar4 = piVar6, piVar6 = piVar7,
       (*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(*(int *)(iVar2 + *piVar7 * 4) + 4) * 4
                          ) + 4) & 0x100) == 0)) {
      return 1;
    }
    if (uVar3 != 0) {
      uVar8 = 0;
      piVar7 = piVar6;
      do {
        if (*(double *)
             (*(int *)(iVar2 + *(int *)(((int)piVar4 - (int)piVar6) + (int)piVar7) * 4) + 0x20) !=
            2.0) {
          return 1;
        }
        if (((*(uint *)(*(int *)(iVar2 + *piVar7 * 4) + 0x3c) & 0x1f0000) != 0x20000) &&
           ((*(byte *)(in_ECX + 0x6e) & 8) != 0)) {
          return 1;
        }
        uVar8 = uVar8 + 1;
        piVar7 = piVar7 + 1;
      } while (uVar8 < uVar3);
    }
  }
  else {
    if ((uVar3 & 0xfff00000) != 0x20400000) {
      return 1;
    }
    piVar6 = (int *)puVar1[2];
    uVar3 = uVar3 & 0xfffff;
    local_c = 0;
    piVar7 = piVar6;
    if (uVar3 != 0) {
      do {
        if (*piVar7 != piVar7[uVar3]) {
          return 1;
        }
        if (((*(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar7 * 4) + 0x3c) & 0x1f0000) !=
             0x20000) && ((*(byte *)(in_ECX + 0x6e) & 8) != 0)) {
          return 1;
        }
        local_c = local_c + 1;
        piVar7 = piVar7 + 1;
      } while (local_c < uVar3);
    }
  }
  uVar5 = FUN_100c5bcc(0x40000,0x20000,piVar6,0x40000,0,0);
  return uVar5;
}


