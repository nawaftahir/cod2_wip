// 10087159 size=408 FUN_10087159

bool FUN_10087159(void)

{
  uint *puVar1;
  bool bVar2;
  int *piVar3;
  uint uVar4;
  uint uVar5;
  int in_ECX;
  int iVar6;
  uint uVar7;
  uint local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  bVar2 = false;
  local_14 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_14 * 4);
      uVar4 = *puVar1;
      if ((((uVar4 & 0xfff00000) != 0) && ((uVar4 & 0xfff00000) != 0x10100000)) &&
         (local_8 = 0, puVar1[3] != 0)) {
        local_18 = puVar1[3];
        piVar3 = (int *)puVar1[4];
        do {
          if ((**(byte **)(*(int *)(in_ECX + 0x14) + *piVar3 * 4) & 0x20) == 0) {
            local_8 = local_8 + 1;
          }
          piVar3 = piVar3 + 1;
          local_18 = local_18 - 1;
        } while (local_18 != 0);
        if (local_8 != 0) {
          bVar2 = true;
          if (local_8 == puVar1[3]) {
            *puVar1 = 0;
          }
          else if (((local_8 < puVar1[3]) && (0xfffffff < (uVar4 & 0xf0000000))) &&
                  ((uVar4 & 0xf0000000) < 0x40000001)) {
            uVar4 = puVar1[1] / (uVar4 & 0xfffff);
            uVar7 = 0;
            uVar5 = 0;
            do {
              iVar6 = *(int *)(puVar1[4] + uVar5 * 4);
              if ((**(byte **)(*(int *)(in_ECX + 0x14) + iVar6 * 4) & 0x20) != 0) {
                local_c = 0;
                *(int *)(puVar1[4] + uVar7 * 4) = iVar6;
                if (uVar4 != 0) {
                  do {
                    iVar6 = puVar1[3] * local_c;
                    local_c = local_c + 1;
                    *(undefined4 *)(puVar1[2] + (iVar6 + uVar7) * 4) =
                         *(undefined4 *)(puVar1[2] + (iVar6 + uVar5) * 4);
                  } while (local_c < uVar4);
                }
                uVar7 = uVar7 + 1;
              }
              uVar5 = uVar5 + 1;
            } while (uVar5 < puVar1[3]);
            local_10 = 1;
            if (1 < uVar4) {
              local_18 = uVar7 << 2;
              do {
                local_c = 0;
                uVar5 = local_18;
                if (uVar7 != 0) {
                  do {
                    iVar6 = puVar1[3] * local_10 + local_c;
                    local_c = local_c + 1;
                    *(undefined4 *)(uVar5 + puVar1[2]) = *(undefined4 *)(puVar1[2] + iVar6 * 4);
                    uVar5 = uVar5 + 4;
                  } while (local_c < uVar7);
                }
                local_10 = local_10 + 1;
                local_18 = local_18 + uVar7 * 4;
              } while (local_10 < uVar4);
            }
            *puVar1 = *puVar1 ^ (*puVar1 ^ uVar7) & 0xfffff;
            puVar1[1] = uVar7 * uVar4;
            puVar1[3] = uVar7;
          }
        }
      }
      local_14 = local_14 + 1;
    } while (local_14 < *(uint *)(in_ECX + 0xc));
  }
  return !bVar2;
}


