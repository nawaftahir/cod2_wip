// 1004aae0 size=667 FUN_1004aae0

undefined4 FUN_1004aae0(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  code *pcVar4;
  int iVar5;
  char cVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  int iVar10;
  undefined4 uVar11;
  int iVar12;
  uint uVar13;
  undefined4 *puVar14;
  int iVar15;
  int iStack_28;
  int *piStack_24;
  int iStack_18;
  int iStack_14;
  int iStack_10;
  
  iVar1 = *(int *)(param_1 + 0x124);
  iVar2 = *(int *)(param_1 + 400);
  uVar9 = *(int *)(param_1 + 0x140) - 1;
  iVar8 = *(int *)(iVar2 + 0x18);
  if (iVar8 < *(int *)(iVar2 + 0x1c)) {
    do {
      for (uVar13 = *(uint *)(iVar2 + 0x14); uVar13 <= uVar9; uVar13 = uVar13 + 1) {
        puVar14 = *(undefined4 **)(iVar2 + 0x20);
        for (iVar10 = (*(uint *)(param_1 + 0x148) & 0x1ffffff) << 5; iVar10 != 0;
            iVar10 = iVar10 + -1) {
          *puVar14 = 0;
          puVar14 = puVar14 + 1;
        }
        for (iVar10 = 0; iVar10 != 0; iVar10 = iVar10 + -1) {
          *(undefined1 *)puVar14 = 0;
          puVar14 = (undefined4 *)((int)puVar14 + 1);
        }
        cVar6 = (**(code **)(*(int *)(param_1 + 0x1a0) + 4))(param_1,iVar2 + 0x20);
        if (cVar6 == '\0') {
          *(uint *)(iVar2 + 0x14) = uVar13;
          *(int *)(iVar2 + 0x18) = iVar8;
          return 0;
        }
        iVar10 = 0;
        iStack_28 = 0;
        iStack_10 = 0;
        if (0 < *(int *)(param_1 + 300)) {
          piStack_24 = (int *)(param_1 + 0x130);
          do {
            iVar3 = *piStack_24;
            if (*(char *)(iVar3 + 0x30) == '\0') {
              iVar10 = iVar10 + *(int *)(iVar3 + 0x3c);
              iStack_28 = iVar10;
            }
            else {
              iVar7 = *(int *)(iVar3 + 4) * 4;
              pcVar4 = *(code **)(*(int *)(param_1 + 0x1a4) + 4 + iVar7);
              if (uVar13 < uVar9) {
                iVar12 = *(int *)(iVar3 + 0x34);
              }
              else {
                iVar12 = *(int *)(iVar3 + 0x44);
              }
              iVar5 = *(int *)(iVar3 + 0x40);
              iVar7 = *(int *)(iVar7 + param_2) + *(int *)(iVar3 + 0x24) * iVar8 * 4;
              iStack_14 = 0;
              if (0 < *(int *)(iVar3 + 0x38)) {
                do {
                  if (((*(uint *)(param_1 + 0x88) < iVar1 - 1U) ||
                      (iVar8 + iStack_14 < *(int *)(iVar3 + 0x48))) && (0 < iVar12)) {
                    puVar14 = (undefined4 *)(iVar2 + 0x20 + iVar10 * 4);
                    iVar15 = iVar5 * uVar13;
                    iStack_18 = iVar12;
                    do {
                      (*pcVar4)(param_1,iVar3,*puVar14,iVar7,iVar15);
                      iVar15 = iVar15 + *(int *)(iVar3 + 0x24);
                      puVar14 = puVar14 + 1;
                      iStack_18 = iStack_18 + -1;
                      iVar10 = iStack_28;
                    } while (iStack_18 != 0);
                  }
                  iVar10 = iVar10 + *(int *)(iVar3 + 0x34);
                  iVar7 = iVar7 + *(int *)(iVar3 + 0x24) * 4;
                  iStack_14 = iStack_14 + 1;
                  iStack_28 = iVar10;
                } while (iStack_14 < *(int *)(iVar3 + 0x38));
              }
            }
            iStack_10 = iStack_10 + 1;
            piStack_24 = piStack_24 + 1;
          } while (iStack_10 < *(int *)(param_1 + 300));
        }
      }
      *(undefined4 *)(iVar2 + 0x14) = 0;
      iVar8 = iVar8 + 1;
    } while (iVar8 < *(int *)(iVar2 + 0x1c));
  }
  *(int *)(param_1 + 0x90) = *(int *)(param_1 + 0x90) + 1;
  uVar9 = *(int *)(param_1 + 0x88) + 1;
  *(uint *)(param_1 + 0x88) = uVar9;
  if (*(uint *)(param_1 + 0x124) <= uVar9) {
    (**(code **)(*(int *)(param_1 + 0x198) + 0xc))(param_1);
    return 4;
  }
  iVar1 = *(int *)(param_1 + 400);
  if (1 < *(int *)(param_1 + 300)) {
    *(undefined4 *)(iVar1 + 0x1c) = 1;
    *(undefined4 *)(iVar1 + 0x14) = 0;
    *(undefined4 *)(iVar1 + 0x18) = 0;
    return 3;
  }
  if (uVar9 < *(uint *)(param_1 + 0x124) - 1) {
    uVar11 = *(undefined4 *)(*(int *)(param_1 + 0x130) + 0xc);
  }
  else {
    uVar11 = *(undefined4 *)(*(int *)(param_1 + 0x130) + 0x48);
  }
  *(undefined4 *)(iVar1 + 0x1c) = uVar11;
  *(undefined4 *)(iVar1 + 0x14) = 0;
  *(undefined4 *)(iVar1 + 0x18) = 0;
  return 3;
}


