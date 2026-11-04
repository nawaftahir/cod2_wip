// 10007aa0 size=687 FUN_10007aa0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10007aa0(int param_1)

{
  float *pfVar1;
  undefined4 *puVar2;
  int *piVar3;
  char cVar4;
  int *piVar5;
  undefined4 *puVar6;
  undefined4 *puVar7;
  int *piVar8;
  int iVar9;
  int iVar10;
  int local_10;
  int local_c;
  int local_4;
  
  DAT_101ce5c0 = 0;
  DAT_101ce5c8 = 0;
  local_4 = 0;
  if (0 < *(int *)(param_1 + 0x30)) {
    do {
      piVar3 = *(int **)(*(int *)(param_1 + 0x34) + local_4 * 4);
      cVar4 = FUN_10007a20(piVar3);
      if (cVar4 == '\0') {
        if (DAT_101ce5c0 == 0x400) {
          FUN_100138c0(1,&DAT_10192608);
        }
        *(int **)(DAT_101ce5c4 + DAT_101ce5c0 * 4) = piVar3;
        DAT_101ce5c0 = DAT_101ce5c0 + 1;
        piVar3[6] = 0x7fffffff;
        piVar3[7] = DAT_101ce5c8;
        piVar3[8] = DAT_101ce5cc + DAT_101ce5c8 * 0x14;
        iVar9 = 0;
        if (0 < *piVar3) {
          iVar10 = 0;
          do {
            *(undefined1 *)(iVar10 + 0x13 + piVar3[1]) = 0;
            pfVar1 = (float *)(iVar10 + piVar3[1]);
            if (0.0 < _DAT_101ce5d0 * *pfVar1 +
                      _DAT_101ce5dc * pfVar1[3] +
                      _DAT_101ce5d8 * pfVar1[2] + _DAT_101ce5d4 * *(float *)(iVar10 + 4 + piVar3[1])
               ) {
              *(undefined1 *)((int)pfVar1 + 0x13) = 1;
              if (DAT_101ce5c8 == 0x1800) {
                FUN_100138c0(1,&DAT_101925e8);
              }
              puVar2 = (undefined4 *)(DAT_101ce5cc + DAT_101ce5c8 * 0x14);
              puVar7 = (undefined4 *)(piVar3[1] + iVar10);
              *puVar2 = *puVar7;
              puVar2[1] = puVar7[1];
              puVar2[2] = puVar7[2];
              puVar2[3] = puVar7[3];
              puVar2[4] = puVar7[4];
              DAT_101ce5c8 = DAT_101ce5c8 + 1;
            }
            iVar9 = iVar9 + 1;
            iVar10 = iVar10 + 0x14;
          } while (iVar9 < *piVar3);
        }
        local_10 = 0;
        if (0 < piVar3[2]) {
          local_c = 0;
          do {
            piVar5 = (int *)(local_c + piVar3[3]);
            if (*(char *)(*piVar5 + 0x13) != *(char *)(*(int *)(local_c + 4 + piVar3[3]) + 0x13)) {
              if (*(int *)(DAT_101ce6e0 + 8) != 0) {
                puVar2 = (undefined4 *)piVar5[3];
                puVar7 = (undefined4 *)piVar5[2];
                piVar5 = (int *)(DAT_101da9c8 + 0x249d4c);
                if (*(int *)(DAT_101da9c8 + 0x249d4c) + 1 <= *(int *)(DAT_101da9c8 + 0x249d50)) {
                  piVar8 = (int *)(DAT_101da9c8 + 0x249d48);
                  if (*(int *)(DAT_101da9c8 + 0x249d48) == 0) {
                    iVar9 = (*(code *)RI_Z_MallocInternal)(*(int *)(DAT_101da9c8 + 0x249d50) * 0x2c)
                    ;
                    *piVar8 = iVar9;
                  }
                  puVar6 = (undefined4 *)(*piVar5 * 0x2c + *piVar8);
                  *puVar6 = *puVar7;
                  puVar6[1] = puVar7[1];
                  puVar6[2] = puVar7[2];
                  puVar6[3] = *puVar2;
                  puVar6[4] = puVar2[1];
                  puVar6[5] = puVar2[2];
                  puVar6[6] = 0x3f800000;
                  puVar6[7] = 0;
                  puVar6[8] = 0x3f800000;
                  puVar6[9] = 0x3f800000;
                  puVar6[10] = 0;
                  *piVar5 = *piVar5 + 1;
                }
              }
              FUN_10005d70();
              DAT_101ce5c8 = DAT_101ce5c8 + 1;
            }
            local_10 = local_10 + 1;
            local_c = local_c + 0x10;
          } while (local_10 < piVar3[2]);
        }
        piVar3[7] = DAT_101ce5c8 - piVar3[7];
      }
      local_4 = local_4 + 1;
    } while (local_4 < *(int *)(param_1 + 0x30));
  }
  return;
}


