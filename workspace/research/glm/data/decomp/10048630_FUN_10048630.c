// 10048630 size=554 FUN_10048630

void FUN_10048630(int param_1,int param_2,uint *param_3,uint param_4,int param_5,uint *param_6,
                 uint param_7)

{
  int iVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  uint uVar7;
  undefined4 *puVar8;
  int *piVar9;
  undefined4 *puVar10;
  int iStack_14;
  
  iVar1 = *(int *)(param_1 + 0x14c);
  if (*param_3 < param_4) {
    while (*param_6 < param_7) {
      uVar2 = param_4 - *param_3;
      uVar7 = *(int *)(param_1 + 0xe4) - *(int *)(iVar1 + 0x34);
      if (uVar2 <= uVar7) {
        uVar7 = uVar2;
      }
      piVar9 = (int *)(iVar1 + 8);
      (**(code **)(*(int *)(param_1 + 0x158) + 4))
                (param_1,param_2 + *param_3 * 4,piVar9,*(undefined4 *)(iVar1 + 0x34),uVar7);
      *param_3 = *param_3 + uVar7;
      iVar6 = *(int *)(iVar1 + 0x34) + uVar7;
      iVar5 = *(int *)(iVar1 + 0x30) - uVar7;
      *(int *)(iVar1 + 0x34) = iVar6;
      *(int *)(iVar1 + 0x30) = iVar5;
      if ((iVar5 == 0) && (iVar6 < *(int *)(param_1 + 0xe4))) {
        iStack_14 = 0;
        if (0 < *(int *)(param_1 + 0x44)) {
          do {
            iVar5 = *(int *)(param_1 + 0xe4);
            uVar7 = *(uint *)(param_1 + 0x24);
            iVar4 = *piVar9;
            iVar6 = *(int *)(iVar1 + 0x34);
            for (iVar3 = iVar6; iVar3 < iVar5; iVar3 = iVar3 + 1) {
              puVar8 = *(undefined4 **)(iVar4 + -4 + iVar6 * 4);
              puVar10 = *(undefined4 **)(iVar4 + iVar3 * 4);
              for (uVar2 = uVar7 >> 2; uVar2 != 0; uVar2 = uVar2 - 1) {
                *puVar10 = *puVar8;
                puVar8 = puVar8 + 1;
                puVar10 = puVar10 + 1;
              }
              for (uVar2 = uVar7 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
                *(undefined1 *)puVar10 = *(undefined1 *)puVar8;
                puVar8 = (undefined4 *)((int)puVar8 + 1);
                puVar10 = (undefined4 *)((int)puVar10 + 1);
              }
            }
            iStack_14 = iStack_14 + 1;
            piVar9 = piVar9 + 1;
          } while (iStack_14 < *(int *)(param_1 + 0x44));
        }
        *(undefined4 *)(iVar1 + 0x34) = *(undefined4 *)(param_1 + 0xe4);
      }
      if (*(int *)(iVar1 + 0x34) == *(int *)(param_1 + 0xe4)) {
        (**(code **)(*(int *)(param_1 + 0x15c) + 4))(param_1,iVar1 + 8,0,param_5,*param_6);
        *(undefined4 *)(iVar1 + 0x34) = 0;
        *param_6 = *param_6 + 1;
      }
      if ((*(int *)(iVar1 + 0x30) == 0) && (*param_6 < param_7)) {
        iStack_14 = 0;
        if (0 < *(int *)(param_1 + 0x44)) {
          piVar9 = (int *)(*(int *)(param_1 + 0x4c) + 0xc);
          do {
            iVar1 = *piVar9;
            iVar4 = *param_6 * iVar1;
            iVar5 = *(int *)(param_5 + iStack_14 * 4);
            uVar7 = piVar9[4];
            iVar6 = iVar4;
            while (iVar6 < (int)(iVar1 * param_7)) {
              puVar8 = *(undefined4 **)(iVar5 + -4 + iVar4 * 4);
              puVar10 = *(undefined4 **)(iVar5 + iVar6 * 4);
              for (iVar3 = (uVar7 & 0x1fffffff) << 1; iVar3 != 0; iVar3 = iVar3 + -1) {
                *puVar10 = *puVar8;
                puVar8 = puVar8 + 1;
                puVar10 = puVar10 + 1;
              }
              iVar6 = iVar6 + 1;
              for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
                *(undefined1 *)puVar10 = *(undefined1 *)puVar8;
                puVar8 = (undefined4 *)((int)puVar8 + 1);
                puVar10 = (undefined4 *)((int)puVar10 + 1);
              }
            }
            iStack_14 = iStack_14 + 1;
            piVar9 = piVar9 + 0x15;
          } while (iStack_14 < *(int *)(param_1 + 0x44));
        }
        *param_6 = param_7;
        return;
      }
      if (param_4 <= *param_3) {
        return;
      }
    }
  }
  return;
}


