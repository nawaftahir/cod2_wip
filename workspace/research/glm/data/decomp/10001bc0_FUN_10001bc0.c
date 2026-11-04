// 10001bc0 size=611 FUN_10001bc0

int FUN_10001bc0(int param_1,int param_2)

{
  bool bVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int *piVar6;
  int *piVar7;
  int iVar8;
  int *piVar9;
  int iVar10;
  int local_f40;
  int local_f3c;
  int local_f34;
  int local_f30;
  undefined4 local_f28;
  char local_f24 [32];
  int local_f04 [961];
  
  iVar3 = FUN_10001a20();
  local_f24[0] = '\0';
  local_f24[1] = '\0';
  local_f24[2] = '\0';
  local_f24[3] = '\0';
  local_f24[4] = '\0';
  local_f24[5] = '\0';
  local_f24[6] = '\0';
  local_f24[7] = '\0';
  local_f24[8] = '\0';
  local_f24[9] = '\0';
  local_f24[10] = '\0';
  local_f24[0xb] = '\0';
  local_f24[0xc] = '\0';
  local_f24[0xd] = '\0';
  local_f24[0xe] = '\0';
  local_f24[0xf] = '\0';
  local_f24[0x10] = '\0';
  local_f24[0x11] = '\0';
  local_f24[0x12] = '\0';
  local_f24[0x13] = '\0';
  local_f24[0x14] = '\0';
  local_f24[0x15] = '\0';
  local_f24[0x16] = '\0';
  local_f24[0x17] = '\0';
  local_f24[0x18] = '\0';
  local_f24[0x19] = '\0';
  local_f24[0x1a] = '\0';
  local_f24[0x1b] = '\0';
  local_f24[0x1c] = '\0';
  local_f24[0x1d] = '\0';
  local_f24[0x1e] = 0;
  local_f28 = 0;
  if (*(char *)(DAT_101ce6c4 + 8) == '\0') {
    local_f34 = 1;
  }
  else {
    local_f34 = (int)(DAT_101d4c84 + (DAT_101d4c84 >> 0x1f & 0x3ffU)) >> 10;
  }
  local_f40 = 0;
  local_f30 = local_f34;
  if (0 < iVar3) {
    do {
      iVar4 = iVar3 - local_f40;
      if (local_f34 * local_f30 - iVar4 != 0 && iVar4 <= local_f34 * local_f30) {
        do {
          if (local_f30 < local_f34) {
            local_f34 = local_f34 >> 1;
          }
          else {
            local_f30 = local_f30 >> 1;
          }
        } while (local_f34 * local_f30 - iVar4 != 0 && iVar4 <= local_f34 * local_f30);
      }
      local_f3c = local_f34 * local_f30;
      if (local_f3c < 2) {
        iVar4 = 0;
        do {
          if (local_f24[iVar4] == '\0') {
            *(int *)(param_2 + local_f40 * 4) = iVar4;
            local_f40 = local_f40 + 1;
            local_f24[iVar4] = '\x01';
            break;
          }
          iVar4 = iVar4 + 1;
        } while (iVar4 < iVar3);
      }
      else {
        iVar10 = 0;
        iVar4 = 0x1f;
        iVar5 = 0x1f;
        iVar8 = 1;
        do {
          iVar2 = iVar8;
          if (*(char *)((int)&local_f28 + iVar8 + 3) == '\0') {
            for (; iVar2 < iVar3; iVar2 = iVar2 + 1) {
              if ((local_f24[iVar2] == '\0') &&
                 ((iVar4 == 0x1f || (local_f04[iVar4 * 0x1f + iVar5] < local_f04[iVar10 + iVar2]))))
              {
                iVar4 = iVar8 + -1;
                iVar5 = iVar2;
              }
            }
          }
          iVar10 = iVar10 + 0x1f;
          bVar1 = iVar8 < iVar3;
          iVar8 = iVar8 + 1;
        } while (bVar1);
        *(int *)(param_2 + local_f40 * 4) = iVar5;
        *(int *)(param_2 + (local_f40 + 1) * 4) = iVar4;
        local_f40 = local_f40 + 2;
        local_f24[iVar5] = '\x01';
        local_f24[iVar4] = '\x01';
        if (2 < local_f3c) {
          local_f3c = local_f3c + -2;
          do {
            piVar6 = local_f04 + iVar5 * 0x1f;
            piVar7 = local_f04 + iVar4 * 0x1f;
            piVar9 = local_f04 + iVar4;
            iVar5 = iVar3;
            do {
              *piVar7 = *piVar7 + *piVar6;
              *piVar9 = *piVar7;
              piVar6 = piVar6 + 1;
              piVar7 = piVar7 + 1;
              piVar9 = piVar9 + 0x1f;
              iVar5 = iVar5 + -1;
            } while (iVar5 != 0);
            iVar5 = 0x1f;
            iVar8 = 0;
            piVar6 = local_f04 + iVar4 * 0x1f;
            do {
              if ((local_f24[iVar8] == '\0') &&
                 ((iVar5 == 0x1f || (local_f04[iVar5 + iVar4 * 0x1f] < *piVar6)))) {
                iVar5 = iVar8;
              }
              iVar8 = iVar8 + 1;
              piVar6 = piVar6 + 1;
            } while (iVar8 < iVar3);
            *(int *)(param_2 + local_f40 * 4) = iVar5;
            local_f40 = local_f40 + 1;
            local_f3c = local_f3c + -1;
            local_f24[iVar5] = '\x01';
          } while (local_f3c != 0);
        }
      }
      *(int *)(param_1 + local_f28 * 8) = local_f30;
      *(int *)(param_1 + 4 + local_f28 * 8) = local_f34;
      local_f28 = local_f28 + 1;
    } while (local_f40 < iVar3);
  }
  FUN_10061c80("%i merged lightmaps from %i original lightmaps\n",local_f28,iVar3);
  return iVar3;
}


