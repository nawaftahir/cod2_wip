// 10087b3a size=650 FUN_10087b3a

undefined4 FUN_10087b3a(int param_1,int *param_2,double *param_3)

{
  uint *puVar1;
  uint uVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined4 uVar7;
  int in_ECX;
  int *piVar8;
  uint uVar9;
  double local_24;
  int local_1c;
  undefined4 local_18;
  int iStack_14;
  undefined4 local_10;
  int iStack_c;
  int local_8;
  
  local_1c = *(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4);
  if (param_1 == *param_2) {
LAB_10087b59:
    local_8 = param_1;
    local_24 = 1.0;
    goto LAB_10087d8a;
  }
  local_8 = *(int *)(local_1c + 0x40);
  if (local_8 != -1) {
    local_24 = *(double *)(local_1c + 0x28);
    goto LAB_10087d8a;
  }
  if ((*(int *)(local_1c + 8) != -1) ||
     ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(local_1c + 4) * 4) + 4) & 2) == 0))
  goto LAB_10087b59;
  puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(local_1c + 0x48) * 4);
  uVar2 = puVar1[3];
  uVar3 = 0;
  if (uVar2 != 0) {
    piVar8 = (int *)puVar1[4];
    do {
      if (*piVar8 == param_1) break;
      uVar3 = uVar3 + 1;
      piVar8 = piVar8 + 1;
    } while (uVar3 < uVar2);
  }
  if (uVar3 != uVar2) {
    uVar9 = *puVar1 & 0xfff00000;
    if (uVar9 == 0x10000000) {
      local_8 = -1;
      iVar4 = FUN_10087b3a(*(undefined4 *)(puVar1[2] + uVar3 * 4),&local_8,&local_24);
      if (-1 < iVar4) goto LAB_10087d8a;
    }
    else if (uVar9 == 0x10100000) {
      local_8 = -1;
      iVar4 = FUN_10087b3a(*(undefined4 *)(puVar1[2] + uVar3 * 4),&local_8,&local_24);
      if (-1 < iVar4) {
        local_24 = -local_24;
        goto LAB_10087d8a;
      }
    }
    else if (uVar9 == 0x20400000) {
      iVar4 = *(int *)(puVar1[2] + uVar3 * 4);
      iVar6 = *(int *)(puVar1[2] + (uVar2 + uVar3) * 4);
      local_8 = -1;
      if (iVar4 != iVar6) {
        iVar5 = FUN_10087b3a(iVar4,&local_8,&local_10);
        if ((iVar5 < 0) || (iVar5 = FUN_10087b3a(iVar6,&local_8,&local_18), iVar5 < 0)) {
          local_8 = -1;
          iVar6 = FUN_10087b3a(iVar6,&local_8,&local_18);
          if ((iVar6 < 0) || (iVar4 = FUN_10087b3a(iVar4,&local_8,&local_10), iVar4 < 0))
          goto LAB_10087d81;
        }
        local_24 = (double)CONCAT44(iStack_14,local_18) + (double)CONCAT44(iStack_c,local_10);
        goto LAB_10087d8a;
      }
      iVar4 = FUN_10087b3a(iVar4,&local_8,&local_24);
      if (-1 < iVar4) {
        local_24 = local_24 + local_24;
        goto LAB_10087d8a;
      }
    }
    else if (uVar9 == 0x20500000) {
      iStack_c = *(int *)(puVar1[2] + uVar3 * 4);
      iStack_14 = *(int *)(puVar1[2] + (uVar2 + uVar3) * 4);
      if (iStack_c != iStack_14) {
        iVar6 = iStack_14 * 4;
        iVar4 = *(int *)(iVar6 + *(int *)(in_ECX + 0x14));
        if (((*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar4 + 4) * 4) + 4) & 0x100) !=
             0) && (*(int *)(iVar4 + 8) == -1)) {
          local_8 = -1;
          iVar4 = FUN_10087b3a(iStack_c,&local_8,&local_24);
          if (iVar4 < 0) goto LAB_10087d32;
          iVar4 = *(int *)(iVar6 + *(int *)(in_ECX + 0x14));
LAB_10087d76:
          local_24 = local_24 * *(double *)(iVar4 + 0x20);
          goto LAB_10087d8a;
        }
LAB_10087d32:
        iVar4 = *(int *)(iStack_c * 4 + *(int *)(in_ECX + 0x14));
        if (((*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar4 + 4) * 4) + 4) & 0x100) !=
             0) && (*(int *)(iVar4 + 8) == -1)) {
          local_8 = -1;
          iVar4 = iStack_14;
          iStack_14 = iStack_c * 4;
          iVar4 = FUN_10087b3a(iVar4,&local_8,&local_24);
          if (-1 < iVar4) {
            iVar4 = *(int *)(iStack_14 + *(int *)(in_ECX + 0x14));
            goto LAB_10087d76;
          }
        }
      }
    }
  }
LAB_10087d81:
  local_24 = 1.0;
  local_8 = param_1;
LAB_10087d8a:
  if ((*param_2 == -1) || (local_8 == *param_2)) {
    *(int *)(local_1c + 0x40) = local_8;
    *param_2 = local_8;
    *(double *)(local_1c + 0x28) = local_24;
    *param_3 = local_24;
    uVar7 = 0;
  }
  else {
    uVar7 = 0x80004005;
  }
  return uVar7;
}


