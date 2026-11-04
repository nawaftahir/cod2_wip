
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00428e20(char param_1,byte param_2,byte param_3,char param_4)

{
  float fVar1;
  float fVar2;
  float fVar3;
  int iVar4;
  int iVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  int *piVar9;
  int iVar10;
  int *piVar11;
  int *piVar12;
  float *pfVar13;
  int iVar14;
  int iStack_8;
  
  if ((DAT_010a44b8 != &DAT_010a44b4) && ((undefined4 *)DAT_010a44b8[1] == &DAT_010a44b4)) {
    iVar4 = DAT_010a44b8[2];
    if (*(int *)(*(int *)(*(int *)(iVar4 + 8) + 0x50) + 8) == 0) {
      iVar5 = DAT_010a44b8[5];
      piVar9 = (int *)FUN_00425770();
      piVar9[1] = 3;
      piVar9[4] = 1;
      if ((param_4 == '\0' & param_2) == 0) {
        if ((param_3 & param_4 == '\0') == 0) {
          *piVar9 = 9;
          iVar10 = *(int *)(iVar5 + 0x24);
          piVar9[0xe9] = *(int *)(iVar5 + 0x20);
          piVar9[0xea] = iVar10;
          iVar10 = *(int *)(iVar5 + 0x24);
          piVar9[0x2a9] = *(int *)(iVar5 + 0x2c);
          piVar9[0x2aa] = iVar10;
          iVar10 = *(int *)(iVar5 + 0x30);
          piVar9[0x469] = *(int *)(iVar5 + 0x2c);
          piVar9[0x46a] = iVar10;
          iVar10 = *(int *)(iVar5 + 0x30);
          piVar9[0x629] = *(int *)(iVar5 + 0x20);
          piVar9[0x62a] = iVar10;
          iVar10 = 1;
          if (1 < *piVar9 + -1) {
            pfVar13 = (float *)(piVar9 + 0x106);
            do {
              pfVar13[-0x1b] = *(float *)(iVar5 + 0x28);
              pfVar13[-1] = pfVar13[-0x1d];
              *pfVar13 = pfVar13[-0x1c];
              pfVar13[1] = *(float *)(iVar5 + 0x34);
              iVar10 = iVar10 + 2;
              pfVar13[-0xf] = (pfVar13[-1] + pfVar13[-0x1d]) * _DAT_00556b30;
              pfVar13[-0xe] = (pfVar13[-0x1c] + *pfVar13) * _DAT_00556b30;
              pfVar13[-0xd] = (pfVar13[-0x1b] + pfVar13[1]) * _DAT_00556b30;
              pfVar13 = pfVar13 + 0x1c0;
            } while (iVar10 < *piVar9 + -1);
          }
          FUN_00425840();
          if (param_4 != '\0') {
            if (param_2 == 0) {
              if (param_3 == 0) {
                iVar10 = 0;
                if (*piVar9 != 1 && -1 < *piVar9 + -1) {
                  piVar12 = piVar9 + 10;
                  do {
                    iVar14 = 0;
                    piVar11 = piVar12;
                    if (0 < piVar9[1]) {
                      do {
                        piVar11[-1] = piVar11[0xdf];
                        *piVar11 = piVar11[0xe0];
                        piVar11[1] = piVar11[0xe1];
                        iVar14 = iVar14 + 1;
                        piVar11 = piVar11 + 0xe;
                      } while (iVar14 < piVar9[1]);
                    }
                    piVar12 = piVar12 + 0xe0;
                    iVar10 = iVar10 + 1;
                  } while (iVar10 < *piVar9 + -1);
                }
                iVar10 = 0;
                if (0 < piVar9[1]) {
                  piVar12 = piVar9 + 0x70a;
                  do {
                    piVar12[-1] = piVar12[-0x701];
                    *piVar12 = piVar12[-0x700];
                    piVar12[1] = piVar12[-0x6ff];
                    iVar10 = iVar10 + 1;
                    piVar12 = piVar12 + 0xe;
                  } while (iVar10 < piVar9[1]);
                }
              }
              else {
                iVar10 = 0;
                if (0 < piVar9[1]) {
                  piVar12 = piVar9 + 0x38a;
                  do {
                    piVar12[-1] = piVar12[0xdf];
                    *piVar12 = piVar12[0xe0];
                    piVar12[1] = piVar12[0xe1];
                    piVar12[-0x1c1] = piVar12[-0x2a1];
                    piVar12[-0x1c0] = piVar12[-0x2a0];
                    piVar12[-0x1bf] = piVar12[-0x29f];
                    piVar12[0x1bf] = piVar12[0x29f];
                    piVar12[0x1c0] = piVar12[0x2a0];
                    piVar12[0x1c1] = piVar12[0x2a1];
                    piVar12[0x29f] = piVar12[0x37f];
                    piVar12[0x2a0] = piVar12[0x380];
                    piVar12[0x2a1] = piVar12[0x381];
                    iVar10 = iVar10 + 1;
                    piVar12 = piVar12 + 0xe;
                  } while (iVar10 < piVar9[1]);
                }
              }
            }
            else if (0 < piVar9[1]) {
              piVar12 = piVar9 + 0x1ca;
              iVar10 = 0;
              do {
                piVar12[-1] = piVar12[-0xe1];
                *piVar12 = piVar12[-0xe0];
                piVar12[1] = piVar12[-0xdf];
                piVar12[0x37f] = piVar12[0x45f];
                piVar12[0x380] = piVar12[0x460];
                piVar12[0x381] = piVar12[0x461];
                iVar10 = iVar10 + 1;
                piVar12 = piVar12 + 0xe;
              } while (iVar10 < piVar9[1]);
            }
          }
        }
        else {
          piVar9[4] = 4;
          *piVar9 = 5;
          iVar10 = FUN_004df760();
          iStack_8 = FUN_004df760();
          iVar14 = 0;
          pfVar13 = (float *)(piVar9 + 0xb);
          do {
            fVar6 = *(float *)(iVar5 + 0x24);
            fVar3 = (float)iStack_8;
            pfVar13[-2] = *(float *)(iVar5 + 0x20);
            pfVar13[-1] = fVar6;
            *pfVar13 = fVar3;
            fVar6 = *(float *)(iVar5 + 0x30);
            pfVar13[0xde] = *(float *)(iVar5 + 0x20);
            pfVar13[0xdf] = fVar6;
            pfVar13[0xe0] = fVar3;
            fVar6 = *(float *)(iVar5 + 0x2c);
            fVar1 = *(float *)(iVar5 + 0x20);
            fVar7 = (float)_DAT_00556ab8;
            fVar2 = *(float *)(iVar5 + 0x20);
            pfVar13[0x1bf] = *(float *)(iVar5 + 0x30);
            pfVar13[0x1c0] = fVar3;
            pfVar13[0x1be] = (fVar6 - fVar1) * fVar7 + fVar2;
            fVar6 = *(float *)(iVar5 + 0x30);
            pfVar13[0x29e] = *(float *)(iVar5 + 0x2c);
            pfVar13[0x29f] = fVar6;
            pfVar13[0x2a0] = fVar3;
            fVar6 = *(float *)(iVar5 + 0x24);
            pfVar13[0x37e] = *(float *)(iVar5 + 0x2c);
            pfVar13[0x37f] = fVar6;
            pfVar13[0x380] = fVar3;
            iStack_8 = iStack_8 + iVar10;
            iVar14 = iVar14 + 1;
            pfVar13 = pfVar13 + 0xe;
          } while (iVar14 < piVar9[1]);
        }
      }
      else {
        piVar9[4] = 2;
        *piVar9 = 3;
        iVar10 = FUN_004df760();
        iStack_8 = FUN_004df760();
        iVar14 = 0;
        pfVar13 = (float *)(piVar9 + 0xb);
        do {
          fVar1 = (float)iStack_8;
          fVar6 = *(float *)(iVar5 + 0x20);
          pfVar13[-1] = *(float *)(iVar5 + 0x24);
          pfVar13[-2] = fVar6;
          *pfVar13 = fVar1;
          fVar6 = *(float *)(iVar5 + 0x24);
          pfVar13[0xde] = *(float *)(iVar5 + 0x2c);
          pfVar13[0xdf] = fVar6;
          pfVar13[0xe0] = fVar1;
          fVar6 = *(float *)(iVar5 + 0x30);
          pfVar13[0x1be] = *(float *)(iVar5 + 0x2c);
          pfVar13[0x1bf] = fVar6;
          pfVar13[0x1c0] = fVar1;
          iStack_8 = iStack_8 + iVar10;
          iVar14 = iVar14 + 1;
          pfVar13 = pfVar13 + 0xe;
        } while (iVar14 < piVar9[1]);
      }
      iVar10 = 0;
      piVar12 = piVar9 + 6;
      do {
        *piVar12 = *(int *)(*(int *)(iVar5 + 0x3c) + 0x24 + iVar10);
        iVar10 = iVar10 + 0x1c;
        piVar12 = piVar12 + 1;
      } while (iVar10 < 0x38);
      FUN_00427160(0);
      if ((*(byte *)(piVar9 + 4) & 0x40) == 0) {
        FUN_00426f20(piVar9,0x41800000);
      }
      else {
        FUN_00426e80(1);
      }
      *(undefined1 *)((int)piVar9 + 0x382f) = 1;
      piVar9[0xe0d] = 0x41800000;
      if ((void *)piVar9[0xe09] != (void *)0x0) {
        _free((void *)piVar9[0xe09]);
      }
      iVar10 = FUN_004267d0(DAT_01128d94,0,0);
      *(short *)(piVar9 + 0xe0b) = (short)piVar9[0xe0b] + 1;
      piVar9[0xe09] = iVar10;
      if (param_1 != '\0') {
        piVar9[4] = 0x10;
        fVar6 = *(float *)(iVar5 + 0x2c);
        fVar1 = *(float *)(iVar5 + 0x20);
        iVar10 = 0;
        fVar7 = (float)_DAT_00556ab8;
        fVar2 = *(float *)(iVar5 + 0x30);
        fVar3 = *(float *)(iVar5 + 0x24);
        fVar8 = (float)_DAT_00556ab8;
        if (0 < *piVar9) {
          pfVar13 = (float *)(piVar9 + 0x25);
          do {
            *pfVar13 = (fVar6 + fVar1) * fVar7;
            pfVar13[1] = (fVar2 + fVar3) * fVar8;
            iVar10 = iVar10 + 1;
            pfVar13 = pfVar13 + 0xe0;
          } while (iVar10 < *piVar9);
        }
      }
      FUN_00426a80(*(undefined4 *)(iVar4 + 8));
      FUN_00458440();
      FUN_00459210();
      FUN_0046fb30();
      FUN_0046f0b0(1,1,0);
      return;
    }
    FUN_0047a5b0("Error: you cannot manipulate fixed size entities\n");
    return;
  }
  FUN_0047a5b0("Error: you must have a single brush selected\n");
  return;
}

