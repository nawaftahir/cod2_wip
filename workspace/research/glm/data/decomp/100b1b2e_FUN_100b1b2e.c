// 100b1b2e size=586 FUN_100b1b2e

int FUN_100b1b2e(void)

{
  int *piVar1;
  uint *puVar2;
  uint uVar3;
  int iVar4;
  int in_ECX;
  int iVar5;
  uint uVar6;
  int local_30 [11];
  
  local_30[8] = 0;
  if (*(int *)(in_ECX + 0x4c) == 4) {
    local_30[4] = 0;
    local_30[5] = 0;
    local_30[6] = 0;
    local_30[7] = 0;
    local_30[0] = 0;
    local_30[1] = 0;
    local_30[2] = 0;
    local_30[10] = 0;
    local_30[3] = 0;
    local_30[9] = 0;
    do {
      iVar4 = local_30[10];
      piVar1 = (int *)(*(int *)(in_ECX + 0x230) + local_30[9] * 4);
      puVar2 = (uint *)*piVar1;
      if ((puVar2 != (uint *)0x0) && (*puVar2 != 0)) {
        if ((*puVar2 & 0xfff00000) == 0x72100000) {
          iVar5 = *piVar1;
LAB_100b1bd3:
          local_30[local_30[9] + 4] = iVar5;
        }
        else {
          uVar6 = 0;
          if ((*puVar2 & 0xfff00000) != 0x11000000) {
            uVar6 = *puVar2 & 0xfffff;
          }
          iVar5 = *piVar1;
          if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar2[2] + uVar6 * 4) * 4) + 4)
              != *(int *)(in_ECX + 0x88)) goto LAB_100b1bd3;
          local_30[10] = local_30[10] + 1;
          local_30[iVar4] = iVar5;
        }
        *piVar1 = 0;
      }
      local_30[9] = local_30[9] + 1;
    } while ((uint)local_30[9] < *(uint *)(in_ECX + 0x4c));
    uVar6 = 0;
    if (*(int *)(in_ECX + 0x4c) != 0) {
      do {
        piVar1 = (int *)(*(int *)(in_ECX + 0x22c) + uVar6 * 4);
        if ((((uint *)*piVar1 != (uint *)0x0) && (uVar3 = *(uint *)*piVar1, uVar3 != 0)) &&
           ((uVar3 & 0xfff00000) != 0x72100000)) {
          if (local_30[uVar6 + 4] != 0) {
            iVar4 = -0x7fffbffb;
            goto LAB_100b1d45;
          }
          local_30[uVar6 + 4] = *piVar1;
          *piVar1 = 0;
        }
        uVar6 = uVar6 + 1;
      } while (uVar6 < *(uint *)(in_ECX + 0x4c));
    }
    if ((((*(uint *)(in_ECX + 200) & 0xffff) < 0x102) ||
        (iVar4 = FUN_100aefa6(local_30,local_30[10],local_30 + 4,1), -1 < iVar4)) &&
       ((iVar4 = FUN_100aefa6(local_30,local_30[10],local_30 + 4,2), -1 < iVar4 &&
        ((iVar4 = FUN_100aefa6(local_30,local_30[10],local_30 + 4,3), -1 < iVar4 &&
         (iVar4 = FUN_100aead2(local_30,local_30[10],local_30 + 4), -1 < iVar4)))))) {
      local_30[9] = 0;
      if (*(int *)(in_ECX + 0x4c) != 0) {
        do {
          if (local_30[local_30[9]] != 0) {
            iVar4 = -0x7fffbffb;
            FUN_1008b0b5();
            local_30[8] = 1;
          }
          local_30[9] = local_30[9] + 1;
        } while ((uint)local_30[9] < *(uint *)(in_ECX + 0x4c));
      }
      if (iVar4 != -0x7fffbffb) {
        uVar6 = 0;
        if (*(int *)(in_ECX + 0x4c) != 0) {
          do {
            *(int *)(*(int *)(in_ECX + 0x230) + uVar6 * 4) = local_30[uVar6 + 4];
            uVar6 = uVar6 + 1;
          } while (uVar6 < *(uint *)(in_ECX + 0x4c));
        }
        _free(*(void **)(in_ECX + 0x22c));
        *(undefined4 *)(in_ECX + 0x22c) = 0;
        *(undefined4 *)(in_ECX + 0x220) = 0;
        iVar4 = 0;
      }
      if (-1 < iVar4) {
        return iVar4;
      }
    }
LAB_100b1d45:
    if (local_30[8] == 0) {
      FUN_1008b0b5();
    }
  }
  else {
    iVar4 = -0x7fffbffb;
  }
  return iVar4;
}


