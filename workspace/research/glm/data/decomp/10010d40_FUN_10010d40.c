// 10010d40 size=1471 FUN_10010d40

void FUN_10010d40(byte *param_1,char *param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  ushort *unaff_ESI;
  ushort uVar13;
  ushort uVar14;
  byte local_4c;
  int local_38;
  
  iVar2 = *(int *)(unaff_ESI + 4) >> ((byte)*(undefined4 *)(unaff_ESI + 0xc) & 0x1f);
  iVar12 = *(int *)(unaff_ESI + 6) >> ((byte)*(undefined4 *)(unaff_ESI + 0xc) & 0x1f);
  if ((iVar2 < 2) || (iVar12 < 2)) {
    if (iVar2 < 1) {
      iVar2 = 1;
    }
    if (iVar12 < 1) {
      iVar12 = 1;
    }
    iVar2 = iVar12 + -1 + iVar2;
    do {
      iVar12 = 0;
      if (0 < *(int *)(unaff_ESI + 8)) {
        do {
          *param_2 = **(char **)(unaff_ESI + 2);
          param_2 = param_2 + 1;
          *(int *)(unaff_ESI + 2) = *(int *)(unaff_ESI + 2) + 1;
          iVar12 = iVar12 + 1;
        } while (iVar12 < *(int *)(unaff_ESI + 8));
      }
      if (*(int *)(unaff_ESI + 10) != *(int *)(unaff_ESI + 8)) {
        *param_2 = -1;
        param_2 = param_2 + 1;
      }
      iVar2 = iVar2 + -1;
    } while (iVar2 != 0);
  }
  else {
    if ((byte)unaff_ESI[0xe] == 0) {
      uVar14 = **(ushort **)(unaff_ESI + 2);
      unaff_ESI[1] = 0;
      *(ushort **)(unaff_ESI + 2) = *(ushort **)(unaff_ESI + 2) + 1;
      *(byte *)(unaff_ESI + 0xe) = 1;
      *unaff_ESI = uVar14;
    }
    iVar1 = *(int *)(unaff_ESI + 10);
    iVar9 = iVar1 * iVar2;
    uVar14 = *unaff_ESI;
    FUN_10010ba0();
    if ((uVar14 & 1) != 0) {
      FUN_10010cb0((int)(iVar12 * iVar2 + (iVar12 * iVar2 >> 0x1f & 3U)) >> 2);
    }
    if (0 < iVar12) {
      iVar12 = (iVar12 - 1U >> 1) + 1;
      do {
        if (0 < iVar2) {
          local_38 = (iVar2 - 1U >> 1) + 1;
          do {
            if (*(int *)(unaff_ESI + 8) != 1) {
              local_4c = (byte)*unaff_ESI & 1;
              uVar13 = *unaff_ESI >> 1;
              *unaff_ESI = uVar13;
              uVar14 = unaff_ESI[1] + 1;
              *unaff_ESI = (ushort)((**(uint **)(unaff_ESI + 2) >> ((byte)unaff_ESI[1] & 0x1f)) <<
                                   0xf) | uVar13;
              *(uint *)(unaff_ESI + 2) = (uint)(uVar14 >> 3) + (int)*(uint **)(unaff_ESI + 2);
              unaff_ESI[1] = uVar14 & 7;
              iVar3 = FUN_10010c00(&DAT_10182988,9,0xff);
              iVar4 = FUN_10010c00(&DAT_10182988,9,0xff);
              iVar5 = FUN_10010c00(&DAT_10182988,9,0xff);
              iVar10 = (uint)*param_1 * 2;
              *param_2 = (char)(iVar10 + iVar5 + iVar4 + iVar3 >> 1) + local_4c;
              param_2[iVar1] = (char)(((iVar10 - iVar5) - iVar4) + iVar3 >> 1);
              param_2[iVar9] = (char)(((iVar10 - iVar5) - iVar3) + iVar4 >> 1);
              iVar6 = iVar9 + iVar1;
              param_2[iVar6] = (char)(((iVar10 - iVar4) - iVar3) + iVar5 >> 1);
              if (2 < *(int *)(unaff_ESI + 8)) {
                local_4c = (byte)*unaff_ESI & 1;
                uVar14 = *unaff_ESI >> 1;
                *unaff_ESI = uVar14;
                *unaff_ESI = (ushort)((**(uint **)(unaff_ESI + 2) >> ((byte)unaff_ESI[1] & 0x1f)) <<
                                     0xf) | uVar14;
                *(uint *)(unaff_ESI + 2) =
                     (uint)((ushort)(unaff_ESI[1] + 1) >> 3) + (int)*(uint **)(unaff_ESI + 2);
                unaff_ESI[1] = unaff_ESI[1] + 1 & 7;
                iVar10 = FUN_10010c00(&DAT_10186988,10,0x1fe);
                iVar10 = iVar10 + iVar3;
                iVar7 = FUN_10010c00(&DAT_10186988,10,0x1fe);
                iVar7 = iVar7 + iVar4;
                iVar8 = FUN_10010c00(&DAT_10186988,10,0x1fe);
                iVar8 = iVar8 + iVar5;
                iVar11 = (uint)param_1[1] * 2;
                param_2[1] = (char)(iVar8 + iVar7 + iVar10 + iVar11 >> 1) + local_4c;
                param_2[iVar1 + 1] = (char)(((iVar10 - iVar8) - iVar7) + iVar11 >> 1);
                param_2[iVar9 + 1] = (char)(((iVar7 - iVar8) - iVar10) + iVar11 >> 1);
                param_2[iVar6 + 1] = (char)(((iVar8 - iVar7) - iVar10) + iVar11 >> 1);
                local_4c = (byte)*unaff_ESI & 1;
                uVar13 = *unaff_ESI >> 1;
                *unaff_ESI = uVar13;
                uVar14 = unaff_ESI[1] + 1;
                *unaff_ESI = (ushort)((**(uint **)(unaff_ESI + 2) >> ((byte)unaff_ESI[1] & 0x1f)) <<
                                     0xf) | uVar13;
                *(uint *)(unaff_ESI + 2) = (uint)(uVar14 >> 3) + (int)*(uint **)(unaff_ESI + 2);
                unaff_ESI[1] = uVar14 & 7;
                iVar10 = FUN_10010c00(&DAT_10186988,10,0x1fe);
                iVar10 = iVar10 + iVar3;
                iVar3 = FUN_10010c00(&DAT_10186988,10,0x1fe);
                iVar3 = iVar3 + iVar4;
                iVar4 = FUN_10010c00(&DAT_10186988,10,0x1fe);
                iVar4 = iVar4 + iVar5;
                iVar5 = (uint)param_1[2] * 2;
                param_2[2] = (char)(iVar4 + iVar3 + iVar10 + iVar5 >> 1) + local_4c;
                param_2[iVar1 + 2] = (char)(((iVar10 - iVar4) - iVar3) + iVar5 >> 1);
                param_2[iVar9 + 2] = (char)(((iVar3 - iVar4) - iVar10) + iVar5 >> 1);
                param_2[iVar6 + 2] = (char)(((iVar4 - iVar3) - iVar10) + iVar5 >> 1);
              }
            }
            if (*(int *)(unaff_ESI + 8) == 3) {
              if (*(int *)(unaff_ESI + 10) != 3) {
                param_2[iVar1 + -1] = -1;
                param_2[iVar1 * 2 + -1] = -1;
                param_2[iVar1 + -1 + iVar9] = -1;
                param_2[iVar9 + -1 + iVar1 * 2] = -1;
              }
            }
            else {
              local_4c = (byte)*unaff_ESI & 1;
              uVar14 = *unaff_ESI >> 1;
              *unaff_ESI = uVar14;
              *unaff_ESI = (ushort)((**(uint **)(unaff_ESI + 2) >> ((byte)unaff_ESI[1] & 0x1f)) <<
                                   0xf) | uVar14;
              *(uint *)(unaff_ESI + 2) =
                   (uint)((ushort)(unaff_ESI[1] + 1) >> 3) + (int)*(uint **)(unaff_ESI + 2);
              unaff_ESI[1] = unaff_ESI[1] + 1 & 7;
              iVar3 = FUN_10010c00(&DAT_1018a988,9,0xff);
              iVar4 = FUN_10010c00(&DAT_1018a988,9,0xff);
              iVar5 = FUN_10010c00(&DAT_1018a988,9,0xff);
              iVar6 = (uint)param_1[iVar1 + -1] * 2;
              param_2[iVar1 + -1] = (char)(iVar5 + iVar4 + iVar3 + iVar6 >> 1) + local_4c;
              param_2[iVar1 * 2 + -1] = (char)(((iVar3 - iVar5) - iVar4) + iVar6 >> 1);
              param_2[iVar1 + -1 + iVar9] = (char)(((iVar4 - iVar5) - iVar3) + iVar6 >> 1);
              param_2[iVar9 + -1 + iVar1 * 2] = (char)(((iVar5 - iVar4) - iVar3) + iVar6 >> 1);
            }
            param_2 = param_2 + iVar1 * 2;
            param_1 = param_1 + iVar1;
            local_38 = local_38 + -1;
          } while (local_38 != 0);
        }
        param_2 = param_2 + iVar9;
        iVar12 = iVar12 + -1;
      } while (iVar12 != 0);
      return;
    }
  }
  return;
}


