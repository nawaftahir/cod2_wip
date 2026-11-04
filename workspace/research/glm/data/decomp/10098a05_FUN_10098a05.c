// 10098a05 size=564 FUN_10098a05

int FUN_10098a05(void)

{
  undefined4 uVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  int in_ECX;
  uint uVar5;
  undefined4 *puVar6;
  uint uVar7;
  undefined4 *puVar8;
  undefined1 local_7c [100];
  uint local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  undefined4 *local_8;
  
  local_8 = (undefined4 *)0x0;
  if ((*(byte *)(in_ECX + 0x6f) & 0xc) == 0) {
    return 1;
  }
  iVar2 = FUN_10086eae();
  if (iVar2 < 0) {
    return iVar2;
  }
  iVar2 = FUN_1009298d(local_7c,*(undefined4 *)(in_ECX + 0x88),*(int *)(in_ECX + 0x2c) + -1);
  if ((iVar2 < 0) || (iVar2 = FUN_10093058(local_7c,0), iVar2 < 0)) {
    FUN_1008a66c(local_7c);
    iVar2 = FUN_1009298d(local_7c,*(undefined4 *)(in_ECX + 0x88),*(undefined4 *)(in_ECX + 0x2c));
    if ((iVar2 < 0) || (iVar2 = FUN_10093058(local_7c,0), iVar2 < 0)) goto LAB_10098c1f;
  }
  local_8 = operator_new(*(int *)(in_ECX + 0xc) << 2);
  if (local_8 != (undefined4 *)0x0) {
    puVar6 = *(undefined4 **)(in_ECX + 0x18);
    puVar8 = local_8;
    for (uVar5 = *(uint *)(in_ECX + 0xc) & 0x3fffffff; uVar5 != 0; uVar5 = uVar5 - 1) {
      *puVar8 = *puVar6;
      puVar6 = puVar6 + 1;
      puVar8 = puVar8 + 1;
    }
    for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
      *(undefined1 *)puVar8 = *(undefined1 *)puVar6;
      puVar6 = (undefined4 *)((int)puVar6 + 1);
      puVar8 = (undefined4 *)((int)puVar8 + 1);
    }
    local_10 = FUN_10089348();
    local_14 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        uVar5 = local_14;
        if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x18) + local_14 * 4) + 0x2c) & 1) != 0) {
          while ((local_c = uVar5, local_c != 0 && (iVar2 = FUN_100893fa(local_c), iVar2 != 0))) {
            local_18 = FUN_10089348();
            if ((local_18 <= local_10) &&
               (((local_18 != local_10 ||
                 (((*(byte *)(in_ECX + 0x6f) & 8) == 0 &&
                  (piVar3 = (int *)(*(int *)(in_ECX + 0x18) + local_c * 4),
                  *(int *)(*piVar3 + 0x2c) == *(int *)(piVar3[-1] + 0x2c))))) &&
                (iVar2 = FUN_10093058(local_7c,0), -1 < iVar2)))) {
              puVar6 = *(undefined4 **)(in_ECX + 0x18);
              puVar8 = local_8;
              for (uVar5 = local_14 * 4 + 4 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
                *puVar8 = *puVar6;
                puVar6 = puVar6 + 1;
                puVar8 = puVar8 + 1;
              }
              for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
                *(undefined1 *)puVar8 = *(undefined1 *)puVar6;
                puVar6 = (undefined4 *)((int)puVar6 + 1);
                puVar8 = (undefined4 *)((int)puVar8 + 1);
              }
              local_10 = local_18;
            }
            uVar5 = local_c - 1;
          }
          puVar6 = local_8;
          puVar8 = *(undefined4 **)(in_ECX + 0x18);
          for (uVar5 = local_14 * 4 + 4 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
            *puVar8 = *puVar6;
            puVar6 = puVar6 + 1;
            puVar8 = puVar8 + 1;
          }
          for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
            *(undefined1 *)puVar8 = *(undefined1 *)puVar6;
            puVar6 = (undefined4 *)((int)puVar6 + 1);
            puVar8 = (undefined4 *)((int)puVar8 + 1);
          }
        }
        local_14 = local_14 + 1;
      } while (local_14 < *(uint *)(in_ECX + 0xc));
    }
    uVar5 = *(uint *)(in_ECX + 0xc);
    local_14 = 0;
    if (uVar5 != 0) {
      do {
        iVar2 = local_14 * 4;
        if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x18) + iVar2) + 0x2c) & 1) != 0) {
          uVar7 = local_14 + 1;
          if (uVar7 < uVar5) {
            piVar3 = (int *)(*(int *)(in_ECX + 0x18) + uVar7 * 4);
            do {
              if (*(int *)(*(int *)(*(int *)(in_ECX + 0x18) + iVar2) + 0x2c) !=
                  *(int *)(*piVar3 + 0x2c)) break;
              uVar7 = uVar7 + 1;
              piVar3 = piVar3 + 1;
            } while (uVar7 < *(uint *)(in_ECX + 0xc));
          }
          uVar5 = uVar7 - local_14 >> 1;
          if (uVar5 != 0) {
            iVar4 = uVar7 << 2;
            local_14 = iVar2;
            local_10 = uVar5;
            do {
              puVar6 = (undefined4 *)(local_14 + *(int *)(in_ECX + 0x18));
              uVar1 = *puVar6;
              *puVar6 = *(undefined4 *)(iVar4 + -4 + *(int *)(in_ECX + 0x18));
              *(undefined4 *)(iVar4 + -4 + *(int *)(in_ECX + 0x18)) = uVar1;
              iVar4 = iVar4 + -4;
              local_10 = local_10 - 1;
              local_14 = local_14 + 4;
            } while (local_10 != 0);
          }
          local_14 = uVar7 - 1;
        }
        uVar5 = *(uint *)(in_ECX + 0xc);
        local_14 = local_14 + 1;
      } while (local_14 < uVar5);
    }
  }
LAB_10098c1f:
  FUN_1008a66c(local_7c);
  _free(local_8);
  return 0;
}


