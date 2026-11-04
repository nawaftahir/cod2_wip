// 100a4a2e size=611 FUN_100a4a2e

uint FUN_100a4a2e(void)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  int *piVar4;
  int *in_ECX;
  int iVar5;
  int local_64 [16];
  int local_24 [8];
  
  if (in_ECX[0x56] != 0) {
    return 0;
  }
  local_24[7] = 0;
  local_24[6] = 0;
  local_24[4] = 0;
  if ((*(byte *)(in_ECX + 0x1c) & 0x40) == 0) {
    piVar4 = local_64;
    for (iVar5 = 0x10; iVar5 != 0; iVar5 = iVar5 + -1) {
      *piVar4 = 0;
      piVar4 = piVar4 + 1;
    }
    local_24[0] = 0;
    local_24[1] = 0;
    local_24[2] = 0;
    local_24[3] = 0;
    if (in_ECX[2] != 0) {
      do {
        iVar5 = *(int *)(in_ECX[5] + local_24[6] * 4);
        if ((*(byte *)(*(int *)(in_ECX[4] + *(int *)(iVar5 + 4) * 4) + 4) & 0x20) != 0) {
          local_24[5] = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(iVar5 + 0x6c));
          uVar3 = (**(code **)(*in_ECX + 0x58))(*(undefined4 *)(iVar5 + 0x6c));
          if (local_24[5] == 0xb) {
            if (uVar3 < 4) {
              local_64[*(int *)(iVar5 + 0x10) + uVar3 * 4] = 1;
              local_24[uVar3] = *(int *)(iVar5 + 0x60);
            }
          }
          else if ((((local_24[5] == 0xd) && (uVar3 == 0)) && (*(int *)(iVar5 + 0x10) != 0)) &&
                  (local_24[4] == 0)) {
            FUN_1008b0b5();
            local_24[4] = 1;
            local_24[7] = 1;
          }
        }
        local_24[6] = local_24[6] + 1;
      } while ((uint)local_24[6] < (uint)in_ECX[2]);
    }
    local_24[4] = 0;
    local_24[5] = 1;
    uVar3 = 0;
    do {
      iVar1 = 0;
      piVar4 = local_64 + uVar3 * 4;
      iVar5 = 4;
      do {
        iVar2 = *piVar4;
        piVar4 = piVar4 + 1;
        iVar1 = iVar1 + (uint)(iVar2 != 0);
        iVar5 = iVar5 + -1;
      } while (iVar5 != 0);
      if (iVar1 == 0) {
        if (uVar3 == 0) {
          FUN_1008b0b5();
          local_24[7] = 1;
        }
        local_24[4] = 1;
      }
      else {
        if (iVar1 != 4) {
          FUN_1008b0b5();
          local_24[7] = 1;
        }
        if (local_24[4] != 0) {
          local_24[5] = 0;
        }
      }
      uVar3 = uVar3 + 1;
    } while (uVar3 < 4);
    if (local_24[5] != 0) goto LAB_100a4c50;
  }
  else {
    local_24[0] = 0;
    local_24[1] = 0;
    local_24[2] = 0;
    local_24[5] = 0;
    local_24[3] = 0;
    if (in_ECX[2] != 0) {
      do {
        iVar5 = *(int *)(in_ECX[5] + local_24[6] * 4);
        if ((*(byte *)(*(int *)(in_ECX[4] + *(int *)(iVar5 + 4) * 4) + 4) & 0x20) != 0) {
          iVar1 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(iVar5 + 0x6c));
          iVar2 = (**(code **)(*in_ECX + 0x58))(*(undefined4 *)(iVar5 + 0x6c));
          if (iVar1 == 1) {
            if (iVar2 == 0) {
              local_24[*(int *)(iVar5 + 0x10)] = 1;
              local_24[4] = *(int *)(iVar5 + 0x60);
            }
          }
          else if (((iVar1 == 5) && (iVar2 == 0)) &&
                  ((*(int *)(iVar5 + 0x10) != 0 && (local_24[5] == 0)))) {
            FUN_1008b0b5();
            local_24[5] = 1;
            local_24[7] = 1;
          }
        }
        local_24[6] = local_24[6] + 1;
      } while ((uint)local_24[6] < (uint)in_ECX[2]);
    }
    iVar5 = 0;
    uVar3 = 0;
    do {
      if (local_24[uVar3] != 0) {
        iVar5 = iVar5 + 1;
      }
      uVar3 = uVar3 + 1;
    } while (uVar3 < 4);
    if (iVar5 == 4) goto LAB_100a4c50;
  }
  FUN_1008b0b5();
  local_24[7] = 1;
LAB_100a4c50:
  return -(uint)(local_24[7] != 0) & 0x80004005;
}


