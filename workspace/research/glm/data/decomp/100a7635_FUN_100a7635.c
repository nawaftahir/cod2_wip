// 100a7635 size=506 FUN_100a7635

int FUN_100a7635(void)

{
  int iVar1;
  int iVar2;
  int in_ECX;
  uint uVar3;
  int iVar4;
  uint uVar5;
  undefined4 *puVar6;
  undefined4 *puVar7;
  bool bVar8;
  uint local_10;
  int *local_c;
  int local_8;
  
  if ((**(uint **)(in_ECX + 0x100) & 0xfff00000) == 0x10100000) {
    iVar1 = *(int *)(in_ECX + 0x14);
    uVar5 = **(uint **)(in_ECX + 0x100) & 0xfffff;
    bVar8 = (*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) +
                               *(int *)(*(int *)(iVar1 + *(int *)(*(uint **)(in_ECX + 0x100))[2] * 4
                                                ) + 4) * 4) + 4) & 0x200) != 0;
    if (((*(byte *)(in_ECX + 0x6e) & 2) != 0) && (uVar5 != 0)) {
      local_c = (int *)(*(uint **)(in_ECX + 0x100))[2];
      local_10 = uVar5;
      do {
        iVar2 = *(int *)(iVar1 + *local_c * 4);
        if ((*(uint *)(iVar2 + 0x3c) & 0x200) != 0) {
          bVar8 = true;
        }
        if (*(int *)(iVar2 + 0x38) != -1) {
          iVar2 = *(int *)(iVar1 + *(int *)(iVar2 + 0x38) * 4);
        }
        if ((*(uint *)(iVar2 + 0x3c) & 0x200) != 0) {
          bVar8 = true;
        }
        local_c = local_c + 1;
        local_10 = local_10 - 1;
      } while (local_10 != 0);
    }
    if (bVar8) {
      iVar1 = FUN_10085814();
      if (iVar1 == 0) {
        local_8 = 0;
      }
      else {
        local_8 = FUN_10085379();
      }
      if (local_8 == 0) {
        iVar1 = -0x7ff8fff2;
      }
      else {
        iVar1 = FUN_1008585f(uVar5 | 0x20500000,uVar5 * 2,uVar5,0);
        if ((-1 < iVar1) && (iVar1 = FUN_100853b0(), -1 < iVar1)) {
          iVar1 = FUN_100860e0(&DAT_1010e914,0x311,1,4);
          if ((iVar1 == -1) || (iVar1 = FUN_10086139(iVar1,0,0,0xbff0000000000000), iVar1 == -1)) {
            iVar1 = -0x7ff8fff2;
          }
          else {
            iVar2 = uVar5 << 2;
            puVar6 = *(undefined4 **)(*(int *)(in_ECX + 0x100) + 8);
            puVar7 = *(undefined4 **)(local_8 + 8);
            for (uVar3 = uVar5; uVar3 != 0; uVar3 = uVar3 - 1) {
              *puVar7 = *puVar6;
              puVar6 = puVar6 + 1;
              puVar7 = puVar7 + 1;
            }
            for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
              *(undefined1 *)puVar7 = *(undefined1 *)puVar6;
              puVar6 = (undefined4 *)((int)puVar6 + 1);
              puVar7 = (undefined4 *)((int)puVar7 + 1);
            }
            puVar6 = *(undefined4 **)(*(int *)(in_ECX + 0x100) + 0x10);
            puVar7 = *(undefined4 **)(local_8 + 0x10);
            for (uVar3 = uVar5; uVar3 != 0; uVar3 = uVar3 - 1) {
              *puVar7 = *puVar6;
              puVar6 = puVar6 + 1;
              puVar7 = puVar7 + 1;
            }
            for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
              *(undefined1 *)puVar7 = *(undefined1 *)puVar6;
              puVar6 = (undefined4 *)((int)puVar6 + 1);
              puVar7 = (undefined4 *)((int)puVar7 + 1);
            }
            for (; uVar5 != 0; uVar5 = uVar5 - 1) {
              *(int *)(iVar2 + *(int *)(local_8 + 8)) = iVar1;
              iVar2 = iVar2 + 4;
            }
            iVar1 = 0;
            if (*(int *)(*(int *)(in_ECX + 0x18) + *(int *)(in_ECX + 0xfc) * 4) != 0) {
              FUN_1006c418();
            }
            *(int *)(*(int *)(in_ECX + 0x18) + *(int *)(in_ECX + 0xfc) * 4) = local_8;
            local_8 = 0;
          }
        }
        if (local_8 != 0) {
          FUN_1006c418();
        }
      }
    }
    else {
      iVar1 = 0;
    }
  }
  else {
    iVar1 = 0;
  }
  return iVar1;
}


