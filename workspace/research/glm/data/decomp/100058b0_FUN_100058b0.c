// 100058b0 size=184 FUN_100058b0

void FUN_100058b0(int param_1)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined4 *puVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  
  iVar5 = 0;
  iVar3 = DAT_101ae504;
  puVar7 = DAT_101ae500;
  if (0 < DAT_101ae504) {
    iVar4 = 0;
    do {
      iVar1 = DAT_10678504 - *(int *)(iVar4 + 0x20 + (int)puVar7);
      if ((iVar1 < 0) || ((int)((undefined4 *)(iVar4 + (int)puVar7))[9] < iVar1)) {
        DAT_101ae504 = iVar3 + -1;
        puVar6 = puVar7 + DAT_101ae504 * 10;
        puVar8 = (undefined4 *)(iVar4 + (int)puVar7);
        for (iVar1 = 10; iVar3 = DAT_101ae504, puVar7 = DAT_101ae500, iVar1 != 0; iVar1 = iVar1 + -1
            ) {
          *puVar8 = *puVar6;
          puVar6 = puVar6 + 1;
          puVar8 = puVar8 + 1;
        }
      }
      else {
        iVar5 = iVar5 + 1;
        iVar4 = iVar4 + 0x28;
      }
    } while (iVar5 < iVar3);
  }
  if (puVar7 == (undefined4 *)0x0) {
    *(int *)(param_1 + 0x4c) = iVar3;
    return;
  }
  if (*(int *)(param_1 + 0x48) == 0) {
    uVar2 = (*(code *)RI_Z_MallocInternal)(DAT_101ae508 * 0x28);
    *(undefined4 *)(param_1 + 0x48) = uVar2;
    iVar3 = DAT_101ae504;
    puVar7 = DAT_101ae500;
  }
  puVar6 = *(undefined4 **)(param_1 + 0x48);
  for (iVar3 = (iVar3 * 5 & 0x1fffffffU) << 1; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar6 = *puVar7;
    puVar7 = puVar7 + 1;
    puVar6 = puVar6 + 1;
  }
  for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
    *(undefined1 *)puVar6 = *(undefined1 *)puVar7;
    puVar7 = (undefined4 *)((int)puVar7 + 1);
    puVar6 = (undefined4 *)((int)puVar6 + 1);
  }
  *(int *)(param_1 + 0x4c) = DAT_101ae504;
  return;
}


