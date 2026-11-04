// 1008ba48 size=406 FUN_1008ba48

int FUN_1008ba48(void)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  undefined4 uVar5;
  int in_ECX;
  int *piVar6;
  int local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  iVar2 = *(int *)(in_ECX + 8);
  local_8 = 0;
  if (iVar2 != 0) {
    piVar6 = *(int **)(in_ECX + 0x14);
    do {
      uVar3 = *(uint *)(*piVar6 + 0xc);
      if ((local_8 < uVar3) && (uVar3 != 0xffffffff)) {
        local_8 = uVar3;
      }
      piVar6 = piVar6 + 1;
      iVar2 = iVar2 + -1;
    } while (iVar2 != 0);
  }
  local_8 = local_8 + 1;
  local_10 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      iVar2 = *(int *)(*(int *)(in_ECX + 0x18) + local_10 * 4);
      uVar3 = *(uint *)(iVar2 + 0xc);
      if (uVar3 != 0) {
        piVar6 = *(int **)(iVar2 + 0x10);
        local_14 = uVar3;
        do {
          iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar6 * 4);
          if ((*(int *)(iVar4 + 0x44) == -1) &&
             ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar4 + 4) * 4) + 4) & 0x20) !=
              0)) {
            uVar3 = uVar3 - 1;
          }
          piVar6 = piVar6 + 1;
          local_14 = local_14 - 1;
        } while (local_14 != 0);
      }
      if (uVar3 != *(uint *)(iVar2 + 0xc)) {
        local_14 = 0;
        if (uVar3 != 0) {
          iVar4 = FUN_10086199(uVar3 & 0xfffff | 0x10000000,uVar3,uVar3);
          if (iVar4 == -1) {
            return -0x7ff8fff2;
          }
          local_14 = *(int *)(*(int *)(in_ECX + 0x18) + iVar4 * 4);
          FUN_100853b0();
        }
        local_c = 0;
        if (*(int *)(iVar2 + 0xc) != 0) {
          local_18 = 0;
          do {
            iVar4 = *(int *)(*(int *)(in_ECX + 0x14) +
                            *(int *)(*(int *)(iVar2 + 0x10) + local_c * 4) * 4);
            iVar1 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar4 + 4) * 4);
            uVar5 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),local_8,
                                 *(undefined4 *)(iVar4 + 0x10),0);
            if ((*(int *)(iVar4 + 0x44) != -1) || ((*(byte *)(iVar1 + 4) & 0x20) == 0)) {
              *(undefined4 *)(local_18 + *(int *)(local_14 + 0x10)) =
                   *(undefined4 *)(*(int *)(iVar2 + 0x10) + local_c * 4);
              *(undefined4 *)(local_18 + *(int *)(local_14 + 8)) = uVar5;
              local_18 = local_18 + 4;
            }
            *(undefined4 *)(*(int *)(iVar2 + 0x10) + local_c * 4) = uVar5;
            local_c = local_c + 1;
          } while (local_c < *(uint *)(iVar2 + 0xc));
        }
        local_8 = local_8 + 1;
      }
      local_10 = local_10 + 1;
    } while (local_10 < *(uint *)(in_ECX + 0xc));
  }
  iVar2 = FUN_1008a979();
  if (-1 < iVar2) {
    uVar3 = 0;
    if (*(int *)(in_ECX + 8) != 0) {
      do {
        iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + uVar3 * 4);
        if ((*(int *)(iVar2 + 0x48) == -1) && (*(int *)(iVar2 + 0x54) == -1)) {
          *(undefined4 *)(iVar2 + 4) = *(undefined4 *)(in_ECX + 0x74);
        }
        uVar3 = uVar3 + 1;
      } while (uVar3 < *(uint *)(in_ECX + 8));
    }
    iVar2 = 0;
  }
  return iVar2;
}


