// 100a7207 size=648 FUN_100a7207

undefined4 FUN_100a7207(void)

{
  uint *puVar1;
  int iVar2;
  int iVar3;
  uint *puVar4;
  int iVar5;
  uint *puVar6;
  uint uVar7;
  bool bVar8;
  int *piVar9;
  uint uVar10;
  uint uVar11;
  int *piVar12;
  int in_ECX;
  uint uVar13;
  uint uVar14;
  uint local_20;
  uint local_18;
  int *local_c;
  uint local_8;
  
  puVar1 = *(uint **)(in_ECX + 0x100);
  if (((*puVar1 & 0xfffff) == 4) && (puVar1[1] == 4)) {
    piVar12 = (int *)puVar1[2];
    iVar2 = piVar12[3];
    local_c = *(int **)(*(int *)(in_ECX + 0x100) + 8);
    local_8 = 0;
    piVar9 = local_c + 3;
    do {
      if (*local_c == *piVar9) goto LAB_100a7393;
      local_8 = local_8 + 1;
      local_c = local_c + 1;
    } while (local_8 < 3);
    iVar3 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar2 * 4) + 0x48);
    local_20 = -1;
    if (((iVar3 != -1) &&
        (puVar4 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar3 * 4),
        (*puVar4 & 0xfff00000) == 0x10000000)) && (local_8 = 0, puVar4[3] != 0)) {
      do {
        if (iVar2 == *(int *)(puVar4[4] + local_8 * 4)) {
          local_20 = *(int *)(local_8 * 4 + puVar4[2]);
        }
        local_8 = local_8 + 1;
      } while (local_8 < puVar4[3]);
    }
    uVar13 = 0;
    piVar9 = piVar12;
    do {
      if (*piVar9 == local_20) {
LAB_100a7393:
        *puVar1 = 0x11000003;
        return 0;
      }
      uVar13 = uVar13 + 1;
      piVar9 = piVar9 + 1;
    } while (uVar13 < 3);
    local_20 = 0;
    local_c = piVar12;
    do {
      iVar5 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *local_c * 4) + 0x48);
      if (iVar5 != -1) {
        puVar4 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar3 * 4);
        puVar6 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar5 * 4);
        if (((*puVar4 ^ *puVar6) & 0xfff00000) == 0) {
          uVar14 = *puVar4 & 0xfffff;
          uVar13 = *puVar6 & 0xfffff;
          if (((uVar14 != 0) && (uVar13 != 0)) &&
             ((uVar10 = puVar4[1] / uVar14, uVar10 == puVar6[1] / uVar13 &&
              ((uVar14 == puVar4[3] && (uVar7 = puVar6[3], uVar13 == uVar7)))))) {
            local_18 = 0xffffffff;
            local_8 = 0;
            if (uVar7 != 0) {
              piVar9 = (int *)puVar6[4];
              do {
                if (*piVar9 == *local_c) {
                  local_18 = local_8;
                  break;
                }
                local_8 = local_8 + 1;
                piVar9 = piVar9 + 1;
              } while (local_8 < uVar7);
            }
            uVar11 = 0;
            if (uVar7 != 0) {
              piVar9 = (int *)puVar4[4];
LAB_100a73b0:
              if (*piVar9 != iVar2) goto code_r0x100a73b7;
              if ((uVar11 != 0xffffffff) && (local_18 != 0xffffffff)) {
                bVar8 = true;
                if (uVar10 != 0) {
                  piVar9 = (int *)(puVar4[2] + uVar11 * 4);
                  piVar12 = (int *)(puVar6[2] + local_18 * 4);
                  do {
                    if (*piVar9 != *piVar12) {
                      bVar8 = false;
                    }
                    piVar12 = piVar12 + uVar13;
                    piVar9 = piVar9 + uVar14;
                    uVar10 = uVar10 - 1;
                  } while (uVar10 != 0);
                  if (!bVar8) goto LAB_100a7412;
                }
                **(undefined4 **)(in_ECX + 0x100) = 0x11000003;
                *(undefined4 *)(*(int *)(in_ECX + 0x100) + 4) = 3;
                *(undefined4 *)(*(int *)(in_ECX + 0x100) + 0xc) = 3;
                return 0;
              }
            }
          }
        }
      }
LAB_100a7412:
      local_20 = local_20 + 1;
      local_c = local_c + 1;
    } while (local_20 < 3);
    FUN_1008b0b5(in_ECX,puVar1[0xf],0x11c0,"Clip must be from a 3 vector in ps_1_%i",
                 *(uint *)(in_ECX + 200) & 0xff);
  }
  else {
    FUN_1008b0b5();
  }
  return 0x80004005;
code_r0x100a73b7:
  uVar11 = uVar11 + 1;
  piVar9 = piVar9 + 1;
  if (puVar6[3] <= uVar11) goto LAB_100a7412;
  goto LAB_100a73b0;
}


