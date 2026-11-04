// 100baf09 size=416 FUN_100baf09

int FUN_100baf09(void)

{
  undefined4 *puVar1;
  int *piVar2;
  int *piVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  int in_ECX;
  int iVar7;
  int iVar8;
  uint local_c;
  uint local_8;
  
  piVar2 = *(int **)(*(int *)(in_ECX + 0x100) + 0x10);
  piVar3 = *(int **)(in_ECX + 0x14);
  if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(piVar3[*piVar2] + 4) * 4) + 4) & 1)
        == 0) || (*(int *)(piVar3[*piVar2] + 0x3c) != 0)) ||
     (*(int *)(piVar3[piVar2[1]] + 0x3c) != 0)) {
    local_c = 0;
    if (*(int *)(in_ECX + 8) != 0) {
      iVar7 = *(int *)(in_ECX + 8);
      do {
        if ((*(int *)(in_ECX + 0x88) == *(int *)(*piVar3 + 4)) &&
           (uVar6 = *(uint *)(*piVar3 + 0xc), local_c <= uVar6)) {
          local_c = uVar6 + 1;
        }
        piVar3 = piVar3 + 1;
        iVar7 = iVar7 + -1;
      } while (iVar7 != 0);
    }
    iVar7 = FUN_10086199(0x10000004,4,4);
    if (iVar7 == -1) {
      return -0x7ff8fff2;
    }
    iVar7 = *(int *)(*(int *)(in_ECX + 0x18) + iVar7 * 4);
    iVar4 = FUN_100853b0();
    if (iVar4 < 0) {
      return iVar4;
    }
    local_8 = 0;
    do {
      iVar4 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),local_c,local_8,0);
      if (iVar4 == -1) {
        return -0x7ff8fff2;
      }
      iVar8 = local_8 * 4;
      iVar5 = FUN_10085d21();
      if (iVar5 < 0) {
        return iVar5;
      }
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4) + 0x18) =
           *(undefined4 *)
            (*(int *)(*(int *)(in_ECX + 0x14) +
                     *(int *)(iVar8 + *(int *)(*(int *)(in_ECX + 0x100) + 0x10)) * 4) + 0x18);
      local_8 = local_8 + 1;
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4) + 0x14) =
           *(undefined4 *)
            (*(int *)(*(int *)(in_ECX + 0x14) +
                     *(int *)(iVar8 + *(int *)(*(int *)(in_ECX + 0x100) + 0x10)) * 4) + 0x14);
      *(undefined4 *)(iVar8 + *(int *)(iVar7 + 0x10)) =
           *(undefined4 *)(iVar8 + *(int *)(*(int *)(in_ECX + 0x100) + 0x10));
      *(int *)(iVar8 + *(int *)(*(int *)(in_ECX + 0x100) + 0x10)) = iVar4;
      *(int *)(iVar8 + *(int *)(iVar7 + 8)) = iVar4;
    } while (local_8 < 4);
    uVar6 = *(int *)(in_ECX + 0xc) - 1;
    while (uVar6 = uVar6 - 1, *(uint *)(in_ECX + 0xfc) < uVar6) {
      puVar1 = (undefined4 *)(*(int *)(in_ECX + 0x18) + uVar6 * 4);
      puVar1[1] = *puVar1;
    }
    *(int *)(*(int *)(in_ECX + 0x18) + 4 + *(uint *)(in_ECX + 0xfc) * 4) = iVar7;
  }
  *(undefined4 *)(in_ECX + 0x18c) = 1;
  return 0;
}


