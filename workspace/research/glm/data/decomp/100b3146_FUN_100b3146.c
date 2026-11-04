// 100b3146 size=401 FUN_100b3146

int FUN_100b3146(void)

{
  undefined4 *puVar1;
  uint *puVar2;
  int iVar3;
  uint uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  int in_ECX;
  undefined *puVar7;
  uint uVar8;
  int local_8;
  
  *(undefined4 *)(in_ECX + 0x220) = 0xffffffff;
  *(undefined4 *)(in_ECX + 0x224) = 0xffffffff;
  uVar8 = 0;
  local_8 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar1 = (undefined4 *)(*(int *)(in_ECX + 0x18) + uVar8 * 4);
      *(uint *)(in_ECX + 0xfc) = uVar8;
      *(undefined4 *)(in_ECX + 0x100) = *puVar1;
      *(uint *)(in_ECX + 0xfc) = uVar8;
      puVar2 = (uint *)*puVar1;
      *(uint **)(in_ECX + 0x100) = puVar2;
      uVar4 = *puVar2 & 0xfff00000;
      if (((uVar4 == 0x20300000) || (uVar4 == 0x20200000)) && (*(int *)(in_ECX + 0x220) == -1)) {
        uVar5 = FUN_100860e0(&DAT_1010e914,0x311,1,4);
        uVar6 = FUN_10086139(uVar5,0,0,0);
        *(undefined4 *)(in_ECX + 0x220) = uVar6;
        uVar5 = FUN_10086139(uVar5,0,1,0x3ff0000000000000);
        *(undefined4 *)(in_ECX + 0x224) = uVar5;
      }
      uVar8 = uVar8 + 1;
    } while (uVar8 < *(uint *)(in_ECX + 0xc));
  }
  FUN_100ba843();
  if (((*(byte *)(in_ECX + 0xcc) & 4) == 0) && (uVar8 = 0, *(int *)(in_ECX + 0xc) != 0)) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar8;
      puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar8 * 4);
      *(uint **)(in_ECX + 0x100) = puVar2;
      uVar4 = *puVar2;
      puVar7 = (undefined *)(uVar4 & 0xfff00000);
      if (((puVar7 == &DAT_10300000) || ((puVar7 == &DAT_10500000 || (puVar7 == &DAT_10600000)))) ||
         (puVar7 == &DAT_10700000)) {
LAB_100b3270:
        local_8 = FUN_100be188();
LAB_100b327a:
        if (local_8 < 0) {
          return local_8;
        }
      }
      else {
        if (puVar7 == (undefined *)0x50000000) {
          if (2 < (uVar4 & 0xfffff)) goto LAB_100b3270;
          goto LAB_100b327a;
        }
        local_8 = 1;
      }
      uVar8 = uVar8 + 1;
    } while (uVar8 < *(uint *)(in_ECX + 0xc));
  }
  FUN_100ba843();
  uVar8 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + uVar8 * 4);
      if ((((*(int *)(iVar3 + 0x54) == -1) &&
           ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar3 + 4) * 4) + 5) & 1) != 0))
          && (*(uint *)(in_ECX + 0x224) != uVar8)) && (*(uint *)(in_ECX + 0x220) != uVar8)) {
        *(undefined4 *)(iVar3 + 4) = *(undefined4 *)(in_ECX + 0x74);
      }
      uVar8 = uVar8 + 1;
    } while (uVar8 < *(uint *)(in_ECX + 8));
  }
  return 0;
}


