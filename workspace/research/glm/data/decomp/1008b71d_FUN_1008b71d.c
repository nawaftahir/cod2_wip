// 1008b71d size=811 FUN_1008b71d

undefined4 FUN_1008b71d(void)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  bool bVar4;
  int iVar5;
  int in_ECX;
  uint uVar6;
  int iVar7;
  uint local_8;
  
  uVar6 = 0;
  bVar4 = false;
  if (*(int *)(in_ECX + 4) != 0) {
    do {
      iVar2 = *(int *)(*(int *)(in_ECX + 0x10) + uVar6 * 4);
      uVar6 = uVar6 + 1;
      *(undefined4 *)(iVar2 + 0x28) = 0xffffffff;
      *(undefined4 *)(iVar2 + 0x24) = 0xffffffff;
    } while (uVar6 < *(uint *)(in_ECX + 4));
  }
  uVar6 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + uVar6 * 4);
      uVar6 = uVar6 + 1;
      *(undefined4 *)(iVar2 + 0x54) = 0xffffffff;
      *(undefined4 *)(iVar2 + 0x48) = 0xffffffff;
    } while (uVar6 < *(uint *)(in_ECX + 8));
  }
  uVar6 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      iVar2 = *(int *)(*(int *)(in_ECX + 0x18) + uVar6 * 4);
      if ((*(ushort *)(iVar2 + 2) & 0xfff0) != 0) {
        local_8 = 0;
        if (*(int *)(iVar2 + 4) != 0) {
          do {
            iVar5 = *(int *)(*(int *)(in_ECX + 0x14) +
                            *(int *)(*(int *)(iVar2 + 8) + local_8 * 4) * 4);
            if (uVar6 < *(uint *)(iVar5 + 0x54)) {
              *(uint *)(iVar5 + 0x54) = uVar6;
            }
            piVar1 = (int *)(iVar5 + 8);
            iVar7 = *piVar1;
            iVar3 = iVar5;
            while (iVar7 != -1) {
              iVar7 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar3 + 4) * 4);
              if (uVar6 < *(uint *)(iVar7 + 0x28)) {
                *(uint *)(iVar7 + 0x28) = uVar6;
              }
              iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar1 * 4);
              if (uVar6 < *(uint *)(iVar3 + 0x54)) {
                *(uint *)(iVar3 + 0x54) = uVar6;
              }
              piVar1 = (int *)(iVar3 + 8);
              iVar7 = *piVar1;
            }
            while (*(int *)(iVar5 + 0x14) != -1) {
              iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar5 + 0x14) * 4);
              if (uVar6 < *(uint *)(iVar5 + 0x54)) {
                *(uint *)(iVar5 + 0x54) = uVar6;
              }
            }
            local_8 = local_8 + 1;
          } while (local_8 < *(uint *)(iVar2 + 4));
        }
        local_8 = 0;
        if (*(int *)(iVar2 + 0xc) != 0) {
          do {
            iVar5 = *(int *)(*(int *)(in_ECX + 0x14) +
                            *(int *)(*(int *)(iVar2 + 0x10) + local_8 * 4) * 4);
            if (uVar6 < *(uint *)(iVar5 + 0x48)) {
              *(uint *)(iVar5 + 0x48) = uVar6;
            }
            iVar7 = iVar5;
            if (*(int *)(iVar5 + 8) != -1) {
              iVar7 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar5 + 4) * 4);
              if (uVar6 < *(uint *)(iVar7 + 0x24)) {
                *(uint *)(iVar7 + 0x24) = uVar6;
              }
              iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar5 + 8) * 4);
              if (uVar6 < *(uint *)(iVar7 + 0x54)) {
                *(uint *)(iVar7 + 0x54) = uVar6;
              }
            }
            iVar3 = *(int *)(iVar7 + 8);
            while (iVar3 != -1) {
              iVar3 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar7 + 4) * 4);
              if (uVar6 < *(uint *)(iVar3 + 0x28)) {
                *(uint *)(iVar3 + 0x28) = uVar6;
              }
              iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar7 + 8) * 4);
              if (uVar6 < *(uint *)(iVar7 + 0x54)) {
                *(uint *)(iVar7 + 0x54) = uVar6;
              }
              iVar3 = *(int *)(iVar7 + 8);
            }
            while (*(int *)(iVar5 + 0x14) != -1) {
              iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar5 + 0x14) * 4);
              if (uVar6 < *(uint *)(iVar5 + 0x54)) {
                *(uint *)(iVar5 + 0x54) = uVar6;
              }
            }
            local_8 = local_8 + 1;
          } while (local_8 < *(uint *)(iVar2 + 0xc));
        }
      }
      uVar6 = uVar6 + 1;
    } while (uVar6 < *(uint *)(in_ECX + 0xc));
  }
  FUN_1008a8ae();
  local_8 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + local_8 * 4);
      iVar5 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar2 + 4) * 4);
      if (*(uint *)(iVar5 + 0x28) < *(uint *)(iVar2 + 0x54)) {
        *(uint *)(iVar2 + 0x54) = *(uint *)(iVar5 + 0x28);
      }
      if (*(uint *)(iVar5 + 0x24) < *(uint *)(iVar2 + 0x48)) {
        *(uint *)(iVar2 + 0x48) = *(uint *)(iVar5 + 0x24);
      }
      uVar6 = *(uint *)(iVar5 + 4);
      if ((((uVar6 & 0x10) == 0) && (*(uint *)(iVar2 + 0x54) != 0xffffffff)) &&
         (*(uint *)(iVar2 + 0x54) <= *(uint *)(iVar2 + 0x48))) {
        iVar2 = *(int *)(iVar2 + 0x60);
        if (((iVar2 == 0) || (*(int *)(iVar2 + 4) != 6)) ||
           ((*(int *)(iVar2 + 0x14) == 0 || (*(int *)(*(int *)(iVar2 + 0x14) + 4) != 3)))) {
LAB_1008b98e:
          FUN_1008b0b5();
        }
        else if (*(int *)(iVar2 + 0x28) == 0) {
          FUN_1008b0b5();
          *(undefined4 *)(iVar2 + 0x28) = 1;
        }
LAB_1008ba1f:
        bVar4 = true;
      }
      else {
        if (((uVar6 & 0x20) != 0) && (*(int *)(iVar2 + 0x48) == -1)) goto LAB_1008ba14;
        if (((uVar6 & 2) == 0) && (*(int *)(iVar2 + 0x48) != -1)) goto LAB_1008b98e;
        if (((uVar6 & 0xd) == 0) && (*(int *)(iVar2 + 0x54) != -1)) {
LAB_1008ba14:
          FUN_1008b0b5();
          goto LAB_1008ba1f;
        }
        if ((*(int *)(in_ECX + 0xd8) != 0) &&
           ((((uVar6 & 0x10120) == 0 && (*(int *)(iVar2 + 0x54) == -1)) &&
            (((uVar6 & 0x10) != 0 ||
             (((*(int *)(iVar2 + 0x48) != -1 && (iVar5 = FUN_1008540c(), iVar5 == 0)) &&
              ((**(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar2 + 0x48) * 4) & 0xfff00000) !=
               0x20900000)))))))) {
          if (*(int *)(iVar2 + 0x48) != -1) goto LAB_1008b98e;
          goto LAB_1008ba14;
        }
      }
      local_8 = local_8 + 1;
    } while (local_8 < *(uint *)(in_ECX + 8));
    if (bVar4) {
      return 0x80004005;
    }
  }
  return 0;
}


