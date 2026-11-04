// 1008acd3 size=568 FUN_1008acd3

undefined4 FUN_1008acd3(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int in_ECX;
  uint uVar4;
  uint local_c;
  uint local_8;
  
  FUN_1008a979();
  uVar4 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      iVar1 = *(int *)(*(int *)(in_ECX + 0x18) + uVar4 * 4);
      uVar4 = uVar4 + 1;
      *(undefined4 *)(iVar1 + 0x18) = 0;
      *(undefined4 *)(iVar1 + 0x20) = 0;
      *(undefined4 *)(iVar1 + 0x14) = 0;
      *(undefined4 *)(iVar1 + 0x1c) = 0;
    } while (uVar4 < *(uint *)(in_ECX + 0xc));
  }
  local_8 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      iVar1 = *(int *)(*(int *)(in_ECX + 0x18) + local_8 * 4);
      if ((*(ushort *)(iVar1 + 2) & 0xfff0) != 0) {
        uVar4 = 0;
        if (*(int *)(iVar1 + 0xc) != 0) {
          do {
            FUN_1008ac46(*(undefined4 *)(*(int *)(iVar1 + 0x10) + uVar4 * 4),local_8,0);
            uVar4 = uVar4 + 1;
          } while (uVar4 < *(uint *)(iVar1 + 0xc));
        }
        uVar4 = 0;
        if (*(int *)(iVar1 + 4) != 0) {
          do {
            iVar3 = *(int *)(*(int *)(iVar1 + 8) + uVar4 * 4);
            if ((iVar3 != -1) &&
               (iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4) + 0x38), iVar2 != -1)
               ) {
              iVar3 = iVar2;
            }
            FUN_1008ac46(iVar3,local_8,1);
            uVar4 = uVar4 + 1;
          } while (uVar4 < *(uint *)(iVar1 + 4));
        }
      }
      local_8 = local_8 + 1;
    } while (local_8 < *(uint *)(in_ECX + 0xc));
  }
  uVar4 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      iVar1 = *(int *)(*(int *)(in_ECX + 0x18) + uVar4 * 4);
      if (*(int *)(iVar1 + 0x14) != 0) {
        iVar3 = FUN_100857f7(*(int *)(iVar1 + 0x14));
        *(int *)(iVar1 + 0x18) = iVar3;
        if (iVar3 == 0) {
          return 0x8007000e;
        }
      }
      if (*(int *)(iVar1 + 0x1c) != 0) {
        iVar3 = FUN_100857f7(*(int *)(iVar1 + 0x1c));
        *(int *)(iVar1 + 0x20) = iVar3;
        if (iVar3 == 0) {
          return 0x8007000e;
        }
      }
      uVar4 = uVar4 + 1;
      *(undefined4 *)(iVar1 + 0x14) = 0;
      *(undefined4 *)(iVar1 + 0x1c) = 0;
    } while (uVar4 < *(uint *)(in_ECX + 0xc));
  }
  local_8 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      iVar1 = *(int *)(*(int *)(in_ECX + 0x18) + local_8 * 4);
      if ((*(ushort *)(iVar1 + 2) & 0xfff0) != 0) {
        uVar4 = 0;
        if (*(int *)(iVar1 + 0xc) != 0) {
          do {
            FUN_1008ac46(*(undefined4 *)(*(int *)(iVar1 + 0x10) + uVar4 * 4),local_8,0);
            uVar4 = uVar4 + 1;
          } while (uVar4 < *(uint *)(iVar1 + 0xc));
        }
        uVar4 = 0;
        if (*(int *)(iVar1 + 4) != 0) {
          do {
            iVar3 = *(int *)(*(int *)(iVar1 + 8) + uVar4 * 4);
            if ((iVar3 != -1) &&
               (iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4) + 0x38), iVar2 != -1)
               ) {
              iVar3 = iVar2;
            }
            FUN_1008ac46(iVar3,local_8,1);
            uVar4 = uVar4 + 1;
          } while (uVar4 < *(uint *)(iVar1 + 4));
        }
      }
      local_8 = local_8 + 1;
    } while (local_8 < *(uint *)(in_ECX + 0xc));
  }
  local_c = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      iVar1 = *(int *)(*(int *)(in_ECX + 0x18) + local_c * 4);
      if (*(int *)(iVar1 + 0x14) != 0) {
        FUN_10086920(FUN_100865c6,*(undefined4 *)(iVar1 + 0x18),*(int *)(iVar1 + 0x14),0);
        uVar4 = 1;
        local_8 = 1;
        if (1 < *(uint *)(iVar1 + 0x14)) {
          do {
            iVar3 = *(int *)(iVar1 + 0x18);
            iVar2 = *(int *)(iVar3 + uVar4 * 4);
            if (iVar2 != *(int *)(iVar3 + -4 + uVar4 * 4)) {
              *(int *)(iVar3 + local_8 * 4) = iVar2;
              local_8 = local_8 + 1;
            }
            uVar4 = uVar4 + 1;
          } while (uVar4 < *(uint *)(iVar1 + 0x14));
        }
        *(uint *)(iVar1 + 0x14) = local_8;
      }
      uVar4 = 1;
      if (*(int *)(iVar1 + 0x1c) != 0) {
        FUN_10086920(FUN_100865c6,*(undefined4 *)(iVar1 + 0x20),*(int *)(iVar1 + 0x1c),0);
        local_8 = 1;
        if (1 < *(uint *)(iVar1 + 0x1c)) {
          do {
            iVar3 = *(int *)(iVar1 + 0x20);
            iVar2 = *(int *)(iVar3 + uVar4 * 4);
            if (iVar2 != *(int *)(iVar3 + -4 + uVar4 * 4)) {
              *(int *)(iVar3 + local_8 * 4) = iVar2;
              local_8 = local_8 + 1;
            }
            uVar4 = uVar4 + 1;
          } while (uVar4 < *(uint *)(iVar1 + 0x1c));
        }
        *(uint *)(iVar1 + 0x1c) = local_8;
      }
      local_c = local_c + 1;
    } while (local_c < *(uint *)(in_ECX + 0xc));
  }
  return 0;
}


