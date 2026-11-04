// 10048ad0 size=313 FUN_10048ad0

void FUN_10048ad0(int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined4 *puVar4;
  int *piVar5;
  uint uVar6;
  int iVar7;
  undefined4 *puVar8;
  undefined4 *puVar9;
  undefined4 *puStack_1c;
  int iStack_14;
  int iStack_10;
  undefined4 *puStack_c;
  
  iVar2 = param_1;
  iVar1 = *(int *)(param_1 + 0xe4);
  iVar7 = *(int *)(param_1 + 0x14c);
  iVar3 = (*(code *)**(undefined4 **)(param_1 + 4))
                    (param_1,1,*(int *)(param_1 + 0x44) * iVar1 * 0x14);
  iStack_10 = 0;
  if (0 < *(int *)(param_1 + 0x44)) {
    piVar5 = (int *)(*(int *)(param_1 + 0x4c) + 8);
    puStack_1c = (undefined4 *)(iVar3 + iVar1 * 4);
    puStack_c = (undefined4 *)(iVar7 + 8);
    param_1 = iVar3;
    do {
      puVar4 = (undefined4 *)
               (**(code **)(*(int *)(iVar2 + 4) + 8))
                         (iVar2,1,(piVar5[5] * *(int *)(iVar2 + 0xe0) * 8) / *piVar5,iVar1 * 3);
      puVar9 = puVar4;
      puVar8 = puStack_1c;
      for (uVar6 = (uint)(iVar1 * 0xc) >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
        *puVar8 = *puVar9;
        puVar9 = puVar9 + 1;
        puVar8 = puVar8 + 1;
      }
      for (iVar7 = 0; iVar7 != 0; iVar7 = iVar7 + -1) {
        *(undefined1 *)puVar8 = *(undefined1 *)puVar9;
        puVar9 = (undefined4 *)((int)puVar9 + 1);
        puVar8 = (undefined4 *)((int)puVar8 + 1);
      }
      if (0 < iVar1) {
        puVar8 = (undefined4 *)(iVar1 * 0x10 + param_1);
        puVar9 = puVar4 + iVar1 * 2;
        iVar7 = param_1 - (int)puVar4;
        iStack_14 = iVar1;
        do {
          *(undefined4 *)(iVar7 + (int)puVar4) = *puVar9;
          *puVar8 = *puVar4;
          puVar9 = puVar9 + 1;
          puVar4 = puVar4 + 1;
          puVar8 = puVar8 + 1;
          iStack_14 = iStack_14 + -1;
        } while (iStack_14 != 0);
      }
      *puStack_c = puStack_1c;
      puStack_1c = puStack_1c + iVar1 * 5;
      param_1 = param_1 + iVar1 * 0x14;
      puStack_c = puStack_c + 1;
      iStack_10 = iStack_10 + 1;
      piVar5 = piVar5 + 0x15;
    } while (iStack_10 < *(int *)(iVar2 + 0x44));
  }
  return;
}


