// 100c2e40 size=310 FUN_100c2e40

undefined4 FUN_100c2e40(void)

{
  uint *puVar1;
  int iVar2;
  int iVar3;
  bool bVar4;
  bool bVar5;
  int iVar6;
  int in_ECX;
  uint uVar7;
  uint local_14;
  uint local_10;
  int *local_8;
  
  do {
    bVar5 = false;
    local_10 = 0;
    if (*(int *)(in_ECX + 0xc) == 0) {
      return 0;
    }
    do {
      iVar6 = FUN_100855b0();
      if (iVar6 != 0) {
        uVar7 = local_10 + 1;
        bVar4 = true;
        if (uVar7 < *(uint *)(in_ECX + 0xc)) {
          do {
            puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar7 * 4);
            iVar6 = FUN_100855e8();
            if (iVar6 != 0) break;
            if ((*puVar1 & 0xfff00000) != 0x10000000) {
              bVar4 = false;
              break;
            }
            local_14 = puVar1[3];
            if (local_14 != 0) {
              local_8 = (int *)puVar1[2];
              iVar6 = puVar1[4] - (int)local_8;
              do {
                iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar6 + (int)local_8) * 4);
                iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *local_8 * 4);
                if ((((*(int *)(iVar2 + 0x38) != *(int *)(iVar3 + 0x38)) ||
                     (*(int *)(iVar2 + 0x3c) != *(int *)(iVar3 + 0x3c))) ||
                    (*(int *)(iVar2 + 4) != *(int *)(iVar3 + 4))) ||
                   (((*(int *)(iVar2 + 0xc) != *(int *)(iVar3 + 0xc) ||
                     (*(int *)(iVar2 + 8) != *(int *)(iVar3 + 8))) ||
                    (*(int *)(iVar2 + 0x10) != *(int *)(iVar3 + 0x10))))) {
                  bVar4 = false;
                }
                local_8 = local_8 + 1;
                local_14 = local_14 - 1;
              } while (local_14 != 0);
            }
            uVar7 = uVar7 + 1;
          } while (uVar7 < *(uint *)(in_ECX + 0xc));
          if (!bVar4) goto LAB_100c2f58;
        }
        bVar5 = true;
        uVar7 = local_10;
        if (local_10 < *(uint *)(in_ECX + 0xc)) {
          do {
            iVar6 = FUN_100855e8();
            if (iVar6 != 0) break;
            **(undefined4 **)(*(int *)(in_ECX + 0x18) + uVar7 * 4) = 0;
            uVar7 = uVar7 + 1;
          } while (uVar7 < *(uint *)(in_ECX + 0xc));
        }
      }
LAB_100c2f58:
      local_10 = local_10 + 1;
    } while (local_10 < *(uint *)(in_ECX + 0xc));
    if (!bVar5) {
      return 0;
    }
  } while( true );
}


