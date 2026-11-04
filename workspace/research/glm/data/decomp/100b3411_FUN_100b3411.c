// 100b3411 size=511 FUN_100b3411

uint FUN_100b3411(void)

{
  uint uVar1;
  int iVar2;
  int *piVar3;
  int *in_ECX;
  int iVar4;
  int local_64 [16];
  int local_24 [8];
  
  uVar1 = 0;
  if (in_ECX[0x56] == 0) {
    piVar3 = local_64;
    for (iVar4 = 0x10; iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar3 = 0;
      piVar3 = piVar3 + 1;
    }
    local_24[0] = 0;
    local_24[1] = 0;
    local_24[2] = 0;
    local_24[3] = 0;
    in_ECX[0x86] = 0;
    in_ECX[0x87] = 0;
    piVar3 = in_ECX + 0x7e;
    for (iVar4 = 8; iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar3 = 0;
      piVar3 = piVar3 + 1;
    }
    local_24[7] = 0;
    local_24[5] = 0;
    local_24[6] = 0;
    if (in_ECX[2] != 0) {
      do {
        iVar4 = *(int *)(in_ECX[5] + local_24[6] * 4);
        uVar1 = *(uint *)(*(int *)(in_ECX[4] + *(int *)(iVar4 + 4) * 4) + 4);
        if ((uVar1 & 0x20) == 0) {
          if (((uVar1 & 0x10) != 0) && ((uVar1 & 0x200) == 0)) {
            iVar2 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(iVar4 + 0x6c));
            uVar1 = (**(code **)(*in_ECX + 0x58))(*(undefined4 *)(iVar4 + 0x6c));
            if (iVar2 == 6) {
              if (uVar1 < 8) {
                iVar2 = uVar1 + 0x7e;
                goto LAB_100b3540;
              }
            }
            else if ((iVar2 == 0xb) && (uVar1 < 2)) {
              iVar2 = uVar1 + 0x86;
LAB_100b3540:
              uVar1 = *(int *)(iVar4 + 0x10) + 1;
              if ((uint)in_ECX[iVar2] < uVar1) {
                in_ECX[iVar2] = uVar1;
              }
            }
          }
        }
        else {
          iVar2 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(iVar4 + 0x6c));
          uVar1 = (**(code **)(*in_ECX + 0x58))(*(undefined4 *)(iVar4 + 0x6c));
          if (iVar2 == 0xb) {
            if (uVar1 < 4) {
              local_64[*(int *)(iVar4 + 0x10) + uVar1 * 4] = 1;
              local_24[uVar1] = *(int *)(iVar4 + 0x60);
            }
          }
          else if ((((iVar2 == 0xd) && (uVar1 == 0)) && (*(int *)(iVar4 + 0x10) != 0)) &&
                  (local_24[5] == 0)) {
            FUN_1008b0b5();
            local_24[5] = 1;
            local_24[7] = 1;
          }
        }
        local_24[6] = local_24[6] + 1;
      } while ((uint)local_24[6] < (uint)in_ECX[2]);
    }
    local_24[6] = 0;
    local_24[4] = 1;
    uVar1 = 0;
    do {
      iVar4 = 0;
      piVar3 = local_64 + uVar1 * 4;
      local_24[5] = 4;
      do {
        iVar2 = *piVar3;
        piVar3 = piVar3 + 1;
        iVar4 = iVar4 + (uint)(iVar2 != 0);
        local_24[5] = local_24[5] + -1;
      } while (local_24[5] != 0);
      if (iVar4 == 0) {
        if (uVar1 == 0) {
          FUN_1008b0b5();
          local_24[7] = 1;
        }
        local_24[6] = 1;
      }
      else {
        if (iVar4 != 4) {
          FUN_1008b0b5();
          local_24[7] = 1;
        }
        if (local_24[6] != 0) {
          local_24[4] = 0;
        }
      }
      uVar1 = uVar1 + 1;
    } while (uVar1 < 4);
    if (local_24[4] == 0) {
      FUN_1008b0b5();
      local_24[7] = 1;
    }
    uVar1 = -(uint)(local_24[7] != 0) & 0x80004005;
  }
  return uVar1;
}


