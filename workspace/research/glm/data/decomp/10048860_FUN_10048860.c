// 10048860 size=598 FUN_10048860

void FUN_10048860(int param_1,int param_2,uint *param_3,uint param_4,undefined4 param_5,
                 uint *param_6,uint param_7)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  uint uVar7;
  uint uVar8;
  int iVar9;
  undefined4 *puVar10;
  uint uVar11;
  undefined4 *puVar12;
  int iStack_18;
  int *piStack_10;
  
  iVar5 = param_1;
  uVar8 = *param_6;
  iVar4 = *(int *)(param_1 + 0xe4) * 3;
  iVar1 = *(int *)(param_1 + 0x14c);
  do {
    if (param_7 <= uVar8) {
      return;
    }
    uVar8 = *param_3;
    if (uVar8 < param_4) {
      uVar11 = *(int *)(iVar1 + 0x3c) - *(int *)(iVar1 + 0x34);
      if (param_4 - uVar8 <= uVar11) {
        uVar11 = param_4 - uVar8;
      }
      piStack_10 = (int *)(iVar1 + 8);
      (**(code **)(*(int *)(iVar5 + 0x158) + 4))
                (iVar5,param_2 + uVar8 * 4,piStack_10,*(int *)(iVar1 + 0x34),uVar11);
      if ((*(int *)(iVar1 + 0x30) == *(int *)(iVar5 + 0x28)) &&
         (param_1 = 0, 0 < *(int *)(iVar5 + 0x44))) {
        do {
          iVar9 = 1;
          if (0 < *(int *)(iVar5 + 0xe4)) {
            iStack_18 = 4;
            do {
              uVar8 = *(uint *)(iVar5 + 0x24);
              puVar10 = *(undefined4 **)*piStack_10;
              puVar12 = *(undefined4 **)((int)*piStack_10 - iStack_18);
              for (uVar7 = uVar8 >> 2; uVar7 != 0; uVar7 = uVar7 - 1) {
                *puVar12 = *puVar10;
                puVar10 = puVar10 + 1;
                puVar12 = puVar12 + 1;
              }
              for (uVar8 = uVar8 & 3; uVar8 != 0; uVar8 = uVar8 - 1) {
                *(undefined1 *)puVar12 = *(undefined1 *)puVar10;
                puVar10 = (undefined4 *)((int)puVar10 + 1);
                puVar12 = (undefined4 *)((int)puVar12 + 1);
              }
              iVar9 = iVar9 + 1;
              iStack_18 = iStack_18 + 4;
            } while (iVar9 <= *(int *)(iVar5 + 0xe4));
          }
          param_1 = param_1 + 1;
          piStack_10 = piStack_10 + 1;
        } while (param_1 < *(int *)(iVar5 + 0x44));
      }
      *param_3 = *param_3 + uVar11;
      *(uint *)(iVar1 + 0x34) = *(int *)(iVar1 + 0x34) + uVar11;
      *(uint *)(iVar1 + 0x30) = *(int *)(iVar1 + 0x30) - uVar11;
    }
    else {
      if (*(int *)(iVar1 + 0x30) != 0) {
        return;
      }
      if (*(int *)(iVar1 + 0x34) < *(int *)(iVar1 + 0x3c)) {
        param_1 = 0;
        if (0 < *(int *)(iVar5 + 0x44)) {
          piStack_10 = (int *)(iVar1 + 8);
          do {
            iVar9 = *(int *)(iVar1 + 0x3c);
            uVar8 = *(uint *)(iVar5 + 0x24);
            iVar3 = *piStack_10;
            iVar2 = *(int *)(iVar1 + 0x34);
            for (iVar6 = iVar2; iVar6 < iVar9; iVar6 = iVar6 + 1) {
              puVar10 = *(undefined4 **)(iVar3 + -4 + iVar2 * 4);
              puVar12 = *(undefined4 **)(iVar3 + iVar6 * 4);
              for (uVar11 = uVar8 >> 2; uVar11 != 0; uVar11 = uVar11 - 1) {
                *puVar12 = *puVar10;
                puVar10 = puVar10 + 1;
                puVar12 = puVar12 + 1;
              }
              for (uVar11 = uVar8 & 3; uVar11 != 0; uVar11 = uVar11 - 1) {
                *(undefined1 *)puVar12 = *(undefined1 *)puVar10;
                puVar10 = (undefined4 *)((int)puVar10 + 1);
                puVar12 = (undefined4 *)((int)puVar12 + 1);
              }
            }
            param_1 = param_1 + 1;
            piStack_10 = piStack_10 + 1;
          } while (param_1 < *(int *)(iVar5 + 0x44));
        }
        *(undefined4 *)(iVar1 + 0x34) = *(undefined4 *)(iVar1 + 0x3c);
      }
    }
    if (*(int *)(iVar1 + 0x34) == *(int *)(iVar1 + 0x3c)) {
      (**(code **)(*(int *)(iVar5 + 0x15c) + 4))
                (iVar5,iVar1 + 8,*(undefined4 *)(iVar1 + 0x38),param_5,*param_6);
      *param_6 = *param_6 + 1;
      iVar9 = *(int *)(iVar1 + 0x38) + *(int *)(iVar5 + 0xe4);
      *(int *)(iVar1 + 0x38) = iVar9;
      if (iVar4 <= iVar9) {
        *(undefined4 *)(iVar1 + 0x38) = 0;
      }
      if (iVar4 <= *(int *)(iVar1 + 0x34)) {
        *(undefined4 *)(iVar1 + 0x34) = 0;
      }
      *(int *)(iVar1 + 0x3c) = *(int *)(iVar5 + 0xe4) + *(int *)(iVar1 + 0x34);
    }
    uVar8 = *param_6;
  } while( true );
}


