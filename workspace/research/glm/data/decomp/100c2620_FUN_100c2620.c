// 100c2620 size=869 FUN_100c2620

int FUN_100c2620(void)

{
  byte bVar1;
  uint *puVar2;
  int iVar3;
  int *piVar4;
  int in_ECX;
  uint uVar5;
  uint uVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 local_ec [25];
  int local_88 [5];
  int local_74;
  int local_24;
  uint local_20;
  uint local_1c;
  uint local_18;
  uint local_14;
  undefined4 *local_10;
  undefined4 *local_c;
  uint local_8;
  
  if ((*(byte *)(in_ECX + 0xcc) & 4) != 0) {
    return 1;
  }
  iVar3 = FUN_10086eae();
  if (iVar3 < 0) {
    return iVar3;
  }
  iVar3 = FUN_1008acd3();
  if (iVar3 < 0) {
    return iVar3;
  }
  uVar5 = *(uint *)(in_ECX + 0xc);
  local_c = (undefined4 *)0x0;
  local_10 = (undefined4 *)0x0;
  local_20 = 0;
  bVar1 = *(byte *)(in_ECX + 0x6f);
  piVar4 = local_88;
  for (iVar3 = 0x19; iVar3 != 0; iVar3 = iVar3 + -1) {
    *piVar4 = 0;
    piVar4 = piVar4 + 1;
  }
  puVar7 = local_ec;
  local_18 = uVar5;
  for (iVar3 = 0x19; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar7 = 0;
    puVar7 = puVar7 + 1;
  }
  if ((bVar1 & 0x10) == 0) {
    if (*(int *)(in_ECX + 0x30) != 0) {
      iVar3 = FUN_1009298d(local_ec,*(undefined4 *)(in_ECX + 0x8c),*(int *)(in_ECX + 0x30));
      if (iVar3 < 0) goto LAB_100c2944;
      iVar3 = FUN_10093058(local_ec,0);
      local_20 = (uint)(-1 < iVar3);
    }
    iVar3 = FUN_1009298d(local_88,*(undefined4 *)(in_ECX + 0x88),*(int *)(in_ECX + 0x2c) + -1);
    if ((iVar3 < 0) || (iVar3 = FUN_10093058(local_88,0), iVar3 < 0)) {
      FUN_1008a66c(local_88);
      iVar3 = FUN_1009298d(local_88,*(undefined4 *)(in_ECX + 0x88),*(undefined4 *)(in_ECX + 0x2c));
      if ((iVar3 < 0) || (iVar3 = FUN_10093058(local_88,0), iVar3 < 0)) {
        if (iVar3 != -0x7ff8fff2) {
          iVar3 = 1;
        }
        goto LAB_100c2944;
      }
    }
  }
  uVar6 = uVar5 << 2;
  local_14 = uVar6;
  local_c = operator_new(uVar6);
  if ((local_c == (undefined4 *)0x0) ||
     (local_10 = operator_new(uVar6), local_10 == (undefined4 *)0x0)) {
    iVar3 = -0x7ff8fff2;
  }
  else {
    puVar7 = *(undefined4 **)(in_ECX + 0x18);
    puVar8 = local_10;
    for (uVar5 = uVar5 & 0x3fffffff; uVar5 != 0; uVar5 = uVar5 - 1) {
      *puVar8 = *puVar7;
      puVar7 = puVar7 + 1;
      puVar8 = puVar8 + 1;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(undefined1 *)puVar8 = *(undefined1 *)puVar7;
      puVar7 = (undefined4 *)((int)puVar7 + 1);
      puVar8 = (undefined4 *)((int)puVar8 + 1);
    }
    puVar7 = *(undefined4 **)(in_ECX + 0x18);
    puVar8 = local_c;
    for (uVar5 = local_14 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
      *puVar8 = *puVar7;
      puVar7 = puVar7 + 1;
      puVar8 = puVar8 + 1;
    }
    for (uVar5 = local_14 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
      *(undefined1 *)puVar8 = *(undefined1 *)puVar7;
      puVar7 = (undefined4 *)((int)puVar7 + 1);
      puVar8 = (undefined4 *)((int)puVar8 + 1);
    }
    uVar5 = 0;
    local_8 = local_18;
    if (local_18 != 0) {
      do {
        iVar3 = *(int *)(*(int *)(in_ECX + 0x18) + uVar5 * 4);
        *(int *)(in_ECX + 0x100) = iVar3;
        *(undefined4 *)(iVar3 + 0x24) = 0xffffffff;
        uVar5 = uVar5 + 1;
      } while (uVar5 < local_18);
    }
joined_r0x100c27d6:
    uVar5 = local_8 - 1;
    local_8 = uVar5;
    if (-1 < (int)uVar5) {
      puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar5 * 4);
      *(uint **)(in_ECX + 0x100) = puVar2;
      uVar6 = *puVar2;
      if (((((uVar6 & 0xfff00000) != 0) && ((uVar6 & 0xf0000000) != 0x60000000)) &&
          (iVar3 = FUN_10085604(), iVar3 == 0)) &&
         ((**(uint **)(in_ECX + 0x100) & 0xfff00000) != 0x11000000)) {
        FUN_100b9ffd(local_10,*(uint **)(in_ECX + 0x100),uVar5);
        if ((*(byte *)(in_ECX + 0x70) & 8) == 0) {
          iVar3 = FUN_100c24e3(local_88,local_ec,local_c,local_10,uVar5,local_20);
        }
        else {
          puVar2 = *(uint **)(in_ECX + 0x100);
          local_18 = 0;
          local_1c = (uint)((*puVar2 & 0xfff00000) == 0x50000000);
          if (puVar2[3] != 0) {
            local_24 = *(int *)(*(int *)(in_ECX + 0x100) + 0xc);
            piVar4 = (int *)puVar2[4];
            do {
              iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar4 * 4);
              if ((*(int *)(in_ECX + 0x6c) << 3 < 0) || (local_88[0] != *(int *)(iVar3 + 4))) {
                iVar3 = *(int *)(iVar3 + 0x10);
              }
              else {
                iVar3 = *(int *)(local_74 + (*(int *)(iVar3 + 0x10) + *(int *)(iVar3 + 0xc) * 4) * 4
                                );
              }
              if (iVar3 == 3) {
                local_18 = 1;
              }
              else {
                local_1c = 1;
              }
              piVar4 = piVar4 + 1;
              local_24 = local_24 + -1;
            } while (local_24 != 0);
          }
          if (local_1c == 0) {
            uVar10 = 1;
            uVar9 = 0;
          }
          else {
            if (local_18 != 0) goto joined_r0x100c27d6;
            uVar10 = 0;
            uVar9 = 1;
          }
          iVar3 = FUN_100c22e7(local_88,local_c,local_10,local_8,uVar9,uVar10);
        }
        if (iVar3 < 0) goto LAB_100c2944;
        if (iVar3 == 0) {
          local_8 = local_8 - 1;
          puVar7 = *(undefined4 **)(in_ECX + 0x18);
          puVar8 = local_c;
          for (uVar5 = local_14 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
            *puVar8 = *puVar7;
            puVar7 = puVar7 + 1;
            puVar8 = puVar8 + 1;
          }
          for (uVar5 = local_14 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
            *(undefined1 *)puVar8 = *(undefined1 *)puVar7;
            puVar7 = (undefined4 *)((int)puVar7 + 1);
            puVar8 = (undefined4 *)((int)puVar8 + 1);
          }
        }
      }
      goto joined_r0x100c27d6;
    }
    iVar3 = 0;
  }
LAB_100c2944:
  if (((*(byte *)(in_ECX + 0x6f) & 0x10) == 0) &&
     (FUN_1008a66c(local_88), *(int *)(in_ECX + 0x30) != 0)) {
    FUN_1008a66c(local_ec);
  }
  _free(local_10);
  _free(local_c);
  return iVar3;
}


