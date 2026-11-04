// 1008a979 size=717 FUN_1008a979

undefined4 FUN_1008a979(void)

{
  uint *puVar1;
  undefined4 uVar2;
  uint uVar3;
  int iVar4;
  int in_ECX;
  uint uVar5;
  uint uVar6;
  int *piVar7;
  int iVar8;
  undefined4 *puVar9;
  undefined4 *local_10;
  uint local_c;
  uint local_8;
  
  uVar5 = 0;
  if (*(int *)(in_ECX + 4) != 0) {
    do {
      iVar8 = *(int *)(*(int *)(in_ECX + 0x10) + uVar5 * 4);
      *(undefined4 *)(iVar8 + 0x28) = 0xffffffff;
      uVar5 = uVar5 + 1;
      *(undefined4 *)(iVar8 + 0x2c) = 0;
      *(undefined4 *)(iVar8 + 0x30) = 0;
      *(undefined4 *)(iVar8 + 0x20) = 0;
    } while (uVar5 < *(uint *)(in_ECX + 4));
  }
  uVar5 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + uVar5 * 4);
      *(uint *)(iVar8 + 0x34) = uVar5;
      uVar5 = uVar5 + 1;
      *(undefined4 *)(iVar8 + 0x54) = 0xffffffff;
      *(undefined4 *)(iVar8 + 0x58) = 0;
      *(undefined4 *)(iVar8 + 0x5c) = 0;
      *(undefined4 *)(iVar8 + 0x48) = 0xffffffff;
      *(undefined4 *)(iVar8 + 0x4c) = 0xffffffff;
      *(undefined4 *)(iVar8 + 0x50) = 0xffffffff;
    } while (uVar5 < *(uint *)(in_ECX + 8));
  }
  local_10 = (undefined4 *)0x0;
  if (*(int *)(in_ECX + 0xdc) != 0) {
    uVar5 = 0;
    if (*(int *)(in_ECX + 4) != 0) {
      do {
        iVar8 = uVar5 * 4;
        uVar5 = uVar5 + 1;
        *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x10) + iVar8) + 0x10) = 0;
      } while (uVar5 < *(uint *)(in_ECX + 4));
    }
    uVar5 = 0;
    if (*(int *)(in_ECX + 8) != 0) {
      do {
        iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + uVar5 * 4);
        iVar4 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar8 + 4) * 4);
        if ((((*(uint *)(iVar4 + 4) & 0x40) == 0) && ((*(uint *)(iVar4 + 4) & 2) != 0)) &&
           (uVar6 = *(int *)(iVar8 + 0xc) + 1, *(uint *)(iVar4 + 0x10) < uVar6)) {
          *(uint *)(iVar4 + 0x10) = uVar6;
        }
        uVar5 = uVar5 + 1;
      } while (uVar5 < *(uint *)(in_ECX + 8));
    }
    iVar8 = *(int *)(in_ECX + 4);
    uVar5 = 0;
    if (iVar8 != 0) {
      piVar7 = *(int **)(in_ECX + 0x10);
      do {
        uVar5 = uVar5 + *(int *)(*piVar7 + 0x10);
        piVar7 = piVar7 + 1;
        iVar8 = iVar8 + -1;
      } while (iVar8 != 0);
    }
    local_10 = operator_new(uVar5 << 4);
    if (local_10 == (undefined4 *)0x0) {
      return 0x8007000e;
    }
    puVar9 = local_10;
    for (iVar8 = (uVar5 & 0xfffffff) << 2; iVar8 != 0; iVar8 = iVar8 + -1) {
      *puVar9 = 0xffffffff;
      puVar9 = puVar9 + 1;
    }
    for (iVar8 = 0; iVar8 != 0; iVar8 = iVar8 + -1) {
      *(undefined1 *)puVar9 = 0xff;
      puVar9 = (undefined4 *)((int)puVar9 + 1);
    }
    iVar8 = 0;
    uVar5 = 0;
    if (*(int *)(in_ECX + 4) != 0) {
      iVar4 = *(int *)(in_ECX + 0x10);
      do {
        *(uint *)(*(int *)(iVar4 + uVar5 * 4) + 0x20) =
             -(uint)(*(int *)(*(int *)(*(int *)(in_ECX + 0x10) + uVar5 * 4) + 0x10) != 0) &
             (uint)(local_10 + iVar8 * 4);
        iVar4 = *(int *)(in_ECX + 0x10);
        iVar8 = iVar8 + *(int *)(*(int *)(iVar4 + uVar5 * 4) + 0x10);
        uVar5 = uVar5 + 1;
      } while (uVar5 < *(uint *)(in_ECX + 4));
    }
  }
  local_8 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      uVar5 = 0;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_8 * 4);
      if ((puVar1 != (uint *)0x0) && ((*puVar1 & 0xfff00000) != 0)) {
        if (puVar1[1] != 0) {
          do {
            FUN_1008a7ee(*(undefined4 *)(puVar1[2] + uVar5 * 4),local_8);
            uVar5 = uVar5 + 1;
          } while (uVar5 < puVar1[1]);
        }
        uVar5 = 0;
        if (puVar1[3] != 0) {
          do {
            FUN_1008a84c(*(undefined4 *)(puVar1[4] + uVar5 * 4),local_8);
            uVar5 = uVar5 + 1;
          } while (uVar5 < puVar1[3]);
        }
        if ((((*puVar1 & 0xfff00000) == 0x10000000) && ((*(byte *)(in_ECX + 0xcc) & 4) == 0)) &&
           (local_c = 0, puVar1[3] != 0)) {
          do {
            iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(local_c * 4 + puVar1[4]) * 4);
            iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(local_c * 4 + puVar1[2]) * 4);
            uVar5 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar8 + 4) * 4) + 4);
            if ((((uVar5 & 0x1020) == 0) && ((uVar5 & 1) != 0)) && (*(int *)(iVar4 + 0x3c) == 0)) {
              uVar2 = *(undefined4 *)(iVar8 + 0x34);
              *(undefined4 *)(iVar8 + 0x34) = *(undefined4 *)(iVar4 + 0x34);
              *(undefined4 *)(iVar4 + 0x34) = uVar2;
            }
            local_c = local_c + 1;
          } while (local_c < puVar1[3]);
        }
      }
      local_8 = local_8 + 1;
    } while (local_8 < *(uint *)(in_ECX + 0xc));
  }
  uVar5 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + uVar5 * 4);
      iVar4 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar8 + 4) * 4);
      uVar6 = *(uint *)(iVar4 + 0x28);
      if (uVar6 < *(uint *)(iVar8 + 0x54)) {
        *(uint *)(iVar8 + 0x54) = uVar6;
      }
      uVar6 = *(uint *)(iVar4 + 0x2c);
      if (*(uint *)(iVar8 + 0x58) < uVar6) {
        *(uint *)(iVar8 + 0x58) = uVar6;
      }
      uVar5 = uVar5 + 1;
    } while (uVar5 < *(uint *)(in_ECX + 8));
  }
  if ((*(int *)(in_ECX + 0xdc) != 0) && (uVar5 = 0, *(int *)(in_ECX + 8) != 0)) {
    do {
      iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + uVar5 * 4);
      if (*(int *)(iVar8 + 0x4c) == -1) {
        *(undefined4 *)(iVar8 + 0x4c) = 0;
      }
      else {
        iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar8 + 0x4c) * 4);
        uVar6 = *(uint *)(iVar4 + 0x58);
        *(uint *)(iVar8 + 0x4c) = uVar6;
        uVar3 = *(uint *)(iVar4 + 0x48);
        if (uVar6 <= uVar3) {
          *(uint *)(iVar8 + 0x4c) = uVar3 + 1;
        }
      }
      if (*(int *)(iVar8 + 0x50) == -1) {
        *(undefined4 *)(iVar8 + 0x50) = 0xffffffff;
      }
      else {
        iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar8 + 0x50) * 4);
        uVar6 = *(uint *)(iVar4 + 0x54);
        *(uint *)(iVar8 + 0x50) = uVar6;
        uVar3 = *(uint *)(iVar4 + 0x48);
        if (uVar3 < uVar6) {
          *(uint *)(iVar8 + 0x50) = uVar3;
        }
      }
      uVar5 = uVar5 + 1;
    } while (uVar5 < *(uint *)(in_ECX + 8));
  }
  if (*(int *)(in_ECX + 0xd8) != 0) {
    FUN_1008a8ae();
  }
  _free(local_10);
  return 0;
}


