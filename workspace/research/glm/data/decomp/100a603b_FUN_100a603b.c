// 100a603b size=1932 FUN_100a603b

int FUN_100a603b(void)

{
  uint *puVar1;
  int iVar2;
  uint uVar3;
  undefined *puVar4;
  uint uVar5;
  int in_ECX;
  uint local_c;
  uint local_8;
  
  iVar2 = in_ECX;
  if (((*(byte *)(in_ECX + 0x70) & 0x40) == 0) && (iVar2 = FUN_100a5b26(), iVar2 < 0)) {
    return iVar2;
  }
  local_8 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = local_8;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_8 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      if ((*puVar1 & 0xfff00000) == 0x11400000) {
        iVar2 = FUN_100bf075();
        if (iVar2 < 0) {
          return iVar2;
        }
      }
      else {
        iVar2 = 1;
      }
      local_8 = local_8 + 1;
    } while (local_8 < *(uint *)(in_ECX + 0xc));
  }
  if ((*(byte *)(in_ECX + 0xcc) & 4) != 0) {
    FUN_1008af0b();
    local_8 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        *(uint *)(in_ECX + 0xfc) = local_8;
        puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_8 * 4);
        *(uint **)(in_ECX + 0x100) = puVar1;
        if ((*puVar1 & 0xfff00000) == 0x10000000) {
          FUN_100bb955();
        }
        local_8 = local_8 + 1;
      } while (local_8 < *(uint *)(in_ECX + 0xc));
    }
    FUN_1008af24();
    if ((*(byte *)(in_ECX + 0xcc) & 4) != 0) goto LAB_100a6547;
  }
  local_8 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = local_8;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_8 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      uVar3 = *puVar1 & 0xfff00000;
      if (uVar3 == 0x10100000) {
        iVar2 = FUN_100c6123(1);
LAB_100a616d:
        if (iVar2 < 0) {
          return iVar2;
        }
      }
      else {
        if (((uVar3 == 0x20000000) || (uVar3 == 0x20100000)) || (uVar3 == 0x30000000)) {
          iVar2 = FUN_100bc34f();
          FUN_100ba843();
          goto LAB_100a616d;
        }
        iVar2 = 1;
      }
      local_8 = local_8 + 1;
    } while (local_8 < *(uint *)(in_ECX + 0xc));
  }
  if (((*(byte *)(in_ECX + 0x6c) & 0x80) != 0) && ((*(byte *)(in_ECX + 0x71) & 1) != 0)) {
    local_8 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        *(uint *)(in_ECX + 0xfc) = local_8;
        puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_8 * 4);
        *(uint **)(in_ECX + 0x100) = puVar1;
        if ((*puVar1 & 0xfff00000) == 0x30000000) {
          if (iVar2 < 0) {
            return iVar2;
          }
          iVar2 = FUN_100bb9d8(0,0,0);
          if (iVar2 < 0) {
            return iVar2;
          }
          iVar2 = FUN_100bbff0(0,0,0);
          if (iVar2 < 0) {
            return iVar2;
          }
        }
        else {
          iVar2 = 1;
        }
        local_8 = local_8 + 1;
      } while (local_8 < *(uint *)(in_ECX + 0xc));
    }
    iVar2 = FUN_1008bec4();
    if (iVar2 < 0) {
      return iVar2;
    }
    FUN_100ba843();
    local_8 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        *(uint *)(in_ECX + 0xfc) = local_8;
        puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_8 * 4);
        *(uint **)(in_ECX + 0x100) = puVar1;
        uVar3 = *puVar1 & 0xfff00000;
        if (uVar3 == 0x20000000) {
LAB_100a6272:
          iVar2 = FUN_100bc34f();
          FUN_100ba843();
LAB_100a6282:
          if (iVar2 < 0) {
            return iVar2;
          }
        }
        else {
          if (uVar3 == 0x30000000) {
            iVar2 = FUN_100c136d();
            if (iVar2 < 0) {
              return iVar2;
            }
            iVar2 = FUN_100c143f();
            goto LAB_100a6282;
          }
          if (uVar3 == 0x70b00000) goto LAB_100a6272;
          iVar2 = 1;
        }
        local_8 = local_8 + 1;
      } while (local_8 < *(uint *)(in_ECX + 0xc));
    }
  }
  local_c = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = local_c;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      puVar4 = (undefined *)(*puVar1 & 0xfff00000);
      if (puVar4 == &DAT_10500000) {
        if ((*(uint *)(in_ECX + 200) & 0xffff) < 0x200) goto LAB_100a6345;
        iVar2 = FUN_100bb4cc();
      }
      else if (puVar4 == (undefined *)0x10f00000) {
        iVar2 = FUN_100be476();
      }
      else if (puVar4 == (undefined *)0x11400000) {
        iVar2 = FUN_100bf075();
      }
      else if (puVar4 == (undefined *)0x20100000) {
        if ((*(uint *)(in_ECX + 200) & 0xffff) < 0x200) goto LAB_100a6345;
        iVar2 = FUN_100c127a();
      }
      else if (puVar4 == (undefined *)0x20400000) {
        if ((*(byte *)(in_ECX + 0x6c) & 0x20) != 0) {
          iVar2 = FUN_100c0cef();
        }
        if (iVar2 == 1) {
          iVar2 = FUN_100c61dd(1);
        }
      }
      else {
LAB_100a6345:
        iVar2 = 1;
      }
      local_8 = 0;
      if (*(int *)(in_ECX + 0xc) != 0) {
        iVar2 = 1;
        do {
          *(uint *)(in_ECX + 0xfc) = local_8;
          puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_8 * 4);
          *(uint **)(in_ECX + 0x100) = puVar1;
          if ((*puVar1 & 0xfff00000) == 0x70000000) {
            FUN_100c6163();
          }
          local_8 = local_8 + 1;
        } while (local_8 < *(uint *)(in_ECX + 0xc));
      }
      if (iVar2 < 0) {
        return iVar2;
      }
      local_c = local_c + 1;
    } while (local_c < *(uint *)(in_ECX + 0xc));
  }
  iVar2 = FUN_1008bec4();
  if (iVar2 < 0) {
    return iVar2;
  }
  FUN_100ba843();
  local_8 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = local_8;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_8 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      uVar3 = *puVar1 & 0xfff00000;
      if (uVar3 == 0x20500000) {
        iVar2 = FUN_100c06ec();
LAB_100a6469:
        if (iVar2 < 0) {
          return iVar2;
        }
      }
      else {
        if (uVar3 == 0x50000000) {
          if ((*(byte *)(in_ECX + 0x6c) & 0x20) != 0) {
            iVar2 = FUN_100c0faf();
          }
          goto LAB_100a6469;
        }
        if (uVar3 == 0x70300000) {
          iVar2 = FUN_100c19e8(1);
          goto LAB_100a6469;
        }
        if ((uVar3 == 0x73500000) || (uVar3 == 0x73600000)) {
          iVar2 = FUN_100bebad();
          if (iVar2 < 0) {
            return iVar2;
          }
          iVar2 = FUN_100becfb();
          goto LAB_100a6469;
        }
        if ((uVar3 == 0x74600000) || (uVar3 == 0x74700000)) {
          iVar2 = FUN_100c0224();
          if (iVar2 < 0) {
            return iVar2;
          }
          iVar2 = FUN_100c0372();
          goto LAB_100a6469;
        }
        iVar2 = 1;
      }
      local_8 = local_8 + 1;
    } while (local_8 < *(uint *)(in_ECX + 0xc));
  }
  local_c = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = local_c;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      uVar3 = *puVar1 & 0xfff00000;
      if (uVar3 < 0x74400001) {
        if (uVar3 == 0x74400000) {
LAB_100a64e6:
          iVar2 = FUN_100c04d4();
        }
        else {
          if (((uVar3 != 0x73500000) && (uVar3 != 0x73600000)) &&
             ((uVar3 != 0x73700000 && (uVar3 != 0x73800000)))) goto LAB_100a64fa;
          iVar2 = FUN_100bee5d();
        }
        if (iVar2 < 0) {
          return iVar2;
        }
      }
      else if (((uVar3 == 0x74500000) || (uVar3 == 0x74600000)) || (uVar3 == 0x74700000))
      goto LAB_100a64e6;
LAB_100a64fa:
      local_c = local_c + 1;
    } while (local_c < *(uint *)(in_ECX + 0xc));
  }
  local_c = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = local_c;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      if (((*puVar1 & 0xfff00000) == 0x73700000) && (iVar2 = FUN_100beac6(), iVar2 < 0)) {
        return iVar2;
      }
      local_c = local_c + 1;
    } while (local_c < *(uint *)(in_ECX + 0xc));
  }
LAB_100a6547:
  FUN_100ba843();
  local_c = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = local_c;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      uVar3 = *puVar1 & 0xfff00000;
      if ((uVar3 == 0x74600000) || (uVar3 == 0x74700000)) {
        iVar2 = FUN_100c0224();
        if (iVar2 < 0) {
          return iVar2;
        }
        iVar2 = FUN_100c0372();
        if (iVar2 < 0) {
          return iVar2;
        }
      }
      local_c = local_c + 1;
    } while (local_c < *(uint *)(in_ECX + 0xc));
  }
  uVar3 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = uVar3;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar3 * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      uVar5 = *puVar1 & 0xfff00000;
      if ((((uVar5 == 0x74400000) || (uVar5 == 0x74500000)) || (uVar5 == 0x74600000)) ||
         (uVar5 == 0x74700000)) {
        FUN_100c04d4();
      }
      uVar3 = uVar3 + 1;
    } while (uVar3 < *(uint *)(in_ECX + 0xc));
  }
  local_c = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = local_c;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      if (((*puVar1 & 0xfff00000) == 0x20900000) && (iVar2 = FUN_100bfa06(), iVar2 < 0)) {
        return iVar2;
      }
      local_c = local_c + 1;
    } while (local_c < *(uint *)(in_ECX + 0xc));
  }
  FUN_100ba843();
  local_c = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = local_c;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      if (((*puVar1 & 0xfff00000) == 0x20900000) && (iVar2 = FUN_100bf52c(), iVar2 < 0)) {
        return iVar2;
      }
      local_c = local_c + 1;
    } while (local_c < *(uint *)(in_ECX + 0xc));
  }
  local_c = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = local_c;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      if (((*puVar1 & 0xfff00000) == 0x11400000) && (iVar2 = FUN_100baba8(), iVar2 < 0)) {
        return iVar2;
      }
      local_c = local_c + 1;
    } while (local_c < *(uint *)(in_ECX + 0xc));
  }
  local_c = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = local_c;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      if (((*puVar1 & 0xfff00000) == 0x70300000) && (iVar2 = FUN_100c19e8(0), iVar2 < 0)) {
        return iVar2;
      }
      local_c = local_c + 1;
    } while (local_c < *(uint *)(in_ECX + 0xc));
  }
  FUN_100ba843();
  local_c = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      *(uint *)(in_ECX + 0xfc) = local_c;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
      *(uint **)(in_ECX + 0x100) = puVar1;
      puVar4 = (undefined *)(*puVar1 & 0xfff00000);
      if ((((puVar4 == &DAT_10300000) || (puVar4 == &DAT_10500000)) || (puVar4 == &DAT_10600000)) ||
         ((puVar4 == &DAT_10700000 || (puVar4 == (undefined *)0x50000000)))) {
        iVar2 = FUN_100be188();
LAB_100a676a:
        if (iVar2 < 0) {
          return iVar2;
        }
      }
      else if (puVar4 == (undefined *)0x70300000) {
        iVar2 = FUN_100c768d();
        goto LAB_100a676a;
      }
      local_c = local_c + 1;
    } while (local_c < *(uint *)(in_ECX + 0xc));
  }
  FUN_100ba843();
  iVar2 = FUN_1008bec4();
  if (((-1 < iVar2) && (iVar2 = FUN_10094810(), -1 < iVar2)) &&
     ((iVar2 = FUN_10086eae(), -1 < iVar2 && (iVar2 = FUN_1008d525(), -1 < iVar2)))) {
    FUN_100ba843();
    iVar2 = 0;
  }
  return iVar2;
}


