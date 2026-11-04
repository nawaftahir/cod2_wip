// 100a7a71 size=435 FUN_100a7a71

int FUN_100a7a71(void)

{
  uint *puVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  int in_ECX;
  uint uVar5;
  uint local_14;
  int local_10;
  uint local_8;
  
  local_8 = 0;
  if (*(int *)(in_ECX + 0x4c) != 0) {
    do {
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x230) + local_8 * 4);
      if (puVar1 != (uint *)0x0) {
        uVar2 = *puVar1 & 0xfff00000;
        if ((uVar2 != 0x72100000) && (uVar2 != 0)) {
          uVar5 = *puVar1 & 0xfffff;
          local_10 = (-(uint)(uVar2 != 0x11000000) & uVar5) * 4;
          if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                 *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                  *(int *)(local_10 + puVar1[2]) * 4) + 4) * 4) + 5)
              & 2) != 0) {
            iVar3 = FUN_10085814();
            if (iVar3 == 0) {
              iVar3 = 0;
            }
            else {
              iVar3 = FUN_10085379();
            }
            if (iVar3 == 0) {
              return -0x7ff8fff2;
            }
            iVar4 = FUN_1008585f(uVar5 | 0x10000000,uVar5,uVar5,0);
            if ((iVar4 < 0) || (iVar4 = FUN_100853b0(), iVar4 < 0)) {
LAB_100a7c17:
              FUN_1006c418();
              return iVar4;
            }
            local_14 = 0;
            if (uVar5 != 0) {
              do {
                iVar4 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0,local_14,0);
                *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4) + 0x3c) = 0;
                *(int *)(*(int *)(iVar3 + 0x10) + local_14 * 4) = iVar4;
                *(undefined4 *)(*(int *)(iVar3 + 8) + local_14 * 4) =
                     *(undefined4 *)
                      (local_10 + *(int *)(*(int *)(*(int *)(in_ECX + 0x230) + local_8 * 4) + 8));
                local_14 = local_14 + 1;
                *(int *)(local_10 + *(int *)(*(int *)(*(int *)(in_ECX + 0x230) + local_8 * 4) + 8))
                     = iVar4;
                local_10 = local_10 + 4;
              } while (local_14 < uVar5);
            }
            puVar1 = (uint *)(in_ECX + 0x220);
            if (0x1ff < *puVar1) {
              iVar4 = -0x7ff8fff2;
              goto LAB_100a7c17;
            }
            *(int *)(*(int *)(in_ECX + 0x22c) + *puVar1 * 4) = iVar3;
            *puVar1 = *puVar1 + 1;
            iVar4 = FUN_10086026();
            if (iVar4 < 0) goto LAB_100a7c17;
          }
        }
      }
      local_8 = local_8 + 1;
    } while (local_8 < *(uint *)(in_ECX + 0x4c));
  }
  return 0;
}


