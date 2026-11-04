// 100af5d2 size=391 FUN_100af5d2

uint FUN_100af5d2(void)

{
  byte bVar1;
  int iVar2;
  byte bVar3;
  uint uVar4;
  uint *puVar5;
  int in_ECX;
  int iVar6;
  uint uVar7;
  undefined4 *puVar8;
  int local_24 [8];
  
  local_24[0] = 0;
  local_24[1] = 0;
  local_24[2] = 0;
  local_24[3] = 0;
  *(undefined4 *)(in_ECX + 0x218) = 0;
  *(undefined4 *)(in_ECX + 0x21c) = 0;
  bVar3 = 0;
  puVar8 = (undefined4 *)(in_ECX + 0x1f8);
  for (iVar6 = 8; iVar6 != 0; iVar6 = iVar6 + -1) {
    *puVar8 = 0;
    puVar8 = puVar8 + 1;
  }
  local_24[6] = 0;
  local_24[5] = 0;
  local_24[4] = 0;
  local_24[7] = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + local_24[7] * 4);
      iVar2 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar6 + 4) * 4);
      if ((*(int *)(iVar6 + 8) != -1) && (local_24[6] == 0)) {
        FUN_1008b0b5();
        bVar3 = 1;
        local_24[6] = 1;
      }
      uVar4 = *(uint *)(iVar2 + 4);
      if ((uVar4 & 0x20) == 0) {
        if (((uVar4 & 0x10) != 0) && ((uVar4 & 0x200) == 0)) {
          uVar4 = (uint)*(byte *)(iVar6 + 0x6d);
          uVar7 = *(uint *)(iVar6 + 0x6c) & 0xff;
          if (uVar7 == 1) {
            if (uVar4 < 2) {
              puVar5 = (uint *)(in_ECX + 0x218 + uVar4 * 4);
              goto LAB_100af6fb;
            }
          }
          else if ((uVar7 == 3) && (uVar4 < 8)) {
            puVar5 = (uint *)(in_ECX + 0x1f8 + uVar4 * 4);
LAB_100af6fb:
            uVar4 = *(int *)(iVar6 + 0x10) + 1;
            if (*puVar5 < uVar4) {
              *puVar5 = uVar4;
            }
          }
        }
      }
      else {
        bVar1 = *(byte *)(iVar6 + 0x6d);
        if (3 < bVar1) break;
        uVar4 = *(uint *)(iVar6 + 0x6c) & 0xff;
        if (uVar4 == 1) {
          if (bVar1 == 0) {
            local_24[*(int *)(iVar6 + 0x10)] = 1;
            local_24[4] = *(undefined4 *)(iVar6 + 0x60);
          }
        }
        else if ((((uVar4 == 2) && (bVar1 == 0)) && (*(int *)(iVar6 + 0x10) != 0)) &&
                (local_24[5] == 0)) {
          FUN_1008b0b5();
          bVar3 = 1;
          local_24[5] = 1;
        }
      }
      local_24[7] = local_24[7] + 1;
    } while ((uint)local_24[7] < *(uint *)(in_ECX + 8));
  }
  iVar6 = 0;
  uVar4 = 0;
  do {
    iVar6 = iVar6 + (uint)(local_24[uVar4] != 0);
    uVar4 = uVar4 + 1;
  } while (uVar4 < 4);
  if (iVar6 != 4) {
    FUN_1008b0b5();
    bVar3 = 1;
  }
  return -(uint)bVar3 & 0x80004005;
}


