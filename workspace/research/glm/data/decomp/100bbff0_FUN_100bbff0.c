// 100bbff0 size=863 FUN_100bbff0

int FUN_100bbff0(int *param_1,undefined4 *param_2,int *param_3)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  uint uVar5;
  int in_ECX;
  uint uVar6;
  uint uVar7;
  int *piVar8;
  undefined4 *puVar9;
  int *piVar10;
  undefined4 *puVar11;
  undefined4 local_138 [16];
  int local_f8 [4];
  int local_e8 [4];
  int local_d8 [4];
  int local_c8 [4];
  int local_b8 [24];
  undefined4 local_58;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  int local_48;
  int local_44;
  int *local_40;
  int *local_3c;
  int *local_38;
  int *local_34;
  int *local_30;
  int local_2c;
  int *local_28;
  int local_24;
  int *local_20;
  int *local_1c;
  uint local_18;
  int local_14;
  uint local_10;
  uint local_c;
  int local_8;
  
  uVar7 = **(uint **)(in_ECX + 0x100) & 0xfffff;
  local_2c = 0;
  local_58 = 0;
  local_8 = 0;
  local_24 = 0;
  local_54 = 1;
  local_50 = 2;
  local_4c = 3;
  local_14 = in_ECX;
  iVar4 = FUN_100b99af(*(uint **)(in_ECX + 0x100),&DAT_10118958,local_138,&local_2c,local_f8,
                       &local_58,uVar7,param_1 == (int *)0x0);
  if (iVar4 != 0) {
    local_24 = 1;
    iVar4 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),&DAT_101189d8,local_138,&local_2c,local_f8,
                         &local_58,uVar7,param_1 == (int *)0x0);
    if (iVar4 != 0) {
      return iVar4;
    }
  }
  local_c = 0;
  local_3c = local_e8;
  local_40 = local_d8;
LAB_100bc0b6:
  local_18 = 0;
  local_38 = local_c8;
  local_28 = local_b8;
LAB_100bc0cc:
  local_10 = 0;
  if (uVar7 != 0) {
    iVar4 = *(int *)(in_ECX + 0x14);
    local_34 = local_40;
    local_20 = local_28;
    local_1c = local_38;
    local_30 = local_3c;
    do {
      local_48 = *(int *)(iVar4 + local_f8[local_10] * 4);
      iVar1 = *(int *)(iVar4 + *local_30 * 4);
      local_44 = *(int *)(iVar4 + *local_1c * 4);
      if (((((*(int *)(iVar1 + 8) != -1) || (*(int *)(local_48 + 8) != -1)) ||
           (*(int *)(local_44 + 8) != -1)) ||
          ((iVar2 = *(int *)(in_ECX + 0x10),
           (*(byte *)(*(int *)(iVar2 + *(int *)(iVar1 + 4) * 4) + 5) & 1) == 0 ||
           ((*(byte *)(*(int *)(iVar2 + *(int *)(local_44 + 4) * 4) + 5) & 1) == 0)))) ||
         (((*(byte *)(*(int *)(iVar2 + *(int *)(local_48 + 4) * 4) + 5) & 1) == 0 ||
          ((9.999999747378752e-06 <
            ABS((*(double *)(local_44 + 0x20) - *(double *)(iVar1 + 0x20)) -
                *(double *)(local_48 + 0x20)) || (*local_34 != *local_20)))))) break;
      local_10 = local_10 + 1;
      local_30 = local_30 + 1;
      local_1c = local_1c + 1;
      local_20 = local_20 + 1;
      local_34 = local_34 + 1;
    } while (local_10 < uVar7);
  }
  if (local_10 != uVar7) goto code_r0x100bc19f;
  iVar4 = FUN_10085814(0x74);
  if (iVar4 == 0) {
    local_8 = 0;
  }
  else {
    local_8 = FUN_10085379();
  }
  if (local_8 == 0) {
    return -0x7ff8fff2;
  }
  if (local_24 == 0) {
    uVar5 = uVar7 | 0x70b00000;
  }
  else {
    if (param_1 != (int *)0x0) goto LAB_100bc1c8;
    uVar5 = uVar7 | 0x70c00000;
  }
  iVar4 = FUN_1008585f(uVar5,uVar7 * 2,uVar7,0);
  if ((-1 < iVar4) &&
     (iVar4 = FUN_100853b0(*(undefined4 *)(in_ECX + 0x100)), iVar1 = local_8, -1 < iVar4)) {
    uVar5 = uVar7 * 4;
    local_c = uVar5;
    puVar11 = *(undefined4 **)(*(int *)(in_ECX + 0x100) + 0x10);
    puVar9 = *(undefined4 **)(local_8 + 0x10);
    for (uVar6 = uVar7; uVar6 != 0; uVar6 = uVar6 - 1) {
      *puVar9 = *puVar11;
      puVar11 = puVar11 + 1;
      puVar9 = puVar9 + 1;
    }
    for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
      *(undefined1 *)puVar9 = *(undefined1 *)puVar11;
      puVar11 = (undefined4 *)((int)puVar11 + 1);
      puVar9 = (undefined4 *)((int)puVar9 + 1);
    }
    piVar8 = local_f8;
    piVar10 = *(int **)(local_8 + 8);
    for (uVar6 = uVar7; uVar6 != 0; uVar6 = uVar6 - 1) {
      *piVar10 = *piVar8;
      piVar8 = piVar8 + 1;
      piVar10 = piVar10 + 1;
    }
    for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
      *(char *)piVar10 = (char)*piVar8;
      piVar8 = (int *)((int)piVar8 + 1);
      piVar10 = (int *)((int)piVar10 + 1);
    }
    puVar11 = (undefined4 *)(*(int *)(local_8 + 8) + uVar5);
    if (local_24 == 0) {
      uVar5 = uVar7 * 8;
    }
    puVar9 = (undefined4 *)(*(int *)(*(int *)(local_14 + 0x100) + 8) + uVar5);
    for (uVar6 = uVar7; uVar6 != 0; uVar6 = uVar6 - 1) {
      *puVar11 = *puVar9;
      puVar9 = puVar9 + 1;
      puVar11 = puVar11 + 1;
    }
    for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
      *(undefined1 *)puVar11 = *(undefined1 *)puVar9;
      puVar9 = (undefined4 *)((int)puVar9 + 1);
      puVar11 = (undefined4 *)((int)puVar11 + 1);
    }
    iVar4 = *(int *)(local_14 + 0x14);
    iVar2 = *(int *)(iVar4 + (*(int **)(local_8 + 8))[uVar7] * 4);
    iVar3 = *(int *)(iVar4 + **(int **)(local_8 + 8) * 4);
    iVar4 = *(int *)(iVar4 + **(int **)(local_8 + 0x10) * 4);
    if (((*(int *)(iVar4 + 4) != *(int *)(iVar3 + 4)) ||
        (*(int *)(iVar4 + 0xc) != *(int *)(iVar3 + 0xc))) &&
       ((*(int *)(iVar4 + 4) != *(int *)(iVar2 + 4) ||
        (*(int *)(iVar4 + 0xc) != *(int *)(iVar2 + 0xc))))) {
      if (param_1 == (int *)0x0) {
        FUN_10085abe(local_8);
      }
      else {
        local_8 = 0;
        *param_1 = iVar1;
        if (local_2c != 0) {
          puVar11 = local_138;
          for (iVar4 = local_2c; iVar4 != 0; iVar4 = iVar4 + -1) {
            *param_2 = *puVar11;
            puVar11 = puVar11 + 1;
            param_2 = param_2 + 1;
          }
        }
        *param_3 = local_2c;
      }
      iVar4 = 0;
      goto LAB_100bc1cb;
    }
    goto LAB_100bc1c8;
  }
  goto LAB_100bc1cb;
code_r0x100bc19f:
  local_18 = local_18 + 1;
  local_28 = local_28 + -4;
  local_38 = local_38 + 4;
  if (1 < local_18) goto code_r0x100bc1b5;
  goto LAB_100bc0cc;
code_r0x100bc1b5:
  local_c = local_c + 1;
  local_40 = local_40 + -4;
  local_3c = local_3c + 4;
  if (1 < local_c) {
LAB_100bc1c8:
    iVar4 = 1;
LAB_100bc1cb:
    if (local_8 != 0) {
      FUN_1006c418(1);
    }
    return iVar4;
  }
  goto LAB_100bc0b6;
}


