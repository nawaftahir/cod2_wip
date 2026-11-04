// 100aab2a size=1337 FUN_100aab2a

int FUN_100aab2a(void)

{
  byte bVar1;
  uint uVar2;
  uint uVar3;
  undefined4 *puVar4;
  void *pvVar5;
  int in_ECX;
  int iVar6;
  int iVar7;
  uint uVar8;
  int *piVar9;
  uint *puVar10;
  bool bVar11;
  int local_74 [6];
  int local_5c [6];
  uint local_44 [6];
  uint local_2c;
  uint local_28;
  uint local_24;
  uint local_20;
  int *local_1c;
  int local_18;
  undefined4 *local_14;
  uint local_10;
  undefined4 *local_c;
  uint local_8;
  
  local_14 = (undefined4 *)0x0;
  local_c = (undefined4 *)0x0;
  iVar7 = 6;
  piVar9 = local_5c;
  for (iVar6 = iVar7; iVar6 != 0; iVar6 = iVar6 + -1) {
    *piVar9 = 0;
    piVar9 = piVar9 + 1;
  }
  piVar9 = local_74;
  for (iVar6 = iVar7; iVar6 != 0; iVar6 = iVar6 + -1) {
    *piVar9 = 0;
    piVar9 = piVar9 + 1;
  }
  puVar10 = local_44;
  for (iVar6 = iVar7; iVar6 != 0; iVar6 = iVar6 + -1) {
    *puVar10 = 0;
    puVar10 = puVar10 + 1;
  }
  puVar4 = (undefined4 *)(in_ECX + 0x40c);
  for (iVar6 = iVar7; iVar6 != 0; iVar6 = iVar6 + -1) {
    *puVar4 = 0xffffffff;
    puVar4 = puVar4 + 1;
  }
  puVar4 = (undefined4 *)(in_ECX + 0x424);
  for (; iVar7 != 0; iVar7 = iVar7 + -1) {
    *puVar4 = 0xffffffff;
    puVar4 = puVar4 + 1;
  }
  local_18 = 1;
  local_20 = 0;
  local_8 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar10 = *(uint **)(*(int *)(in_ECX + 0x18) + local_8 * 4);
      uVar3 = *puVar10;
      uVar8 = uVar3 & 0xfff00000;
      puVar10[9] = 0;
      if ((((uVar8 == 0x60000000) || (uVar8 == 0x60500000)) || (uVar8 == 0x60a00000)) ||
         (uVar8 == 0x60f00000)) {
LAB_100aad60:
        if (uVar8 == 0x11000000) {
LAB_100aad68:
          iVar7 = *(int *)puVar10[2];
        }
        else {
          iVar7 = *(int *)(puVar10[2] + (uVar3 & 0xfffff) * 4);
        }
        iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + iVar7 * 4);
        if ((*(int *)(iVar7 + 4) == *(int *)(in_ECX + 0x80)) && (*(int *)(iVar7 + 0x3c) == 0)) {
          if (*(char *)(iVar7 + 0x6c) != '\x03') goto LAB_100ab037;
          if ((local_5c[*(byte *)(iVar7 + 0x6d)] != 0) &&
             ((*(uint *)(in_ECX + 200) & 0xffff) != 0x104)) {
            local_18 = 0;
          }
          local_5c[*(byte *)(iVar7 + 0x6d)] = 1;
        }
        else {
          local_18 = 0;
        }
      }
      else {
        if (uVar8 == 0x11000000) goto LAB_100aad68;
        if ((uVar8 == 0x72c00000) || (uVar8 == 0x72d00000)) goto LAB_100aad60;
        uVar8 = uVar3 & 0xfffff;
        local_28 = uVar8;
        if ((uVar8 != 0) && (uVar3 != 0)) {
          local_10 = 0;
          if (puVar10[1] != 0) {
            local_2c = puVar10[1];
            local_1c = (int *)puVar10[2];
            do {
              iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + *local_1c * 4);
              if ((*(int *)(iVar7 + 4) == *(int *)(in_ECX + 0x80)) &&
                 (bVar1 = *(byte *)(iVar7 + 0x6d), *(char *)(iVar7 + 0x6c) == '\x03')) {
                if ((local_5c[bVar1] != 0) &&
                   (((*(uint *)(in_ECX + 200) & 0xffff) != 0x104 && (local_44[bVar1] == 0)))) {
                  local_18 = 0;
                }
                local_5c[bVar1] = 1;
                uVar3 = local_10 + uVar8;
                bVar11 = local_10 < uVar3;
                local_74[bVar1] = 1;
                uVar2 = local_28;
                if (bVar11) {
                  local_24 = uVar3 - local_10;
                  uVar3 = local_44[bVar1];
                  piVar9 = local_1c;
                  do {
                    uVar8 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar9 * 4) + 0x10) + 1;
                    if (uVar3 < uVar8) {
                      uVar3 = uVar8;
                    }
                    piVar9 = piVar9 + 1;
                    local_24 = local_24 - 1;
                  } while (local_24 != 0);
                  local_44[bVar1] = uVar3;
                  uVar8 = uVar2;
                }
              }
              local_10 = local_10 + uVar8;
              local_1c = local_1c + uVar8;
            } while (local_10 < local_2c);
          }
          local_20 = local_20 + 1;
        }
      }
      local_8 = local_8 + 1;
    } while (local_8 < *(uint *)(in_ECX + 0xc));
    if (0x10 < local_20) {
      local_18 = 0;
    }
  }
  uVar3 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar7 = uVar3 * 4;
      uVar3 = uVar3 + 1;
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar7) + 0x40) = 0;
    } while (uVar3 < *(uint *)(in_ECX + 8));
  }
  uVar3 = *(uint *)(in_ECX + 0xc);
  local_2c = uVar3;
  if (local_18 == 0) {
    pvVar5 = operator_new(0x800);
    *(void **)(in_ECX + 0x22c) = pvVar5;
    if (pvVar5 == (void *)0x0) {
      return -0x7ff8fff2;
    }
    pvVar5 = operator_new(0x800);
    *(void **)(in_ECX + 0x230) = pvVar5;
    if (pvVar5 == (void *)0x0) {
      return -0x7ff8fff2;
    }
    local_14 = operator_new(0x800);
    if (local_14 == (undefined4 *)0x0) {
      return -0x7ff8fff2;
    }
    local_c = operator_new(0x800);
    puVar4 = *(undefined4 **)(in_ECX + 0x22c);
    for (iVar7 = 0x200; iVar7 != 0; iVar7 = iVar7 + -1) {
      *puVar4 = 0;
      puVar4 = puVar4 + 1;
    }
    puVar4 = *(undefined4 **)(in_ECX + 0x230);
    for (iVar7 = 0x200; iVar7 != 0; iVar7 = iVar7 + -1) {
      *puVar4 = 0;
      puVar4 = puVar4 + 1;
    }
    puVar4 = local_14;
    for (iVar7 = 0x200; iVar7 != 0; iVar7 = iVar7 + -1) {
      *puVar4 = 0;
      puVar4 = puVar4 + 1;
    }
    puVar4 = local_c;
    for (iVar7 = 0x200; iVar7 != 0; iVar7 = iVar7 + -1) {
      *puVar4 = 0;
      puVar4 = puVar4 + 1;
    }
    *(undefined4 *)(in_ECX + 0x220) = 0;
    *(undefined4 *)(in_ECX + 0x224) = 0;
    local_10 = 0;
    local_8 = 0;
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        if (0x1ff < local_8) {
LAB_100ab037:
          FUN_1008b0b5();
          return -0x7fffbffb;
        }
        puVar10 = *(uint **)(*(int *)(in_ECX + 0x18) + local_8 * 4);
        uVar3 = *puVar10 & 0xfff00000;
        if ((((uVar3 == 0x60000000) || (uVar3 == 0x60500000)) || (uVar3 == 0x60a00000)) ||
           (((uVar3 == 0x60f00000 || (uVar3 == 0x11000000)) ||
            ((uVar3 == 0x72d00000 || (uVar3 == 0x72c00000)))))) {
          local_24 = *puVar10 & 0xfffff;
          if (uVar3 == 0x11000000) {
            local_24 = 0;
          }
          piVar9 = (int *)(puVar10[2] + local_24 * 4);
          iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar9 * 4);
          if ((*(int *)(iVar7 + 4) == *(int *)(in_ECX + 0x88)) || (*(int *)(iVar7 + 0x3c) != 0)) {
            iVar7 = FUN_100aa1ac(piVar9,puVar10[1] - local_24,local_14,&local_10);
            if (iVar7 < 0) goto LAB_100ab006;
          }
          else if ((*(int *)(iVar7 + 4) == *(int *)(in_ECX + 0x80)) &&
                  ((*(char *)(iVar7 + 0x6c) != '\x03' ||
                   ((local_74[*(byte *)(iVar7 + 0x6d)] != 0 &&
                    ((*(uint *)(in_ECX + 200) & 0xffff) != 0x104)))))) {
            FUN_1008b0b5();
            iVar7 = -0x7fffbffb;
            goto LAB_100ab006;
          }
        }
        local_8 = local_8 + 1;
      } while (local_8 < *(uint *)(in_ECX + 0xc));
    }
    uVar3 = 0;
    if (local_10 != 0) {
      puVar4 = local_14;
      do {
        *(undefined4 *)(((int)local_c - (int)local_14) + (int)puVar4) = *puVar4;
        *puVar4 = 0;
        uVar3 = uVar3 + 1;
        puVar4 = puVar4 + 1;
      } while (uVar3 < local_10);
    }
    iVar7 = FUN_100aa38c(*(undefined4 *)(in_ECX + 0x230),in_ECX + 0x224,
                         *(undefined4 *)(in_ECX + 0x18),local_2c,0,0);
    if (iVar7 < 0) goto LAB_100ab006;
    uVar3 = 0;
    if (local_10 != 0) {
      do {
        *(undefined4 *)(local_c[uVar3] + 0x24) = 0;
        uVar3 = uVar3 + 1;
      } while (uVar3 < local_10);
    }
    iVar7 = FUN_100aa38c(*(undefined4 *)(in_ECX + 0x22c),in_ECX + 0x220,local_c,local_10,
                         *(undefined4 *)(in_ECX + 0x230),*(undefined4 *)(in_ECX + 0x4c));
    if (iVar7 < 0) goto LAB_100ab006;
  }
  else {
    *(undefined4 *)(in_ECX + 0x22c) = 0;
    puVar4 = operator_new(0x800);
    *(undefined4 **)(in_ECX + 0x230) = puVar4;
    if (puVar4 == (undefined4 *)0x0) {
      return -0x7ff8fff2;
    }
    for (iVar7 = 0x200; iVar7 != 0; iVar7 = iVar7 + -1) {
      *puVar4 = 0;
      puVar4 = puVar4 + 1;
    }
    iVar7 = FUN_100aa38c(*(undefined4 *)(in_ECX + 0x230),in_ECX + 0x224,
                         *(undefined4 *)(in_ECX + 0x18),uVar3,0,0);
    if (iVar7 < 0) {
      return iVar7;
    }
  }
  iVar7 = 0;
  uVar3 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + uVar3 * 4);
      if (*(int *)(iVar6 + 0x40) == 1) {
        *(undefined4 *)(iVar6 + 4) = *(undefined4 *)(in_ECX + 0x74);
      }
      uVar3 = uVar3 + 1;
    } while (uVar3 < *(uint *)(in_ECX + 8));
  }
LAB_100ab006:
  if (local_14 != (undefined4 *)0x0) {
    _free(local_14);
  }
  if (local_c != (undefined4 *)0x0) {
    _free(local_c);
    return iVar7;
  }
  return iVar7;
}


