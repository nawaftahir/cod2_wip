// 10001fb0 size=1537 FUN_10001fb0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10001fb0(int *param_1)

{
  char cVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  char *pcVar6;
  char *pcVar7;
  int *piVar8;
  int iVar9;
  uint uVar10;
  short sVar11;
  int iVar12;
  int iVar13;
  int iVar14;
  int iVar15;
  int iVar16;
  int iVar17;
  char *pcVar18;
  int iVar19;
  undefined4 *puVar20;
  char *pcVar21;
  int iStack_214;
  int iStack_200;
  int iStack_1f4;
  int iStack_1ec;
  undefined4 *apuStack_1d4 [4];
  int iStack_1c4;
  int iStack_1c0;
  int iStack_1bc;
  int iStack_1b8;
  int local_1b4 [13];
  undefined4 local_180;
  undefined4 local_17c;
  int local_178 [62];
  int local_80 [32];
  
  local_17c = DAT_101ae358;
  local_180 = DAT_101ae354;
  local_1b4[0xc] = DAT_101ae350;
  *(undefined2 *)(param_1 + 0xa0) = 0x1f;
  param_1[0xa1] = 0;
  param_1[0xa2] = 0;
  param_1[0xa3] = 0x3f800000;
  param_1[0xa4] = 0x3f800000;
  iVar4 = FUN_10001bc0(local_178,local_80);
  if (iVar4 != 0) {
    local_1b4[8] = 0x200;
    local_1b4[4] = 0x200;
    local_1b4[9] = 0x200;
    local_1b4[5] = 0x200;
    local_1b4[10] = 0x200;
    local_1b4[6] = 0x200;
    local_1b4[0] = 4;
    local_1b4[1] = 4;
    local_1b4[2] = 4;
    local_1b4[3] = 1;
    local_1b4[0xb] = 0x400;
    local_1b4[7] = 0x400;
    apuStack_1d4[0] =
         (undefined4 *)
         (*(code *)RI_Hunk_AllocateTempMemoryInternal)(local_178[1] * local_178[0] * 0x400000);
    iVar19 = local_178[1] * 0x100000;
    apuStack_1d4[1] = (undefined4 *)(iVar19 * local_178[0] + (int)apuStack_1d4[0]);
    apuStack_1d4[2] = (undefined4 *)(iVar19 * local_178[0] + (int)apuStack_1d4[1]);
    apuStack_1d4[3] = (undefined4 *)(iVar19 * local_178[0] + (int)apuStack_1d4[2]);
    iStack_1b8 = *(int *)(*param_1 + 0x10);
    iStack_1bc = *(int *)(*param_1 + 0x14) + param_1[1];
    if (iStack_1b8 == 0) {
      puVar20 = apuStack_1d4[0];
      for (iVar19 = (local_178[1] * local_178[0] & 0x3ffU) << 0x14; iVar19 != 0;
          iVar19 = iVar19 + -1) {
        *puVar20 = 0xffffffff;
        puVar20 = puVar20 + 1;
      }
      for (iVar19 = 0; iVar19 != 0; iVar19 = iVar19 + -1) {
        *(undefined1 *)puVar20 = 0xff;
        puVar20 = (undefined4 *)((int)puVar20 + 1);
      }
    }
    DAT_101ae390 = (*(code *)RI_Hunk_AllocInternal)(0x200);
    sVar11 = 0;
    iStack_200 = 0;
    if (0 < iVar4) {
      do {
        iVar12 = (int)sVar11;
        iVar19 = local_178[iVar12 * 2];
        iVar2 = local_178[iVar12 * 2 + 1];
        iVar16 = iVar19 * iVar2;
        iStack_1f4 = 0;
        if (0 < iVar16) {
          iStack_1c4 = local_178[iVar12 * 2];
          piVar8 = local_80 + iStack_200;
          do {
            iVar5 = iStack_1f4 / iStack_1c4;
            iVar13 = iStack_1f4 % iStack_1c4;
            if (iStack_1b8 != 0) {
              iVar9 = *piVar8 * 0x400000 + iStack_1bc;
              iVar14 = 0;
              do {
                iStack_1ec = *(int *)((int)local_1b4 + iVar14 + 0x10);
                iVar3 = *(int *)((int)local_1b4 + iVar14 + 0x20);
                iVar17 = (iStack_1ec * iVar19 * iVar5 + iVar13) * iVar3 *
                         *(int *)((int)local_1b4 + iVar14) + *(int *)((int)apuStack_1d4 + iVar14);
                if (0 < iStack_1ec) {
                  iVar15 = iVar3 * *(int *)((int)local_1b4 + iVar14);
                  iStack_1c0 = iVar19 * iVar15;
                  iStack_214 = iVar9;
                  do {
                    FUN_1005eaf0(iVar17,iStack_214,iVar15);
                    iStack_214 = iStack_214 + iVar15;
                    iVar17 = iVar17 + iStack_1c0;
                    iStack_1ec = iStack_1ec + -1;
                  } while (iStack_1ec != 0);
                }
                iVar9 = iVar9 + iVar3 * *(int *)((int)local_1b4 + iVar14 + 0x10) *
                                *(int *)((int)local_1b4 + iVar14);
                iVar14 = iVar14 + 4;
              } while (iVar14 < 0x10);
            }
            iVar9 = *piVar8;
            *(short *)(param_1 + iVar9 * 5 + 5) = sVar11;
            param_1[iVar9 * 5 + 6] = (int)((float)iVar13 * (1.0 / (float)iVar19));
            iStack_1f4 = iStack_1f4 + 1;
            param_1[iVar9 * 5 + 8] = (int)(1.0 / (float)iVar19);
            piVar8 = piVar8 + 1;
            param_1[iVar9 * 5 + 9] = (int)(1.0 / (float)iVar2);
            param_1[iVar9 * 5 + 7] = (int)((float)iVar5 * (1.0 / (float)iVar2));
          } while (iStack_1f4 < iVar16);
        }
        if (*(int *)(DAT_101ce708 + 8) == 2) {
          pcVar6 = (char *)FUN_10060c70("*lightmap%i",iVar12);
          pcVar7 = pcVar6;
          do {
            cVar1 = *pcVar7;
            pcVar7 = pcVar7 + 1;
          } while (cVar1 != '\0');
          iVar5 = (*(code *)RI_Hunk_AllocInternal)(pcVar7 + (0x25 - (int)(pcVar6 + 1)));
          *(char **)(iVar5 + 0x20) = (char *)(iVar5 + 0x24);
          pcVar18 = pcVar6;
          pcVar21 = (char *)(iVar5 + 0x24);
          for (uVar10 = (uint)(pcVar7 + (1 - (int)(pcVar6 + 1))) >> 2; uVar10 != 0;
              uVar10 = uVar10 - 1) {
            *(undefined4 *)pcVar21 = *(undefined4 *)pcVar18;
            pcVar18 = pcVar18 + 4;
            pcVar21 = pcVar21 + 4;
          }
          for (uVar10 = (uint)(pcVar7 + (1 - (int)(pcVar6 + 1))) & 3; uVar10 != 0;
              uVar10 = uVar10 - 1) {
            *pcVar21 = *pcVar18;
            pcVar18 = pcVar18 + 1;
            pcVar21 = pcVar21 + 1;
          }
          *(undefined1 *)(iVar5 + 0x1e) = 2;
          *(undefined1 *)(iVar5 + 10) = 1;
          *(undefined1 *)(iVar5 + 0xc) = 4;
          iVar9 = DAT_101ae390;
          uVar10 = 0;
          iVar13 = 0x77;
          cVar1 = *pcVar6;
          while (cVar1 != '\0') {
            uVar10 = uVar10 + cVar1 * iVar13;
            iVar14 = iVar13 + -0x76;
            iVar13 = iVar13 + 1;
            cVar1 = pcVar6[iVar14];
          }
          uVar10 = uVar10 & 0x7ff;
          iVar13 = (&DAT_101cea68)[uVar10];
          while (iVar13 != 0) {
            uVar10 = uVar10 + 1 & 0x7ff;
            iVar13 = (&DAT_101cea68)[uVar10];
          }
          (&DAT_101cea68)[uVar10] = iVar5;
          *(int *)(iVar12 * 0x10 + iVar9) = iVar5;
          FUN_10001e30(iVar19 << 9);
          piVar8 = *(int **)(iVar12 * 0x10 + DAT_101ae390);
          FUN_1000ee30(iVar19 << 9,iVar2 << 9,1,3,0);
          if (*piVar8 == 4) {
            FUN_1000ec00(piVar8,0x15,0,apuStack_1d4[0]);
          }
          else {
            FUN_1000ea20(0x15,apuStack_1d4[0]);
          }
        }
        else {
          iVar5 = 0;
          iStack_214 = iVar12 << 4;
          do {
            pcVar6 = (char *)FUN_10060c70("*lightmap%i_%i",iVar12,iVar5);
            pcVar7 = pcVar6;
            do {
              cVar1 = *pcVar7;
              pcVar7 = pcVar7 + 1;
            } while (cVar1 != '\0');
            iVar13 = (*(code *)RI_Hunk_AllocInternal)(pcVar7 + (0x25 - (int)(pcVar6 + 1)));
            *(char **)(iVar13 + 0x20) = (char *)(iVar13 + 0x24);
            pcVar18 = pcVar6;
            pcVar21 = (char *)(iVar13 + 0x24);
            for (uVar10 = (uint)(pcVar7 + (1 - (int)(pcVar6 + 1))) >> 2; uVar10 != 0;
                uVar10 = uVar10 - 1) {
              *(undefined4 *)pcVar21 = *(undefined4 *)pcVar18;
              pcVar18 = pcVar18 + 4;
              pcVar21 = pcVar21 + 4;
            }
            for (uVar10 = (uint)(pcVar7 + (1 - (int)(pcVar6 + 1))) & 3; uVar10 != 0;
                uVar10 = uVar10 - 1) {
              *pcVar21 = *pcVar18;
              pcVar18 = pcVar18 + 1;
              pcVar21 = pcVar21 + 1;
            }
            *(undefined1 *)(iVar13 + 0x1e) = 2;
            *(undefined1 *)(iVar13 + 10) = 1;
            *(undefined1 *)(iVar13 + 0xc) = 4;
            iVar14 = DAT_101ae390;
            uVar10 = 0;
            iVar9 = 0x77;
            cVar1 = *pcVar6;
            while (cVar1 != '\0') {
              uVar10 = uVar10 + cVar1 * iVar9;
              iVar3 = iVar9 + -0x76;
              iVar9 = iVar9 + 1;
              cVar1 = pcVar6[iVar3];
            }
            uVar10 = uVar10 & 0x7ff;
            iVar9 = (&DAT_101cea68)[uVar10];
            while (iVar9 != 0) {
              uVar10 = uVar10 + 1 & 0x7ff;
              iVar9 = (&DAT_101cea68)[uVar10];
            }
            iVar9 = local_1b4[iVar5];
            (&DAT_101cea68)[uVar10] = iVar13;
            *(int *)(iStack_214 + iVar14) = iVar13;
            piVar8 = *(int **)(iStack_214 + DAT_101ae390);
            puVar20 = apuStack_1d4[iVar5];
            iVar13 = ((iVar9 != 4) - 1 & 0xffffffe3) + 0x32;
            FUN_1000ee30(local_1b4[iVar5 + 8] * iVar19,local_1b4[iVar5 + 4] * iVar2,1,3,0);
            if (*piVar8 == 4) {
              FUN_1000ec00(piVar8,iVar13,0);
            }
            else {
              FUN_1000ea20(iVar13,puVar20);
            }
            iVar5 = iVar5 + 1;
            iStack_214 = iStack_214 + 4;
          } while (iVar5 < 4);
        }
        iStack_200 = iStack_200 + iVar16;
        sVar11 = sVar11 + 1;
      } while (iStack_200 < iVar4);
    }
    _DAT_101ae38c = (int)sVar11;
    (*(code *)RI_Hunk_FreeTempMemory)(apuStack_1d4[0]);
    return;
  }
  _DAT_101ae38c = 0;
  return;
}


