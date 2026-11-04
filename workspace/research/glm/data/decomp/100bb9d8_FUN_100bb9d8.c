// 100bb9d8 size=1532 FUN_100bb9d8

uint FUN_100bb9d8(int *param_1,undefined4 *param_2,int *param_3)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int in_ECX;
  uint uVar4;
  uint uVar5;
  int *piVar6;
  uint *puVar7;
  undefined4 *puVar8;
  undefined4 *puVar9;
  int *piVar10;
  uint *puVar11;
  undefined4 local_128 [16];
  int local_e8 [4];
  uint local_d8 [4];
  int aiStack_c8 [4];
  uint auStack_b8 [28];
  undefined4 local_48;
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  int local_38;
  int local_34;
  uint local_30;
  int local_2c;
  uint local_28;
  int local_24;
  uint local_20;
  int local_1c;
  uint local_18;
  uint local_14;
  int local_10;
  uint local_c;
  uint local_8;
  
  uVar4 = **(uint **)(in_ECX + 0x100) & 0xfffff;
  local_10 = 0;
  local_38 = 0;
  local_48 = 0;
  local_44 = 1;
  local_40 = 2;
  local_3c = 3;
  if ((**(uint **)(in_ECX + 0x100) & 0xfff00000) != 0x30000000) {
    return 1;
  }
  local_1c = 0;
  local_28 = 0;
  local_24 = 0;
  local_2c = 0;
  local_c = 0;
  if (uVar4 == 0) {
LAB_100bbc72:
    uVar5 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),&DAT_101188f8,local_128,&local_38,local_e8,
                         &local_48,uVar4,param_1 == (int *)0x0);
    if (uVar5 != 0) {
      return uVar5;
    }
    iVar2 = 0;
    local_1c = 0;
    local_c = 0;
LAB_100bbcb7:
    local_8 = 0;
LAB_100bbcbb:
    local_30 = 0;
    if (uVar4 != 0) {
      iVar1 = *(int *)(in_ECX + 0x14);
      do {
        local_24 = local_e8[local_c * 4 + local_30];
        local_18 = local_d8[local_30 + local_c * -4];
        local_28 = auStack_b8[local_30 - local_8];
        iVar2 = aiStack_c8[local_8 + local_30];
        local_14 = *(uint *)(iVar1 + local_28 * 4);
        local_20 = *(uint *)(*(int *)(in_ECX + 0x10) +
                            *(int *)(*(int *)(iVar1 + local_18 * 4) + 4) * 4);
        local_34 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(local_14 + 4) * 4);
        local_2c = *(int *)(*(int *)(iVar1 + local_24 * 4) + 0x38);
        if ((((local_2c == iVar2) ||
             (iVar3 = *(int *)(*(int *)(iVar1 + iVar2 * 4) + 0x38), iVar3 == local_24)) ||
            ((local_2c != -1 && (local_2c == iVar3)))) &&
           (((*(uint *)(*(int *)(iVar1 + local_24 * 4) + 0x3c) ^ 0x80000) ==
             *(uint *)(*(int *)(iVar1 + iVar2 * 4) + 0x3c) && (local_18 == local_28)))) {
          iVar2 = 1;
LAB_100bbdd9:
          iVar3 = 0;
        }
        else {
          if (local_24 != iVar2) {
LAB_100bbdd7:
            iVar2 = 0;
            goto LAB_100bbdd9;
          }
          iVar2 = *(int *)(iVar1 + local_18 * 4);
          uVar5 = *(uint *)(iVar2 + 0x38);
          if (((((uVar5 != local_28) && (*(uint *)(local_14 + 0x38) != local_18)) &&
               ((uVar5 == 0xffffffff || (uVar5 != *(uint *)(local_14 + 0x38))))) ||
              ((*(uint *)(iVar2 + 0x3c) ^ 0x80000) != *(uint *)(local_14 + 0x3c))) &&
             ((((*(uint *)(local_20 + 4) & 0x100) == 0 || ((*(uint *)(local_34 + 4) & 0x100) == 0))
              || (*(double *)(local_14 + 0x20) != -*(double *)(iVar2 + 0x20))))) goto LAB_100bbdd7;
          iVar3 = 1;
          iVar2 = iVar3;
        }
        if (local_30 == 0) {
          local_1c = iVar3;
        }
        else if (local_1c != iVar3) {
          iVar2 = 0;
        }
        if (iVar2 == 0) goto LAB_100bbe02;
        local_30 = local_30 + 1;
      } while (local_30 < uVar4);
    }
    if (iVar2 == 0) goto LAB_100bbe02;
    iVar2 = FUN_10085814(0x74);
    if (iVar2 == 0) {
      local_10 = 0;
    }
    else {
      local_10 = FUN_10085379();
    }
    if (local_10 == 0) {
      return 0x8007000e;
    }
    if (local_1c == 0) {
      if (local_c == 0) goto LAB_100bbf97;
LAB_100bbfc5:
      if (local_c == 1) goto LAB_100bbe7e;
    }
    else {
      if (local_c == 1) {
LAB_100bbf97:
        local_8 = FUN_1008585f(uVar4 | 0x70b00000,uVar4 * 2,uVar4,0);
        if ((int)local_8 < 0) goto LAB_100bbe24;
        if (local_1c == 0) goto LAB_100bbfc5;
      }
      if (local_c == 0) {
LAB_100bbe7e:
        local_8 = FUN_1008585f(uVar4 | 0x70c00000,uVar4 * 2,uVar4,0);
        if ((int)local_8 < 0) goto LAB_100bbe24;
      }
    }
    local_8 = FUN_100853b0(*(undefined4 *)(in_ECX + 0x100));
    if (-1 < (int)local_8) {
      local_14 = uVar4 * 4;
      puVar8 = *(undefined4 **)(*(int *)(in_ECX + 0x100) + 0x10);
      puVar9 = *(undefined4 **)(local_10 + 0x10);
      for (uVar5 = uVar4; uVar5 != 0; uVar5 = uVar5 - 1) {
        *puVar9 = *puVar8;
        puVar8 = puVar8 + 1;
        puVar9 = puVar9 + 1;
      }
      for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
        *(undefined1 *)puVar9 = *(undefined1 *)puVar8;
        puVar8 = (undefined4 *)((int)puVar8 + 1);
        puVar9 = (undefined4 *)((int)puVar9 + 1);
      }
      local_20 = local_c * 0x10;
      piVar6 = local_e8 + local_c * 4;
      piVar10 = *(int **)(local_10 + 8);
      for (uVar5 = uVar4; uVar5 != 0; uVar5 = uVar5 - 1) {
        *piVar10 = *piVar6;
        piVar6 = piVar6 + 1;
        piVar10 = piVar10 + 1;
      }
      for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
        *(char *)piVar10 = (char)*piVar6;
        piVar6 = (int *)((int)piVar6 + 1);
        piVar10 = (int *)((int)piVar10 + 1);
      }
      puVar7 = local_d8 + local_c * -4;
      puVar11 = (uint *)(*(int *)(local_10 + 8) + uVar4 * 4);
      for (uVar5 = uVar4; uVar5 != 0; uVar5 = uVar5 - 1) {
        *puVar11 = *puVar7;
        puVar7 = puVar7 + 1;
        puVar11 = puVar11 + 1;
      }
      for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
        *(char *)puVar11 = (char)*puVar7;
        puVar7 = (uint *)((int)puVar7 + 1);
        puVar11 = (uint *)((int)puVar11 + 1);
      }
      iVar2 = *(int *)(in_ECX + 0x14);
      local_20 = *(uint *)(iVar2 + (*(int **)(local_10 + 8))[uVar4] * 4);
      iVar1 = *(int *)(iVar2 + **(int **)(local_10 + 8) * 4);
      iVar2 = *(int *)(iVar2 + **(int **)(local_10 + 0x10) * 4);
      if (((*(int *)(iVar2 + 4) == *(int *)(iVar1 + 4)) &&
          (*(int *)(iVar2 + 0xc) == *(int *)(iVar1 + 0xc))) ||
         ((*(int *)(iVar2 + 4) == *(int *)(local_20 + 4) &&
          (*(int *)(iVar2 + 0xc) == *(int *)(local_20 + 0xc))))) goto LAB_100bbe1d;
      if (param_1 != (int *)0x0) {
        *param_1 = local_10;
        if (local_38 != 0) {
          puVar8 = local_128;
          for (iVar2 = local_38; iVar2 != 0; iVar2 = iVar2 + -1) {
            *param_2 = *puVar8;
            puVar8 = puVar8 + 1;
            param_2 = param_2 + 1;
          }
        }
        *param_3 = local_38;
        return local_8;
      }
      goto LAB_100bbc56;
    }
    goto LAB_100bbe24;
  }
  iVar2 = *(int *)(*(int *)(in_ECX + 0x100) + 8);
  local_14 = uVar4 << 2;
  local_20 = uVar4 << 3;
  local_18 = local_14;
  local_8 = local_20;
  do {
    iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar2 + local_18) * 4);
    local_34 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar2 + local_8) * 4);
    local_30 = *(uint *)(*(int *)(in_ECX + 0x10) + *(int *)(local_34 + 4) * 4);
    if (((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar1 + 4) * 4) + 5) & 1) == 0) ||
         (*(double *)(iVar1 + 0x20) != 0.0)) || (*(int *)(iVar1 + 8) != -1)) ||
       (iVar1 = *(int *)(*(int *)(in_ECX + 0x100) + 8),
       *(int *)(iVar1 + local_8) != *(int *)(iVar1 + local_c * 4))) {
      local_24 = 1;
    }
    else {
      local_1c = 1;
    }
    if ((((*(byte *)(local_30 + 5) & 1) == 0) || (*(double *)(local_34 + 0x20) != 0.0)) ||
       ((*(int *)(local_34 + 8) != -1 ||
        (iVar1 = *(int *)(*(int *)(in_ECX + 0x100) + 8),
        *(int *)(iVar1 + local_18) != *(int *)(iVar1 + local_c * 4))))) {
      local_2c = 1;
    }
    else {
      local_28 = 1;
    }
    local_c = local_c + 1;
    local_8 = local_8 + 4;
    local_18 = local_18 + 4;
  } while (local_c < uVar4);
  if ((local_1c == 0) || (local_24 != 0)) {
    if ((local_28 == 0) || (local_2c != 0)) goto LAB_100bbc72;
    if (param_1 != (int *)0x0) {
      return 1;
    }
    iVar2 = FUN_10085814(0x74);
    if (iVar2 == 0) {
      local_10 = 0;
    }
    else {
      local_10 = FUN_10085379();
    }
    if (local_10 == 0) {
      return 0x8007000e;
    }
    uVar5 = uVar4 | 0x70c00000;
  }
  else {
    iVar2 = FUN_10085814(0x74);
    if (iVar2 == 0) {
      local_10 = 0;
    }
    else {
      local_10 = FUN_10085379();
    }
    if (local_10 == 0) {
      return 0x8007000e;
    }
    uVar5 = uVar4 | 0x70b00000;
  }
  local_8 = FUN_1008585f(uVar5,uVar4 * 2,uVar4,0);
  if ((-1 < (int)local_8) &&
     (local_8 = FUN_100853b0(*(undefined4 *)(in_ECX + 0x100)), -1 < (int)local_8)) {
    puVar8 = *(undefined4 **)(*(int *)(in_ECX + 0x100) + 0x10);
    puVar9 = *(undefined4 **)(local_10 + 0x10);
    for (uVar4 = local_14 >> 2; uVar4 != 0; uVar4 = uVar4 - 1) {
      *puVar9 = *puVar8;
      puVar8 = puVar8 + 1;
      puVar9 = puVar9 + 1;
    }
    for (uVar4 = local_14 & 3; uVar4 != 0; uVar4 = uVar4 - 1) {
      *(undefined1 *)puVar9 = *(undefined1 *)puVar8;
      puVar8 = (undefined4 *)((int)puVar8 + 1);
      puVar9 = (undefined4 *)((int)puVar9 + 1);
    }
    puVar8 = *(undefined4 **)(*(int *)(in_ECX + 0x100) + 8);
    puVar9 = *(undefined4 **)(local_10 + 8);
    for (uVar4 = local_14 >> 2; uVar4 != 0; uVar4 = uVar4 - 1) {
      *puVar9 = *puVar8;
      puVar8 = puVar8 + 1;
      puVar9 = puVar9 + 1;
    }
    for (uVar4 = local_14 & 3; uVar4 != 0; uVar4 = uVar4 - 1) {
      *(undefined1 *)puVar9 = *(undefined1 *)puVar8;
      puVar8 = (undefined4 *)((int)puVar8 + 1);
      puVar9 = (undefined4 *)((int)puVar9 + 1);
    }
    uVar4 = local_20;
    if (local_1c != 0) {
      uVar4 = local_14;
    }
    puVar8 = (undefined4 *)(*(int *)(*(int *)(in_ECX + 0x100) + 8) + uVar4);
    puVar9 = (undefined4 *)(*(int *)(local_10 + 8) + local_14);
    for (uVar5 = local_14 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
      *puVar9 = *puVar8;
      puVar8 = puVar8 + 1;
      puVar9 = puVar9 + 1;
    }
    for (uVar4 = local_14 & 3; uVar4 != 0; uVar4 = uVar4 - 1) {
      *(undefined1 *)puVar9 = *(undefined1 *)puVar8;
      puVar8 = (undefined4 *)((int)puVar8 + 1);
      puVar9 = (undefined4 *)((int)puVar9 + 1);
    }
LAB_100bbc56:
    local_8 = FUN_10085abe(local_10);
  }
LAB_100bbe24:
  if (local_10 != 0) {
    FUN_1006c418(1);
  }
  return local_8;
LAB_100bbe02:
  local_8 = local_8 + 4;
  if (7 < local_8) goto code_r0x100bbe10;
  goto LAB_100bbcbb;
code_r0x100bbe10:
  local_c = local_c + 1;
  if (1 < local_c) goto LAB_100bbe1d;
  goto LAB_100bbcb7;
LAB_100bbe1d:
  local_8 = 1;
  goto LAB_100bbe24;
}


