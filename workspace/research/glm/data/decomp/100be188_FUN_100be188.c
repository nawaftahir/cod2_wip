// 100be188 size=750 FUN_100be188

int FUN_100be188(void)

{
  uint *puVar1;
  uint *puVar2;
  int iVar3;
  undefined4 uVar4;
  bool bVar5;
  int *piVar6;
  int iVar7;
  int in_ECX;
  undefined *puVar8;
  uint uVar9;
  int iVar10;
  undefined4 *puVar11;
  undefined4 *puVar12;
  uint local_10;
  uint local_c;
  uint local_8;
  
  puVar1 = *(uint **)(in_ECX + 0x100);
  puVar8 = (undefined *)(*puVar1 & 0xfff00000);
  if (((((puVar8 == (undefined *)0x50000000) || (puVar8 == &DAT_10500000)) ||
       (puVar8 == &DAT_10600000)) || ((puVar8 == &DAT_10300000 || (puVar8 == &DAT_10700000)))) &&
     (puVar1[3] == 1)) {
    iVar7 = *(int *)(in_ECX + 0x14);
    bVar5 = false;
    iVar10 = *(int *)(iVar7 + *(int *)puVar1[4] * 4);
    if (*(int *)(iVar10 + 0x54) != -1) {
      local_c = 0;
      puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar10 + 0x54) * 4);
      local_10 = puVar2[3];
      if (local_10 != 0) {
        piVar6 = (int *)puVar2[4];
        do {
          uVar9 = *(uint *)(*(int *)(iVar7 + *piVar6 * 4) + 0x4c);
          if (local_c < uVar9) {
            local_c = uVar9;
          }
          piVar6 = piVar6 + 1;
          local_10 = local_10 - 1;
        } while (local_10 != 0);
      }
      iVar3 = *(int *)(iVar7 + *(int *)puVar2[4] * 4);
      if (((*(int *)(iVar3 + 4) == *(int *)(iVar10 + 4)) &&
          (*(int *)(iVar3 + 0xc) == *(int *)(iVar10 + 0xc))) &&
         ((*(int *)(iVar3 + 8) == *(int *)(iVar10 + 8) &&
          (*(int *)(iVar10 + 0x54) != *(int *)(iVar10 + 0x58))))) {
        bVar5 = true;
      }
      if ((((local_c <= *(uint *)(in_ECX + 0xfc)) &&
           ((bVar5 || (*(int *)(iVar10 + 0x54) == *(int *)(iVar10 + 0x58))))) &&
          (((*(byte *)(in_ECX + 0x6c) & 1) == 0 ||
           ((puVar2[3] != 0 &&
            (*(int *)(*(int *)(iVar7 + *(int *)puVar2[4] * 4) + 4) != *(int *)(in_ECX + 0x84)))))))
         && (((*puVar2 & 0xfff00000) == 0x10000000 &&
             ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar3 + 4) * 4) + 4) & 4) == 0)
             ))) {
        uVar9 = 0;
        if (puVar2[1] != 0) {
          piVar6 = (int *)puVar2[2];
          do {
            if (*piVar6 != *(int *)puVar1[4]) {
              return 1;
            }
            uVar9 = uVar9 + 1;
            piVar6 = piVar6 + 1;
          } while (uVar9 < puVar2[1]);
        }
        iVar10 = 0;
        if (*(int *)(*(int *)(iVar7 + *(int *)puVar2[2] * 4) + 0x3c) == 0) {
          iVar7 = FUN_10085814(0x74);
          if (iVar7 != 0) {
            iVar10 = FUN_10085379();
          }
          if (iVar10 != 0) {
            iVar7 = FUN_1008585f(**(undefined4 **)(in_ECX + 0x100),
                                 (*(undefined4 **)(in_ECX + 0x100))[1],(uint)bVar5 + puVar2[3],1);
            if (iVar7 < 0) {
              FUN_1006c418(1);
              return iVar7;
            }
            puVar11 = (undefined4 *)puVar2[4];
            puVar12 = *(undefined4 **)(iVar10 + 0x10);
            for (uVar9 = puVar2[3] & 0x3fffffff; uVar9 != 0; uVar9 = uVar9 - 1) {
              *puVar12 = *puVar11;
              puVar11 = puVar11 + 1;
              puVar12 = puVar12 + 1;
            }
            for (iVar7 = 0; iVar7 != 0; iVar7 = iVar7 + -1) {
              *(undefined1 *)puVar12 = *(undefined1 *)puVar11;
              puVar11 = (undefined4 *)((int)puVar11 + 1);
              puVar12 = (undefined4 *)((int)puVar12 + 1);
            }
            if (bVar5) {
              *(undefined4 *)(*(int *)(iVar10 + 0x10) + puVar2[3] * 4) =
                   **(undefined4 **)(*(int *)(in_ECX + 0x100) + 0x10);
            }
            uVar9 = *(uint *)(iVar10 + 0xc);
            local_8 = 0;
            if (uVar9 != 0) {
              local_10 = 1;
              do {
                local_c = local_10;
                if (local_10 < uVar9) {
                  do {
                    iVar7 = *(int *)(*(int *)(in_ECX + 0x14) +
                                    *(int *)(*(int *)(iVar10 + 0x10) + local_8 * 4) * 4);
                    iVar3 = *(int *)(*(int *)(in_ECX + 0x14) +
                                    *(int *)(local_c * 4 + *(int *)(iVar10 + 0x10)) * 4);
                    if (*(uint *)(iVar3 + 0x10) < *(uint *)(iVar7 + 0x10)) {
                      puVar11 = (undefined4 *)(local_c * 4 + *(int *)(iVar10 + 0x10));
                      uVar4 = *puVar11;
                      *puVar11 = *(undefined4 *)(*(int *)(iVar10 + 0x10) + local_8 * 4);
                      *(undefined4 *)(*(int *)(iVar10 + 0x10) + local_8 * 4) = uVar4;
                    }
                    if (*(int *)(iVar7 + 0x10) == *(int *)(iVar3 + 0x10)) {
                      FUN_1008b0b5(in_ECX,*(undefined4 *)(*(int *)(in_ECX + 0x100) + 0x3c),0x12d6,
                                   "internal error: multiple write to same output");
                      FUN_1006c418(1);
                      return -0x7fffbffb;
                    }
                    local_c = local_c + 1;
                  } while (local_c < *(uint *)(iVar10 + 0xc));
                }
                local_8 = local_8 + 1;
                uVar9 = *(uint *)(iVar10 + 0xc);
                local_10 = local_10 + 1;
              } while (local_8 < uVar9);
            }
            puVar11 = *(undefined4 **)(*(int *)(in_ECX + 0x100) + 8);
            puVar12 = *(undefined4 **)(iVar10 + 8);
            for (uVar9 = *(uint *)(*(int *)(in_ECX + 0x100) + 4) & 0x3fffffff; uVar9 != 0;
                uVar9 = uVar9 - 1) {
              *puVar12 = *puVar11;
              puVar11 = puVar11 + 1;
              puVar12 = puVar12 + 1;
            }
            for (iVar7 = 0; iVar7 != 0; iVar7 = iVar7 + -1) {
              *(undefined1 *)puVar12 = *(undefined1 *)puVar11;
              puVar11 = (undefined4 *)((int)puVar11 + 1);
              puVar12 = (undefined4 *)((int)puVar12 + 1);
            }
            if (*(int *)(*(int *)(in_ECX + 0x18) + *(int *)(in_ECX + 0xfc) * 4) != 0) {
              FUN_1006c418(1);
            }
            *(int *)(*(int *)(in_ECX + 0x18) + *(int *)(in_ECX + 0xfc) * 4) = iVar10;
            *puVar2 = 0;
            return 0;
          }
          return -0x7ff8fff2;
        }
      }
      return 1;
    }
  }
  return 1;
}


