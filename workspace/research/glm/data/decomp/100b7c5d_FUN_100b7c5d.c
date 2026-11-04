// 100b7c5d size=635 FUN_100b7c5d

int FUN_100b7c5d(void)

{
  uint *puVar1;
  bool bVar2;
  int iVar3;
  undefined *puVar4;
  int in_ECX;
  uint uVar5;
  uint uVar6;
  uint local_c;
  
  bVar2 = false;
  if ((*(int *)(in_ECX + 0x5c) != 0) &&
     (*(undefined4 *)(in_ECX + 0xfc) = 0, *(int *)(in_ECX + 0xc) != 0)) {
    do {
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(in_ECX + 0xfc) * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      if ((*puVar1 & 0xfff00000) == 0x20800000) {
        iVar3 = FUN_100bad10();
        if (iVar3 < 0) {
          return iVar3;
        }
        bVar2 = (bool)(bVar2 | iVar3 == 0);
      }
      *(int *)(in_ECX + 0xfc) = *(int *)(in_ECX + 0xfc) + 1;
    } while (*(uint *)(in_ECX + 0xfc) < *(uint *)(in_ECX + 0xc));
    if (bVar2) {
      FUN_100ba843();
    }
  }
  if ((*(byte *)(in_ECX + 0xcc) & 4) == 0) {
    uVar5 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        *(uint *)(in_ECX + 0xfc) = uVar5;
        *(undefined4 *)(in_ECX + 0x100) = *(undefined4 *)(*(int *)(in_ECX + 0x18) + uVar5 * 4);
        iVar3 = FUN_100b75db();
        if (iVar3 == 0) {
          FUN_100ba843();
        }
        uVar5 = uVar5 + 1;
      } while (uVar5 < *(uint *)(in_ECX + 0xc));
    }
    uVar5 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        *(uint *)(in_ECX + 0xfc) = uVar5;
        puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar5 * 4);
        *(uint **)(in_ECX + 0x100) = puVar1;
        if (((*puVar1 & 0xfff00000) == 0x50000000) && (iVar3 = FUN_100b65a7(), iVar3 < 0)) {
          return iVar3;
        }
        uVar5 = uVar5 + 1;
      } while (uVar5 < *(uint *)(in_ECX + 0xc));
    }
    FUN_100ba843();
    uVar5 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        *(uint *)(in_ECX + 0xfc) = uVar5;
        puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar5 * 4);
        *(uint **)(in_ECX + 0x100) = puVar1;
        puVar4 = (undefined *)(*puVar1 & 0xfff00000);
        if (((((puVar4 == &DAT_10300000) || (puVar4 == &DAT_10500000)) || (puVar4 == &DAT_10600000))
            || ((puVar4 == &DAT_10700000 || (puVar4 == (undefined *)0x50000000)))) &&
           (iVar3 = FUN_100be188(), iVar3 < 0)) {
          return iVar3;
        }
        uVar5 = uVar5 + 1;
      } while (uVar5 < *(uint *)(in_ECX + 0xc));
    }
  }
  if (*(int *)(in_ECX + 0x30) != 0) {
    local_c = 0;
    do {
      if (0xf < local_c) goto LAB_100b7e2e;
      uVar5 = *(uint *)(in_ECX + 0xc);
      uVar6 = 0;
      bVar2 = true;
      if (uVar5 != 0) {
        do {
          *(undefined4 *)(in_ECX + 0x100) = *(undefined4 *)(*(int *)(in_ECX + 0x18) + uVar6 * 4);
          iVar3 = FUN_100bb1c6();
          if (iVar3 < 0) {
            return iVar3;
          }
          if (iVar3 == 0) {
            bVar2 = false;
          }
          iVar3 = FUN_10086292(*(undefined4 *)(in_ECX + 0x100));
          if (iVar3 < 0) {
            return iVar3;
          }
          **(undefined4 **)(in_ECX + 0x100) = 0;
          uVar6 = uVar6 + 1;
        } while (uVar6 < uVar5);
      }
      iVar3 = FUN_10086eae();
      if (iVar3 < 0) {
        return iVar3;
      }
      local_c = local_c + 1;
    } while (!bVar2);
    if (0xf < local_c) {
LAB_100b7e2e:
      uVar5 = *(uint *)(in_ECX + 0xc);
      uVar6 = 0;
      bVar2 = true;
      if (uVar5 != 0) {
        do {
          *(undefined4 *)(in_ECX + 0x100) = *(undefined4 *)(*(int *)(in_ECX + 0x18) + uVar6 * 4);
          iVar3 = FUN_100bb1c6();
          if (iVar3 < 0) {
            return iVar3;
          }
          if (iVar3 == 0) {
            FUN_1008b0b5();
            bVar2 = false;
          }
          iVar3 = FUN_10086292(*(undefined4 *)(in_ECX + 0x100));
          if (iVar3 < 0) {
            return iVar3;
          }
          **(undefined4 **)(in_ECX + 0x100) = 0;
          uVar6 = uVar6 + 1;
        } while (uVar6 < uVar5);
      }
      iVar3 = FUN_10086eae();
      if (iVar3 < 0) {
        return iVar3;
      }
      if (!bVar2) {
        return -0x7fffbffb;
      }
    }
  }
  if (*(int *)(in_ECX + 0x60) != 0) {
    iVar3 = FUN_100c7816();
    if (iVar3 < 0) {
      return iVar3;
    }
    FUN_100ba843();
    iVar3 = FUN_1008d525();
    if (iVar3 < 0) {
      return iVar3;
    }
  }
  return 0;
}


