// 100bad10 size=505 FUN_100bad10

uint FUN_100bad10(void)

{
  undefined4 *puVar1;
  int iVar2;
  bool bVar3;
  int *piVar4;
  uint uVar5;
  undefined4 uVar6;
  int in_ECX;
  uint uVar7;
  int iVar8;
  uint local_14;
  int local_10;
  int *local_c;
  uint local_8;
  
  uVar7 = **(uint **)(in_ECX + 0x100) & 0xfffff;
  if ((**(uint **)(in_ECX + 0x100) & 0xfff00000) == 0x20800000) {
    bVar3 = false;
    local_14 = 0;
    local_10 = 0;
    do {
      local_8 = 0;
      if (uVar7 != 0) {
        local_c = *(int **)(*(int *)(in_ECX + 0x100) + 0x10);
        piVar4 = (int *)(*(int *)(*(int *)(in_ECX + 0x100) + 8) + local_10);
        do {
          iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + *local_c * 4);
          iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar4 * 4);
          if ((((*(int *)(iVar8 + 4) != *(int *)(iVar2 + 4)) ||
               (*(int *)(iVar8 + 8) != *(int *)(iVar2 + 8))) ||
              (*(int *)(iVar8 + 0xc) != *(int *)(iVar2 + 0xc))) ||
             (*(int *)(iVar8 + 0x10) != *(int *)(iVar2 + 0x10))) break;
          local_8 = local_8 + 1;
          local_c = local_c + 1;
          piVar4 = piVar4 + 1;
        } while (local_8 < uVar7);
      }
      if (local_8 != uVar7) {
        uVar5 = FUN_10086199(uVar7 | 0x10000000,uVar7,uVar7);
        if (uVar5 == 0xffffffff) {
          return 0x8007000e;
        }
        local_c = (int *)0x0;
        iVar2 = *(int *)(*(int *)(in_ECX + 0x18) + uVar5 * 4);
        if (uVar7 != 0) {
          local_8 = local_10;
          do {
            iVar8 = (int)local_c * 4;
            *(undefined4 *)(iVar8 + *(int *)(iVar2 + 8)) =
                 *(undefined4 *)(local_8 + *(int *)(*(int *)(in_ECX + 0x100) + 8));
            uVar6 = FUN_10086240(*(undefined4 *)
                                  (*(int *)(in_ECX + 0x14) +
                                  *(int *)(iVar8 + *(int *)(*(int *)(in_ECX + 0x100) + 0x10)) * 4));
            *(undefined4 *)(local_8 + *(int *)(*(int *)(in_ECX + 0x100) + 8)) = uVar6;
            *(undefined4 *)(iVar8 + *(int *)(iVar2 + 0x10)) =
                 *(undefined4 *)(local_8 + *(int *)(*(int *)(in_ECX + 0x100) + 8));
            if (*(int *)(iVar8 + *(int *)(iVar2 + 0x10)) == -1) {
              return 0x8007000e;
            }
            local_c = (int *)((int)local_c + 1);
            local_8 = local_8 + 4;
            *(undefined4 *)
             (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar8 + *(int *)(iVar2 + 0x10)) * 4) +
             0x14) = *(undefined4 *)
                      (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar8 + *(int *)(iVar2 + 8)) * 4)
                      + 0x14);
            *(undefined4 *)
             (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar8 + *(int *)(iVar2 + 0x10)) * 4) +
             0x18) = *(undefined4 *)
                      (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar8 + *(int *)(iVar2 + 8)) * 4)
                      + 0x18);
          } while (local_c < uVar7);
        }
        while ((*(uint *)(in_ECX + 0xfc) < uVar5 ||
               ((uVar5 != 0 &&
                ((**(uint **)(*(int *)(in_ECX + 0x18) + -4 + uVar5 * 4) & 0xfff00000) == 0x20800000)
                )))) {
          puVar1 = (undefined4 *)(*(int *)(in_ECX + 0x18) + uVar5 * 4);
          *puVar1 = puVar1[-1];
          uVar5 = uVar5 - 1;
        }
        *(int *)(*(int *)(in_ECX + 0x18) + uVar5 * 4) = iVar2;
        *(int *)(in_ECX + 0xfc) = *(int *)(in_ECX + 0xfc) + 1;
        bVar3 = true;
      }
      local_14 = local_14 + 1;
      local_10 = local_10 + uVar7 * 4;
    } while (local_14 < 2);
    uVar7 = (uint)!bVar3;
  }
  else {
    uVar7 = 1;
  }
  return uVar7;
}


