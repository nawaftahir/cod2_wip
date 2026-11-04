// 100b2d68 size=990 FUN_100b2d68

int FUN_100b2d68(void)

{
  uint *puVar1;
  uint uVar2;
  undefined *puVar3;
  int in_ECX;
  uint uVar4;
  int iVar5;
  
  uVar4 = 0;
  if ((*(byte *)(in_ECX + 0xcc) & 4) != 0) {
    FUN_1008af0b();
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        *(uint *)(in_ECX + 0xfc) = uVar4;
        puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar4 * 4);
        *(uint **)(in_ECX + 0x100) = puVar1;
        if ((*puVar1 & 0xfff00000) == 0x10000000) {
          FUN_100bb955();
        }
        uVar4 = uVar4 + 1;
      } while (uVar4 < *(uint *)(in_ECX + 0xc));
    }
    FUN_1008af24();
    if ((*(byte *)(in_ECX + 0xcc) & 4) != 0) goto LAB_100b30c8;
  }
  uVar4 = 0;
  iVar5 = in_ECX;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar4;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar4 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      uVar2 = *puVar1 & 0xfff00000;
      if (uVar2 == 0x10100000) {
        iVar5 = FUN_100c6123(1);
LAB_100b2e27:
        if (iVar5 < 0) {
          return iVar5;
        }
      }
      else {
        if (((uVar2 == 0x20000000) || (uVar2 == 0x20100000)) || (uVar2 == 0x30000000)) {
          iVar5 = FUN_100bc34f();
          FUN_100ba843();
          goto LAB_100b2e27;
        }
        iVar5 = 1;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < *(uint *)(in_ECX + 0xc));
  }
  uVar4 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar4;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar4 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      if ((*puVar1 & 0xfff00000) == 0x30000000) {
        if (iVar5 < 0) {
          return iVar5;
        }
        iVar5 = FUN_100bb9d8(0,0,0);
        if (iVar5 < 0) {
          return iVar5;
        }
        iVar5 = FUN_100bbff0(0,0,0);
        if (iVar5 < 0) {
          return iVar5;
        }
      }
      else {
        iVar5 = 1;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < *(uint *)(in_ECX + 0xc));
  }
  iVar5 = FUN_1008bec4();
  if (iVar5 < 0) {
    return iVar5;
  }
  FUN_100ba843();
  uVar4 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar4;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar4 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      uVar2 = *puVar1 & 0xfff00000;
      if ((uVar2 == 0x20000000) || (uVar2 == 0x70b00000)) {
        iVar5 = FUN_100bc34f();
        FUN_100ba843();
        if (iVar5 < 0) {
          return iVar5;
        }
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < *(uint *)(in_ECX + 0xc));
  }
  uVar4 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar4;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar4 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      puVar3 = (undefined *)(*puVar1 & 0xfff00000);
      if (puVar3 == &DAT_10500000) {
        iVar5 = FUN_100bb4cc();
LAB_100b2f82:
        if (iVar5 < 0) {
          return iVar5;
        }
      }
      else {
        if (puVar3 == (undefined *)0x10f00000) {
          iVar5 = FUN_100be86c();
          goto LAB_100b2f82;
        }
        if (puVar3 == (undefined *)0x20400000) {
          iVar5 = FUN_100c0cef();
          if (iVar5 != 0) {
            iVar5 = FUN_100c61dd(1);
            goto LAB_100b2f82;
          }
        }
        else if ((puVar3 == (undefined *)0x30000000) && (iVar5 = FUN_100c136d(), iVar5 != 0)) {
          iVar5 = FUN_100c143f();
          goto LAB_100b2f82;
        }
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < *(uint *)(in_ECX + 0xc));
  }
  iVar5 = FUN_1008bec4();
  if (iVar5 < 0) {
    return iVar5;
  }
  FUN_100ba843();
  uVar4 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar4;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar4 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      uVar2 = *puVar1 & 0xfff00000;
      if (uVar2 == 0x20500000) {
        iVar5 = FUN_100c06ec();
LAB_100b3015:
        if (iVar5 < 0) {
          return iVar5;
        }
      }
      else {
        if (uVar2 == 0x50000000) {
          iVar5 = FUN_100c0faf();
          goto LAB_100b3015;
        }
        if (uVar2 == 0x70300000) {
          iVar5 = FUN_100c19e8(0);
          goto LAB_100b3015;
        }
        if ((uVar2 == 0x73500000) || (uVar2 == 0x73600000)) {
          iVar5 = FUN_100bebad();
          goto LAB_100b3015;
        }
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < *(uint *)(in_ECX + 0xc));
  }
  FUN_100ba843();
  uVar4 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar4;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar4 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      if ((*puVar1 & 0xfff00000) == 0x70300000) {
        FUN_100c768d();
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < *(uint *)(in_ECX + 0xc));
  }
  FUN_100ba843();
  uVar4 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar4;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar4 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      uVar2 = *puVar1 & 0xfff00000;
      if (uVar2 == 0x70300000) {
        iVar5 = FUN_100c19e8(0);
LAB_100b30bc:
        if (iVar5 < 0) {
          return iVar5;
        }
      }
      else if ((((uVar2 == 0x73500000) || (uVar2 == 0x73600000)) || (uVar2 == 0x73700000)) ||
              (uVar2 == 0x73800000)) {
        iVar5 = FUN_100bee5d();
        goto LAB_100b30bc;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < *(uint *)(in_ECX + 0xc));
  }
LAB_100b30c8:
  uVar4 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar4;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar4 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      if (((*puVar1 & 0xfff00000) == 0x50300000) && (iVar5 = FUN_100baf09(), iVar5 < 0)) {
        return iVar5;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < *(uint *)(in_ECX + 0xc));
  }
  iVar5 = FUN_1008bec4();
  if (((-1 < iVar5) && (iVar5 = FUN_10094810(), -1 < iVar5)) &&
     ((iVar5 = FUN_10086eae(), -1 < iVar5 && (iVar5 = FUN_1008d525(), -1 < iVar5)))) {
    FUN_100ba843();
    iVar5 = 0;
  }
  return iVar5;
}


