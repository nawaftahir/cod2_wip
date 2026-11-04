// 100abbf7 size=991 FUN_100abbf7

undefined4 FUN_100abbf7(uint param_1,int param_2)

{
  uint *puVar1;
  uint uVar2;
  int iVar3;
  int in_ECX;
  uint uVar4;
  int iVar5;
  undefined4 *puVar6;
  int *piVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  int local_5c [6];
  int local_44 [6];
  undefined4 local_2c [6];
  int *local_14;
  uint local_10;
  int local_c;
  int local_8;
  
  uVar4 = 0;
  uVar2 = param_1;
  do {
    if (uVar2 == 0) break;
    uVar4 = uVar4 + 1;
    uVar2 = uVar2 & uVar2 - 1;
  } while (uVar4 < 7);
  if ((uVar4 < 7) && (*(int *)(in_ECX + 0x480) - uVar4 < 7)) {
    local_8 = 0;
    local_c = 0;
    local_10 = 0;
    if (*(int *)(in_ECX + 0x480) != 0) {
      local_14 = (int *)(in_ECX + 0x450);
      do {
        puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + *local_14 * 4);
        uVar2 = *puVar1 & 0xfff00000;
        if ((param_1 & 1 << ((byte)local_10 & 0x1f)) == 0) {
          if (uVar2 == 0x11000000) {
            return 0;
          }
          if (uVar2 != 0x72100000) {
            iVar3 = *(int *)(*(int *)(in_ECX + 0x14) +
                            *(int *)(puVar1[2] + (*puVar1 & 0xfffff) * 4) * 4);
            if (*(char *)(iVar3 + 0x6c) != '\x03') {
              return 0;
            }
            if (*(int *)(iVar3 + 0x3c) != 0) {
              return 0;
            }
          }
          piVar7 = local_44 + local_8;
          local_8 = local_8 + 1;
          *piVar7 = (int)puVar1;
        }
        else {
          if (puVar1[9] == 1) {
            return 0;
          }
          piVar7 = local_5c + local_c;
          local_c = local_c + 1;
          *piVar7 = (int)puVar1;
        }
        local_10 = local_10 + 1;
        local_14 = local_14 + 1;
      } while (local_10 < *(uint *)(in_ECX + 0x480));
    }
    iVar3 = local_8;
    puVar6 = local_2c;
    for (iVar5 = 6; iVar5 != 0; iVar5 = iVar5 + -1) {
      *puVar6 = 0xffffffff;
      puVar6 = puVar6 + 1;
    }
    iVar3 = FUN_100aba21(*(undefined4 *)(in_ECX + 0x22c),local_2c,local_44,iVar3);
    if (((((iVar3 != 0) &&
          (iVar3 = FUN_100aba21(*(undefined4 *)(in_ECX + 0x230),local_2c,local_5c,local_c,0),
          iVar3 != 0)) &&
         (iVar3 = FUN_100aba21(*(undefined4 *)(in_ECX + 0x22c),local_2c,local_44,local_8,1),
         iVar3 != 0)) &&
        ((iVar3 = FUN_100aba21(*(undefined4 *)(in_ECX + 0x230),local_2c,local_5c,local_c,1),
         iVar3 != 0 &&
         (iVar3 = FUN_100aba21(*(undefined4 *)(in_ECX + 0x22c),local_2c,local_44,local_8,2),
         iVar3 != 0)))) &&
       (iVar3 = FUN_100aba21(*(undefined4 *)(in_ECX + 0x230),local_2c,local_5c,local_c,2),
       iVar3 != 0)) {
      if (param_2 == 0) {
        piVar7 = local_5c;
        for (iVar3 = 6; iVar3 != 0; iVar3 = iVar3 + -1) {
          *piVar7 = 0;
          piVar7 = piVar7 + 1;
        }
        piVar7 = local_44;
        for (iVar3 = 6; iVar3 != 0; iVar3 = iVar3 + -1) {
          *piVar7 = 0;
          piVar7 = piVar7 + 1;
        }
        param_2 = 0;
        uVar2 = 0;
        do {
          if ((*(int *)(uVar2 + *(int *)(in_ECX + 0x22c)) != 0) ||
             (*(int *)(uVar2 + *(int *)(in_ECX + 0x230)) != 0)) {
            local_14 = (int *)0x0;
            puVar1 = *(uint **)(uVar2 + *(int *)(in_ECX + 0x230));
            if (puVar1 != (uint *)0x0) {
              local_14 = (int *)(*puVar1 & 0xfff00000);
            }
            uVar8 = FUN_100a6e19();
            local_10 = (uint)uVar8;
            if (local_10 == 0) {
              uVar9 = FUN_100a6e19();
              uVar8 = CONCAT44((int)((ulonglong)uVar9 >> 0x20),local_10);
              if ((int)uVar9 == 0) goto LAB_100abf84;
            }
            local_10 = (uint)uVar8;
            param_1 = -1;
            if (local_10 != 0) {
              iVar3 = *(int *)(*(int *)(in_ECX + 0x14) +
                              **(int **)((int)((ulonglong)uVar8 >> 0x20) + 8) * 4);
              param_1 = FUN_10086139(*(undefined4 *)(iVar3 + 4),*(undefined4 *)(iVar3 + 0xc),
                                     *(undefined4 *)(iVar3 + 0x10),*(undefined8 *)(iVar3 + 0x20));
              if (param_1 == -1) {
                return 0;
              }
              uVar4 = 0;
              if ((**(uint **)(uVar2 + *(int *)(in_ECX + 0x22c)) & 0xfffff) != 0) {
                do {
                  *(uint *)(*(int *)(*(int *)(uVar2 + *(int *)(in_ECX + 0x22c)) + 8) + uVar4 * 4) =
                       param_1;
                  uVar4 = uVar4 + 1;
                } while (uVar4 < (**(uint **)(uVar2 + *(int *)(in_ECX + 0x22c)) & 0xfffff));
              }
              local_c = *(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4);
              *(int *)((int)local_5c + uVar2) = iVar3;
              FUN_10085c65();
              *(int *)(local_c + 0xc) = param_2;
            }
            iVar3 = FUN_100a6e19();
            if (iVar3 != 0) {
              iVar3 = *(int *)(*(int *)(in_ECX + 0x14) +
                              **(int **)(*(int *)(uVar2 + *(int *)(in_ECX + 0x230)) + 8) * 4);
              if ((param_1 == -1) &&
                 (param_1 = FUN_10086139(*(undefined4 *)(iVar3 + 4),*(undefined4 *)(iVar3 + 0xc),
                                         *(undefined4 *)(iVar3 + 0x10),*(undefined8 *)(iVar3 + 0x20)
                                        ), param_1 == -1)) {
                return 0;
              }
              uVar4 = 0;
              if ((**(uint **)(uVar2 + *(int *)(in_ECX + 0x230)) & 0xfffff) != 0) {
                do {
                  *(uint *)(*(int *)(*(int *)(uVar2 + *(int *)(in_ECX + 0x230)) + 8) + uVar4 * 4) =
                       param_1;
                  uVar4 = uVar4 + 1;
                } while (uVar4 < (**(uint **)(uVar2 + *(int *)(in_ECX + 0x230)) & 0xfffff));
              }
              *(int *)((int)local_44 + uVar2) = iVar3;
              if (local_10 == 0) {
                local_14 = *(int **)(*(int *)(in_ECX + 0x14) + param_1 * 4);
                FUN_10085c65();
                *(int *)((int)local_14 + 0xc) = param_2;
              }
            }
            if (param_1 == -1) {
              return 0;
            }
          }
LAB_100abf84:
          param_2 = param_2 + 1;
          uVar2 = uVar2 + 4;
        } while (uVar2 < 0x18);
        uVar2 = 0;
        do {
          if (*(int *)((int)local_5c + uVar2) != 0) {
            *(undefined4 *)(*(int *)((int)local_5c + uVar2) + 4) = *(undefined4 *)(in_ECX + 0x74);
          }
          if (*(int *)((int)local_44 + uVar2) != 0) {
            *(undefined4 *)(*(int *)((int)local_44 + uVar2) + 4) = *(undefined4 *)(in_ECX + 0x74);
          }
          uVar2 = uVar2 + 4;
        } while (uVar2 < 0x18);
      }
      *(undefined4 *)(in_ECX + 0x220) = 6;
      *(undefined4 *)(in_ECX + 0x224) = 6;
      return 1;
    }
  }
  return 0;
}


