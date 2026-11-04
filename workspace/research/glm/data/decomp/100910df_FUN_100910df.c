// 100910df size=828 FUN_100910df

int FUN_100910df(void)

{
  uint *puVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  undefined4 *puVar5;
  int in_ECX;
  uint uVar6;
  undefined4 *puVar7;
  int local_20;
  int local_1c;
  uint local_18;
  void *local_14;
  uint local_10;
  undefined4 *local_c;
  void *local_8;
  
  local_14 = (void *)0x0;
  local_8 = (void *)0x0;
  local_c = (undefined4 *)0x0;
  iVar3 = FUN_10086eae();
  if ((iVar3 < 0) || (iVar3 = FUN_1008acd3(), iVar3 < 0)) goto LAB_100913f9;
  if ((*(uint *)(in_ECX + 0x6c) & 0xc000000) != 0) {
    uVar4 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        iVar3 = uVar4 * 4;
        uVar4 = uVar4 + 1;
        *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x18) + iVar3) + 0x2c) = 0;
      } while (uVar4 < *(uint *)(in_ECX + 0xc));
    }
    iVar3 = *(int *)(in_ECX + 0xc);
    while (iVar3 != 0) {
      iVar3 = iVar3 + -1;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar3 * 4);
      uVar4 = *puVar1 & 0xfff00000;
      if (uVar4 != 0) {
        uVar6 = puVar1[0xb];
        if (((*puVar1 & 0xf0000000) == 0x60000000) || (uVar4 == 0x11000000)) {
          puVar1[0xb] = uVar6 + 1;
          uVar6 = uVar6 + 2;
        }
        uVar4 = 0;
        if (puVar1[5] != 0) {
          do {
            iVar2 = *(int *)(*(int *)(in_ECX + 0x18) + *(int *)(puVar1[6] + uVar4 * 4) * 4);
            if (*(uint *)(iVar2 + 0x2c) < uVar6) {
              *(uint *)(iVar2 + 0x2c) = uVar6;
            }
            uVar4 = uVar4 + 1;
          } while (uVar4 < puVar1[5]);
        }
      }
    }
  }
  local_1c = 0;
  local_10 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_10 * 4);
      local_18 = *puVar1 & 0xfff00000;
      if (local_18 != 0) {
        uVar4 = *(uint *)puVar1[4];
        local_20 = *(int *)(*(int *)(in_ECX + 0x14) + uVar4 * 4);
        if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(local_20 + 4) * 4) + 4) & 8) == 0
           ) {
          if (((local_18 == 0x20700000) || (local_18 == 0x20800000)) ||
             (iVar3 = local_20, local_18 == 0x11500000)) {
            iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar1[2] * 4);
          }
          uVar4 = *(uint *)(iVar3 + 0x14);
        }
        puVar1[0xd] = uVar4;
        if (uVar4 != 0xffffffff) {
          local_1c = 1;
        }
      }
      local_10 = local_10 + 1;
    } while (local_10 < *(uint *)(in_ECX + 0xc));
  }
  uVar4 = 0;
  if ((*(byte *)(in_ECX + 0xcc) & 4) != 0) {
    return 1;
  }
  uVar6 = *(int *)(in_ECX + 0xc) << 2;
  if (local_1c == 0) {
    local_10 = 0;
    local_14 = operator_new(uVar6);
    if (((local_14 == (void *)0x0) ||
        (local_8 = operator_new(*(int *)(in_ECX + 0xc) << 2), local_8 == (void *)0x0)) ||
       (local_c = operator_new(*(int *)(in_ECX + 0xc) << 2), local_c == (undefined4 *)0x0))
    goto LAB_100913f4;
    uVar6 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        iVar3 = *(int *)(*(int *)(in_ECX + 0x18) + uVar6 * 4);
        *(undefined4 *)(iVar3 + 0x38) = 0xffffffff;
        *(undefined4 *)(iVar3 + 0x24) = 0;
        if (((*(ushort *)(iVar3 + 2) & 0xfff0) != 0) && (*(int *)(iVar3 + 0x1c) == 0)) {
          *(uint *)((int)local_14 + local_10 * 4) = uVar6;
          local_10 = local_10 + 1;
        }
        uVar6 = uVar6 + 1;
      } while (uVar6 < *(uint *)(in_ECX + 0xc));
    }
    local_20 = 0;
    if (local_10 != 0) {
      do {
        iVar3 = FUN_100897ca(*(undefined4 *)((int)local_14 + uVar4 * 4),local_8,&local_20);
        if (iVar3 < 0) goto LAB_100913f9;
        uVar4 = uVar4 + 1;
      } while (uVar4 < local_10);
    }
    uVar4 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      puVar5 = local_c;
      do {
        *puVar5 = *(undefined4 *)
                   (*(int *)(in_ECX + 0x18) +
                   *(int *)((int)puVar5 + ((int)local_8 - (int)local_c)) * 4);
        uVar4 = uVar4 + 1;
        puVar5 = puVar5 + 1;
      } while (uVar4 < *(uint *)(in_ECX + 0xc));
    }
    puVar5 = local_c;
    puVar7 = *(undefined4 **)(in_ECX + 0x18);
    for (uVar4 = *(uint *)(in_ECX + 0xc) & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1) {
      *puVar7 = *puVar5;
      puVar5 = puVar5 + 1;
      puVar7 = puVar7 + 1;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(undefined1 *)puVar7 = *(undefined1 *)puVar5;
      puVar5 = (undefined4 *)((int)puVar5 + 1);
      puVar7 = (undefined4 *)((int)puVar7 + 1);
    }
  }
  else {
    local_8 = operator_new(uVar6);
    if ((local_8 == (void *)0x0) ||
       (local_c = operator_new(*(int *)(in_ECX + 0xc) << 2), local_c == (undefined4 *)0x0)) {
LAB_100913f4:
      iVar3 = -0x7ff8fff2;
      goto LAB_100913f9;
    }
    iVar3 = FUN_1008a979();
    if (iVar3 < 0) goto LAB_100913f9;
    uVar4 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        *(uint *)((int)local_8 + uVar4 * 4) = uVar4;
        uVar4 = uVar4 + 1;
      } while (uVar4 < *(uint *)(in_ECX + 0xc));
    }
    FUN_10086920(FUN_1008661b,local_8,*(undefined4 *)(in_ECX + 0xc),in_ECX);
    uVar4 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      puVar5 = local_c;
      do {
        *puVar5 = *(undefined4 *)
                   (*(int *)(in_ECX + 0x18) +
                   *(int *)(((int)local_8 - (int)local_c) + (int)puVar5) * 4);
        uVar4 = uVar4 + 1;
        puVar5 = puVar5 + 1;
      } while (uVar4 < *(uint *)(in_ECX + 0xc));
    }
    puVar5 = local_c;
    puVar7 = *(undefined4 **)(in_ECX + 0x18);
    for (uVar4 = *(uint *)(in_ECX + 0xc) & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1) {
      *puVar7 = *puVar5;
      puVar5 = puVar5 + 1;
      puVar7 = puVar7 + 1;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(undefined1 *)puVar7 = *(undefined1 *)puVar5;
      puVar5 = (undefined4 *)((int)puVar5 + 1);
      puVar7 = (undefined4 *)((int)puVar7 + 1);
    }
    iVar3 = FUN_1008acd3();
    if ((iVar3 < 0) || (iVar3 = FUN_100cc228(1), iVar3 < 0)) goto LAB_100913f9;
  }
  iVar3 = 0;
LAB_100913f9:
  _free(local_14);
  _free(local_8);
  _free(local_c);
  return iVar3;
}


