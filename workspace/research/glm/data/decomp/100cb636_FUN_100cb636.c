// 100cb636 size=313 FUN_100cb636

undefined4 FUN_100cb636(void)

{
  uint uVar1;
  int iVar2;
  int iVar3;
  uint *puVar4;
  undefined4 uVar5;
  int iVar6;
  int in_ECX;
  int *piVar7;
  uint local_8;
  
  if (*(int *)(in_ECX + 0x8c) ==
      *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + **(int **)(*(int *)(in_ECX + 0x100) + 0x10) * 4) +
              4)) {
    uVar5 = FUN_100cb270(0x2e,0);
  }
  else {
    if ((*(byte *)(in_ECX + 0x6e) & 0x10) == 0) {
      uVar1 = *(uint *)(*(int *)(in_ECX + 0x100) + 0xc);
      local_8 = 0;
      if (uVar1 != 0) {
        piVar7 = *(int **)(*(int *)(in_ECX + 0x100) + 0x10);
        iVar6 = *(int *)(*(int *)(in_ECX + 0x100) + 8) - (int)piVar7;
        do {
          iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar6 + (int)piVar7) * 4);
          iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar7 * 4);
          if ((((*(int *)(iVar3 + 4) != *(int *)(iVar2 + 4)) ||
               (*(int *)(iVar3 + 8) != *(int *)(iVar2 + 8))) ||
              (*(int *)(iVar3 + 0xc) != *(int *)(iVar2 + 0xc))) ||
             (((*(int *)(iVar3 + 0x10) != *(int *)(iVar2 + 0x10) ||
               (*(int *)(iVar3 + 0x3c) != *(int *)(iVar2 + 0x3c))) ||
              (((*(byte *)(in_ECX + 0xcc) & 4) != 0 && (*(int *)(iVar3 + 0x60) != 0)))))) break;
          local_8 = local_8 + 1;
          piVar7 = piVar7 + 1;
        } while (local_8 < uVar1);
      }
      if (local_8 == uVar1) {
        return 0;
      }
    }
    local_8 = 0;
    if (*(int *)(*(int *)(in_ECX + 0x100) + 0xc) != 0) {
      do {
        puVar4 = *(uint **)(*(int *)(in_ECX + 0x14) +
                           *(int *)(*(int *)(*(int *)(in_ECX + 0x100) + 0x10) + local_8 * 4) * 4);
        if ((*puVar4 & 0xe000000) == 0) {
          *puVar4 = **(uint **)(*(int *)(in_ECX + 0x14) +
                               *(int *)(*(int *)(*(int *)(in_ECX + 0x100) + 8) + local_8 * 4) * 4) &
                    0xe000000 | *puVar4;
        }
        local_8 = local_8 + 1;
      } while (local_8 < *(uint *)(*(int *)(in_ECX + 0x100) + 0xc));
    }
    iVar6 = *(int *)(in_ECX + 0x100);
    uVar5 = FUN_100c9a7f(1,*(undefined4 *)(iVar6 + 0x10),*(undefined4 *)(iVar6 + 0xc),
                         *(undefined4 *)(iVar6 + 8),0,0,*(undefined4 *)(iVar6 + 0xc),0,0,0,0);
  }
  return uVar5;
}


