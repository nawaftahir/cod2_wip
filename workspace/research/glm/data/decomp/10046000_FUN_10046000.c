// 10046000 size=961 FUN_10046000

void FUN_10046000(void)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  int *piVar8;
  int *unaff_ESI;
  char *pcVar9;
  int *piVar10;
  int iVar11;
  int iStack_a34;
  int iStack_a28;
  char local_a14 [12];
  int aiStack_a08 [641];
  
  if (unaff_ESI[0x2c] < 1) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x13;
    *(undefined4 *)(*unaff_ESI + 0x18) = 0;
    (**(code **)*unaff_ESI)();
  }
  piVar8 = (int *)unaff_ESI[0x2d];
  if ((piVar8[5] == 0) && (piVar8[6] == 0x3f)) {
    uVar7 = unaff_ESI[0x11];
    *(undefined1 *)(unaff_ESI + 0x37) = 0;
    if (0 < (int)uVar7) {
      pcVar9 = local_a14;
      for (uVar6 = uVar7 >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
        pcVar9[0] = '\0';
        pcVar9[1] = '\0';
        pcVar9[2] = '\0';
        pcVar9[3] = '\0';
        pcVar9 = pcVar9 + 4;
      }
      for (uVar7 = uVar7 & 3; uVar7 != 0; uVar7 = uVar7 - 1) {
        *pcVar9 = '\0';
        pcVar9 = pcVar9 + 1;
      }
    }
  }
  else {
    *(undefined1 *)(unaff_ESI + 0x37) = 1;
    if (0 < unaff_ESI[0x11]) {
      piVar10 = aiStack_a08;
      for (iVar11 = (unaff_ESI[0x11] & 0xffffffU) << 6; iVar11 != 0; iVar11 = iVar11 + -1) {
        *piVar10 = -1;
        piVar10 = piVar10 + 1;
      }
    }
  }
  iStack_a34 = 1;
  if (0 < unaff_ESI[0x2c]) {
    do {
      iStack_a28 = *piVar8;
      if ((iStack_a28 < 1) || (4 < iStack_a28)) {
        *(undefined4 *)(*unaff_ESI + 0x14) = 0x1a;
        *(int *)(*unaff_ESI + 0x18) = iStack_a28;
        *(undefined4 *)(*unaff_ESI + 0x1c) = 4;
        (**(code **)*unaff_ESI)();
      }
      iVar11 = 0;
      if (0 < iStack_a28) {
        do {
          iVar2 = piVar8[iVar11 + 1];
          if ((iVar2 < 0) || (unaff_ESI[0x11] <= iVar2)) {
            *(undefined4 *)(*unaff_ESI + 0x14) = 0x13;
            *(int *)(*unaff_ESI + 0x18) = iStack_a34;
            (**(code **)*unaff_ESI)();
          }
          if ((0 < iVar11) && (iVar2 <= piVar8[iVar11])) {
            *(undefined4 *)(*unaff_ESI + 0x14) = 0x13;
            *(int *)(*unaff_ESI + 0x18) = iStack_a34;
            (**(code **)*unaff_ESI)();
          }
          iVar11 = iVar11 + 1;
        } while (iVar11 < iStack_a28);
      }
      iVar11 = piVar8[5];
      iVar2 = piVar8[6];
      iVar3 = piVar8[7];
      iVar4 = piVar8[8];
      if ((char)unaff_ESI[0x37] == '\0') {
        if ((((iVar11 != 0) || (iVar2 != 0x3f)) || (iVar3 != 0)) || (iVar4 != 0)) {
          *(undefined4 *)(*unaff_ESI + 0x14) = 0x11;
          *(int *)(*unaff_ESI + 0x18) = iStack_a34;
          (**(code **)*unaff_ESI)();
        }
        piVar10 = piVar8;
        if (0 < iStack_a28) {
          do {
            iVar11 = piVar10[1];
            if (local_a14[iVar11] != '\0') {
              *(undefined4 *)(*unaff_ESI + 0x14) = 0x13;
              *(int *)(*unaff_ESI + 0x18) = iStack_a34;
              (**(code **)*unaff_ESI)();
            }
            iStack_a28 = iStack_a28 + -1;
            local_a14[iVar11] = '\x01';
            piVar10 = piVar10 + 1;
          } while (iStack_a28 != 0);
        }
      }
      else {
        if (((((iVar11 < 0) || (0x3f < iVar11)) ||
             ((iVar2 < iVar11 || ((0x3f < iVar2 || (iVar3 < 0)))))) || (10 < iVar3)) ||
           ((iVar4 < 0 || (10 < iVar4)))) {
          *(undefined4 *)(*unaff_ESI + 0x14) = 0x11;
          *(int *)(*unaff_ESI + 0x18) = iStack_a34;
          (**(code **)*unaff_ESI)();
        }
        if (iVar11 == 0) {
          if (iVar2 != 0) {
            *(undefined4 *)(*unaff_ESI + 0x14) = 0x11;
            *(int *)(*unaff_ESI + 0x18) = iStack_a34;
            (**(code **)*unaff_ESI)();
          }
        }
        else if (iStack_a28 != 1) {
          *(undefined4 *)(*unaff_ESI + 0x14) = 0x11;
          *(int *)(*unaff_ESI + 0x18) = iStack_a34;
          (**(code **)*unaff_ESI)();
        }
        piVar10 = piVar8;
        if (0 < iStack_a28) {
          do {
            piVar10 = piVar10 + 1;
            piVar1 = aiStack_a08 + *piVar10 * 0x40;
            iVar5 = iVar11;
            if ((iVar11 != 0) && (*piVar1 < 0)) {
              *(undefined4 *)(*unaff_ESI + 0x14) = 0x11;
              *(int *)(*unaff_ESI + 0x18) = iStack_a34;
              (**(code **)*unaff_ESI)();
            }
            for (; iVar5 <= iVar2; iVar5 = iVar5 + 1) {
              if (piVar1[iVar5] < 0) {
                if (iVar3 != 0) {
                  *(undefined4 *)(*unaff_ESI + 0x14) = 0x11;
                  *(int *)(*unaff_ESI + 0x18) = iStack_a34;
                  (**(code **)*unaff_ESI)();
                }
              }
              else if ((iVar3 != piVar1[iVar5]) || (iVar4 != iVar3 + -1)) {
                *(undefined4 *)(*unaff_ESI + 0x14) = 0x11;
                *(int *)(*unaff_ESI + 0x18) = iStack_a34;
                (**(code **)*unaff_ESI)();
              }
              piVar1[iVar5] = iVar4;
            }
            iStack_a28 = iStack_a28 + -1;
          } while (iStack_a28 != 0);
        }
      }
      piVar8 = piVar8 + 9;
      iStack_a34 = iStack_a34 + 1;
    } while (iStack_a34 <= unaff_ESI[0x2c]);
  }
  iVar11 = 0;
  if ((char)unaff_ESI[0x37] == '\0') {
    if (0 < unaff_ESI[0x11]) {
      iVar11 = 0;
      do {
        if (local_a14[iVar11] == '\0') {
          *(undefined4 *)(*unaff_ESI + 0x14) = 0x2d;
          (**(code **)*unaff_ESI)();
        }
        iVar11 = iVar11 + 1;
      } while (iVar11 < unaff_ESI[0x11]);
    }
  }
  else if (0 < unaff_ESI[0x11]) {
    piVar8 = aiStack_a08;
    do {
      if (*piVar8 < 0) {
        *(undefined4 *)(*unaff_ESI + 0x14) = 0x2d;
        (**(code **)*unaff_ESI)();
      }
      iVar11 = iVar11 + 1;
      piVar8 = piVar8 + 0x40;
    } while (iVar11 < unaff_ESI[0x11]);
    return;
  }
  return;
}


