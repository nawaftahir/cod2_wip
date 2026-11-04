// 100a7c24 size=416 FUN_100a7c24

int FUN_100a7c24(void)

{
  int *piVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  int in_ECX;
  uint uVar6;
  uint uVar7;
  uint local_10;
  uint local_8;
  
  uVar2 = *(uint *)(in_ECX + 0xc);
  iVar3 = FUN_10085814(0x74);
  if (iVar3 == 0) {
    iVar3 = 0;
  }
  else {
    iVar3 = FUN_10085379();
  }
  if (iVar3 == 0) {
    iVar4 = -0x7ff8fff2;
  }
  else {
    iVar4 = FUN_1008585f(0x10000004,4,4,0);
    if (-1 < iVar4) {
      local_8 = 0xffffffff;
      uVar6 = 0;
      if (*(int *)(in_ECX + 8) != 0) {
        do {
          iVar4 = uVar6 * 4;
          if (*(int *)(*(int *)(iVar4 + *(int *)(in_ECX + 0x14)) + 4) == *(int *)(in_ECX + 0x84)) {
            *(uint *)(*(int *)(iVar3 + 8) +
                     *(int *)(*(int *)(iVar4 + *(int *)(in_ECX + 0x14)) + 0x10) * 4) = uVar6;
            *(undefined4 *)(*(int *)(iVar4 + *(int *)(in_ECX + 0x14)) + 4) =
                 *(undefined4 *)(in_ECX + 0x88);
            *(undefined4 *)(*(int *)(iVar4 + *(int *)(in_ECX + 0x14)) + 0xc) = 0xffffffff;
            local_8 = *(undefined4 *)(*(int *)(iVar4 + *(int *)(in_ECX + 0x14)) + 0x6c);
          }
          uVar6 = uVar6 + 1;
        } while (uVar6 < *(uint *)(in_ECX + 8));
      }
      uVar6 = 0;
      do {
        uVar5 = FUN_10086139(*(undefined4 *)(in_ECX + 0x84),0,uVar6,0);
        *(undefined4 *)(*(int *)(iVar3 + 0x10) + uVar6 * 4) = uVar5;
        if (*(int *)(*(int *)(iVar3 + 0x10) + uVar6 * 4) == -1) {
          iVar4 = -0x7ff8fff2;
          goto LAB_100a7d21;
        }
        iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(*(int *)(iVar3 + 0x10) + uVar6 * 4) * 4)
        ;
        *(undefined4 *)(iVar4 + 0x3c) = 0;
        uVar6 = uVar6 + 1;
        *(uint *)(iVar4 + 0x6c) = local_8;
      } while (uVar6 < 4);
      iVar4 = FUN_10086026();
      if (-1 < iVar4) {
        local_10 = 0;
        if (uVar2 != 0) {
          do {
            iVar4 = *(int *)(*(int *)(in_ECX + 0x18) + local_10 * 4);
            if ((((iVar4 != 0) && (uVar6 = *(uint *)(iVar4 + 0xc), uVar6 != 0)) &&
                (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + **(int **)(iVar4 + 0x10) * 4) + 4) ==
                 *(int *)(in_ECX + 0x84))) && (local_8 = 0, uVar6 != 0)) {
              do {
                uVar7 = 0;
                do {
                  piVar1 = (int *)(*(int *)(iVar4 + 0x10) + local_8 * 4);
                  if (*piVar1 == *(int *)(uVar7 + *(int *)(iVar3 + 0x10))) {
                    *piVar1 = *(int *)(uVar7 + *(int *)(iVar3 + 8));
                  }
                  uVar7 = uVar7 + 4;
                } while (uVar7 < 0x10);
                local_8 = local_8 + 1;
              } while (local_8 < uVar6);
            }
            local_10 = local_10 + 1;
          } while (local_10 < uVar2);
        }
        return 0;
      }
    }
LAB_100a7d21:
    FUN_1006c418();
  }
  return iVar4;
}


