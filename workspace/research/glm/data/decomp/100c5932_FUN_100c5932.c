// 100c5932 size=666 FUN_100c5932

int FUN_100c5932(void)

{
  int iVar1;
  int *in_ECX;
  int iVar2;
  uint uVar3;
  uint uVar4;
  uint *puVar5;
  int *piVar6;
  char *pcVar7;
  int *piVar8;
  char *pcVar9;
  bool bVar10;
  undefined4 local_64 [4];
  char local_54 [16];
  int local_44 [5];
  uint local_30;
  uint local_2c;
  int local_28;
  int local_24;
  uint local_20;
  char *local_1c;
  uint local_18;
  int local_14;
  int local_10;
  uint local_c;
  uint *local_8;
  
  iVar1 = FUN_100ba843();
  if (-1 < iVar1) {
    local_c = 0;
    uVar3 = in_ECX[3];
    local_2c = uVar3;
    if (uVar3 != 0) {
      do {
        puVar5 = *(uint **)(in_ECX[6] + local_c * 4);
        if ((*puVar5 & 0xfff00000) != 0) {
          local_10 = 0;
          local_18 = *puVar5 & 0xfffff;
          local_8 = puVar5;
          iVar1 = (**(code **)(*in_ECX + 0x20))(puVar5,&local_28);
          while ((uVar4 = local_18, iVar1 != 0 && ((*puVar5 & 0xfff00000) != 0x74100000))) {
            if ((uint)in_ECX[0x53] <= local_c) {
              local_44[0] = -1;
              local_44[1] = 0xffffffff;
              local_44[2] = 0xffffffff;
              local_44[3] = 0xffffffff;
              local_54[0] = -1;
              local_54[1] = -1;
              local_54[2] = -1;
              local_54[3] = -1;
              local_54[4] = -1;
              local_54[5] = -1;
              local_54[6] = -1;
              local_54[7] = -1;
              local_54[8] = -1;
              local_54[9] = -1;
              local_54[10] = -1;
              local_54[0xb] = -1;
              local_54[0xc] = -1;
              local_54[0xd] = -1;
              local_54[0xe] = -1;
              local_54[0xf] = -1;
            }
            local_20 = (-(uint)(local_18 != 1) & 0xfffffffd) + 3;
            iVar1 = local_20 * 4;
            local_1c = (char *)(puVar5[2] + local_28 * local_18 * 4);
            iVar2 = local_18 << 2;
            bVar10 = true;
            pcVar7 = local_1c;
            pcVar9 = local_54 + iVar1;
            do {
              if (iVar2 == 0) break;
              iVar2 = iVar2 + -1;
              bVar10 = *pcVar7 == *pcVar9;
              pcVar7 = pcVar7 + 1;
              pcVar9 = pcVar9 + 1;
            } while (bVar10);
            local_14 = iVar1;
            if ((!bVar10) ||
               ((puVar5 = local_8, local_8[3] != 0 &&
                (*(int *)(*(int *)(in_ECX[5] + *(int *)local_8[4] * 4) + 0x14) != -1)))) {
              iVar1 = FUN_10086199(local_18 & 0xfffff | 0x10000000,0xffffffff,0xffffffff);
              if (iVar1 == -1) {
                return -0x7ff8fff2;
              }
              local_24 = *(int *)(in_ECX[6] + iVar1 * 4);
              iVar1 = FUN_100853b0(local_8);
              if (iVar1 < 0) {
                return iVar1;
              }
              piVar6 = (int *)((int)local_44 + local_14);
              iVar2 = (**(code **)(*in_ECX + 0x80))(local_c,piVar6,uVar4,local_64,local_10);
              iVar1 = local_24;
              if (iVar2 < 0) {
                return iVar2;
              }
              local_44[4] = *(int *)(in_ECX[5] + *piVar6 * 4);
              local_30 = local_20 + uVar4;
              for (; local_20 < local_30; local_20 = local_20 + 1) {
                iVar2 = *(int *)(in_ECX[5] + local_44[local_20] * 4);
                if (local_8[3] != 0) {
                  *(undefined4 *)(iVar2 + 0x14) =
                       *(undefined4 *)(*(int *)(in_ECX[5] + *(int *)local_8[4] * 4) + 0x14);
                  *(undefined4 *)(iVar2 + 0x18) =
                       *(undefined4 *)(*(int *)(in_ECX[5] + *(int *)local_8[4] * 4) + 0x18);
                }
              }
              local_64[local_10] = *(undefined4 *)(local_44[4] + 0xc);
              puVar5 = local_8;
              piVar8 = *(int **)(iVar1 + 0x10);
              for (uVar3 = uVar4 & 0x3fffffff; uVar3 != 0; uVar3 = uVar3 - 1) {
                *piVar8 = *piVar6;
                piVar6 = piVar6 + 1;
                piVar8 = piVar8 + 1;
              }
              for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
                *(char *)piVar8 = (char)*piVar6;
                piVar6 = (int *)((int)piVar6 + 1);
                piVar8 = (int *)((int)piVar8 + 1);
              }
              pcVar7 = local_1c;
              pcVar9 = *(char **)(local_24 + 8);
              for (uVar3 = uVar4 & 0x3fffffff; uVar3 != 0; uVar3 = uVar3 - 1) {
                *(undefined4 *)pcVar9 = *(undefined4 *)pcVar7;
                pcVar7 = pcVar7 + 4;
                pcVar9 = pcVar9 + 4;
              }
              local_10 = local_10 + 1;
              for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
                *pcVar9 = *pcVar7;
                pcVar7 = pcVar7 + 1;
                pcVar9 = pcVar9 + 1;
              }
              pcVar7 = local_1c;
              pcVar9 = local_54 + local_14;
              for (uVar4 = uVar4 & 0x3fffffff; iVar1 = local_14, uVar4 != 0; uVar4 = uVar4 - 1) {
                *(undefined4 *)pcVar9 = *(undefined4 *)pcVar7;
                pcVar7 = pcVar7 + 4;
                pcVar9 = pcVar9 + 4;
              }
              for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
                *pcVar9 = *pcVar7;
                pcVar7 = pcVar7 + 1;
                pcVar9 = pcVar9 + 1;
              }
            }
            pcVar7 = (char *)((int)local_44 + iVar1);
            pcVar9 = local_1c;
            for (uVar3 = local_18 & 0x3fffffff; uVar3 != 0; uVar3 = uVar3 - 1) {
              *(undefined4 *)pcVar9 = *(undefined4 *)pcVar7;
              pcVar7 = pcVar7 + 4;
              pcVar9 = pcVar9 + 4;
            }
            for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
              *pcVar9 = *pcVar7;
              pcVar7 = pcVar7 + 1;
              pcVar9 = pcVar9 + 1;
            }
            iVar1 = (**(code **)(*in_ECX + 0x20))(puVar5,&local_28);
            puVar5 = local_8;
            uVar3 = local_2c;
          }
          iVar1 = FUN_10086292(puVar5);
          if (iVar1 == -1) {
            return -0x7ff8fff2;
          }
          FUN_1006c418(1);
          *(undefined4 *)(in_ECX[6] + local_c * 4) = 0;
        }
        local_c = local_c + 1;
      } while (local_c < uVar3);
    }
    if (uVar3 < (uint)in_ECX[3]) {
      iVar1 = 0;
      uVar4 = uVar3;
      do {
        *(undefined4 *)(iVar1 + in_ECX[6]) = *(undefined4 *)(in_ECX[6] + uVar4 * 4);
        uVar4 = uVar4 + 1;
        iVar1 = iVar1 + 4;
      } while (uVar4 < (uint)in_ECX[3]);
    }
    in_ECX[3] = in_ECX[3] - uVar3;
    iVar1 = 0;
  }
  return iVar1;
}


