// 1008c847 size=772 FUN_1008c847

undefined4 FUN_1008c847(void)

{
  int iVar1;
  uint *puVar2;
  uint *puVar3;
  bool bVar4;
  bool bVar5;
  bool bVar6;
  int iVar7;
  int iVar8;
  int in_ECX;
  int *piVar9;
  int *piVar10;
  uint uVar11;
  uint uVar12;
  int *local_10;
  uint local_c;
  uint local_8;
  
  bVar6 = false;
  bVar5 = false;
  bVar4 = false;
  local_c = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + local_c * 4);
      if ((*(int *)(in_ECX + 0x74) != *(int *)(iVar8 + 4)) &&
         (piVar10 = (int *)(iVar8 + 8), *piVar10 != -1)) {
        if (!bVar4) {
          FUN_1008a979();
          bVar4 = true;
        }
        iVar7 = *piVar10;
        iVar1 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar7 * 4) + 0x48);
        if ((iVar1 != -1) &&
           (puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar1 * 4),
           (*puVar2 & 0xfff00000) == 0x10000000)) {
          local_8 = 0;
          if (puVar2[3] != 0) {
            piVar10 = (int *)puVar2[4];
            do {
              if (*piVar10 == iVar7) break;
              local_8 = local_8 + 1;
              piVar10 = piVar10 + 1;
            } while (local_8 < puVar2[3]);
          }
          piVar10 = (int *)(puVar2[2] + local_8 * 4);
        }
        iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar10 * 4);
        uVar11 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar1 + 4) * 4) + 4);
        if (((uVar11 & 0x100) == 0) || (*(int *)(iVar1 + 8) != -1)) {
          if (((uVar11 & 2) == 0) ||
             ((*(int *)(iVar1 + 0x48) == -1 ||
              (puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar1 + 0x48) * 4),
              (*puVar2 & 0xfff00000) != 0x20400000)))) goto LAB_1008cb1d;
          uVar11 = puVar2[3];
          uVar12 = 0;
          if (uVar11 != 0) {
            piVar9 = (int *)puVar2[4];
            do {
              if (*piVar9 == *piVar10) break;
              uVar12 = uVar12 + 1;
              piVar9 = piVar9 + 1;
            } while (uVar12 < uVar11);
          }
          iVar8 = *(int *)(puVar2[2] + uVar12 * 4);
          iVar1 = *(int *)(puVar2[2] + (uVar11 + uVar12) * 4);
          puVar2 = *(uint **)(*(int *)(in_ECX + 0x14) + iVar8 * 4);
          puVar3 = *(uint **)(*(int *)(in_ECX + 0x14) + iVar1 * 4);
          if (((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + puVar2[1] * 4) + 5) & 1) == 0) ||
               (puVar2[2] != 0xffffffff)) || ((*puVar2 & 4) == 0)) ||
             (((*puVar2 & 2) == 0 && ((*puVar3 & 2) == 0)))) {
            if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + puVar3[1] * 4) + 5) & 1) == 0) ||
                ((puVar3[2] != 0xffffffff || ((*puVar3 & 4) == 0)))) ||
               (((*puVar2 & 2) == 0 && ((*puVar3 & 2) == 0)))) goto LAB_1008cb1d;
            local_10 = (int *)__ftol();
          }
          else {
            local_10 = (int *)__ftol();
            iVar8 = iVar1;
          }
          uVar11 = 0;
          if (*piVar10 == iVar7) {
            if (*(int *)(in_ECX + 8) != 0) {
              do {
                iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + uVar11 * 4);
                if (iVar7 == *(int *)(iVar1 + 8)) {
                  *(int *)(iVar1 + 0xc) = *(int *)(iVar1 + 0xc) + (int)local_10;
                  *(int *)(iVar1 + 8) = iVar8;
                }
                uVar11 = uVar11 + 1;
              } while (uVar11 < *(uint *)(in_ECX + 8));
            }
          }
          else {
            if (*(int *)(in_ECX + 8) != 0) {
              do {
                iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + uVar11 * 4);
                if (iVar7 == *(int *)(iVar1 + 8)) {
                  piVar9 = (int *)(iVar1 + 0xc);
                  *piVar9 = *piVar9 + (int)local_10;
                }
                uVar11 = uVar11 + 1;
              } while (uVar11 < *(uint *)(in_ECX + 8));
            }
            *piVar10 = iVar8;
          }
        }
        else {
          iVar7 = __ftol();
          local_8 = 0;
          uVar11 = iVar7 + *(int *)(iVar8 + 0xc);
          if (*(uint *)(in_ECX + 8) != 0) {
            local_10 = *(int **)(in_ECX + 0x14);
            do {
              if (((((local_8 != local_c) &&
                    (iVar7 = *local_10, *(int *)(iVar7 + 4) == *(int *)(iVar8 + 4))) &&
                   (*(int *)(iVar7 + 8) == -1)) &&
                  ((*(uint *)(iVar7 + 0xc) == uVar11 &&
                   (*(int *)(iVar7 + 0x10) == *(int *)(iVar8 + 0x10))))) &&
                 ((*(int *)(iVar7 + 0x14) == *(int *)(iVar8 + 0x14) &&
                  (*(int *)(iVar7 + 0x18) == *(int *)(iVar8 + 0x18))))) {
                if (!bVar5) {
                  FUN_1008af0b();
                  bVar5 = true;
                }
                *(uint *)(iVar8 + 0x30) = local_8;
                break;
              }
              local_8 = local_8 + 1;
              local_10 = local_10 + 1;
            } while (local_8 < *(uint *)(in_ECX + 8));
          }
          if (local_8 == *(uint *)(in_ECX + 8)) {
            *(undefined4 *)(iVar8 + 8) = 0xffffffff;
            *(uint *)(iVar8 + 0xc) = uVar11;
            if (*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar8 + 4) * 4) + 8) <= uVar11
               ) {
              FUN_1008b0b5();
              return 0x80004005;
            }
          }
        }
        bVar6 = true;
      }
LAB_1008cb1d:
      local_c = local_c + 1;
    } while (local_c < *(uint *)(in_ECX + 8));
    if (bVar6) {
      if (bVar5) {
        FUN_1008af24();
      }
      return 0;
    }
  }
  return 1;
}


