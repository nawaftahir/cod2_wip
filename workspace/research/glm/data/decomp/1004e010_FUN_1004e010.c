// 1004e010 size=757 FUN_1004e010

uint FUN_1004e010(void)

{
  byte bVar1;
  byte bVar2;
  undefined4 *puVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  int iVar7;
  byte *pbVar8;
  byte *pbVar9;
  int iVar10;
  int *unaff_ESI;
  uint *puVar11;
  int *piStack_10;
  int iStack_8;
  
  puVar3 = (undefined4 *)unaff_ESI[8];
  pbVar8 = (byte *)*puVar3;
  iVar10 = puVar3[1];
  if (*(char *)(unaff_ESI[0x67] + 0xd) == '\0') {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x3e;
    (**(code **)*unaff_ESI)();
  }
  if (iVar10 == 0) {
    uVar4 = (*(code *)puVar3[3])();
    if ((char)uVar4 == '\0') goto LAB_1004e271;
    iVar10 = puVar3[1];
    pbVar8 = (byte *)*puVar3;
  }
  bVar1 = *pbVar8;
  iVar10 = iVar10 + -1;
  pbVar8 = pbVar8 + 1;
  if (iVar10 == 0) {
    uVar4 = (*(code *)puVar3[3])();
    if ((char)uVar4 == '\0') goto LAB_1004e271;
    iVar10 = puVar3[1];
    pbVar8 = (byte *)*puVar3;
  }
  bVar2 = *pbVar8;
  iVar10 = iVar10 + -1;
  pbVar8 = pbVar8 + 1;
  if (iVar10 == 0) {
    uVar4 = (*(code *)puVar3[3])();
    if ((char)uVar4 == '\0') goto LAB_1004e271;
    iVar10 = puVar3[1];
    pbVar8 = (byte *)*puVar3;
  }
  uVar5 = (uint)*pbVar8;
  *(undefined4 *)(*unaff_ESI + 0x14) = 0x67;
  *(uint *)(*unaff_ESI + 0x18) = uVar5;
  iVar10 = iVar10 + -1;
  pbVar8 = pbVar8 + 1;
  (**(code **)(*unaff_ESI + 4))();
  if ((((uint)bVar1 * 0x100 + (uint)bVar2 != uVar5 * 2 + 6) || (uVar5 == 0)) || (4 < uVar5)) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0xb;
    (**(code **)*unaff_ESI)();
  }
  unaff_ESI[0x4b] = uVar5;
  iStack_8 = 0;
  if (uVar5 != 0) {
    piStack_10 = unaff_ESI + 0x4c;
    do {
      if (iVar10 == 0) {
        uVar4 = (*(code *)puVar3[3])();
        if ((char)uVar4 == '\0') goto LAB_1004e271;
        iVar10 = puVar3[1];
        pbVar8 = (byte *)*puVar3;
      }
      uVar6 = (uint)*pbVar8;
      iVar10 = iVar10 + -1;
      pbVar8 = pbVar8 + 1;
      if (iVar10 == 0) {
        uVar4 = (*(code *)puVar3[3])();
        if ((char)uVar4 == '\0') goto LAB_1004e271;
        iVar10 = puVar3[1];
        pbVar8 = (byte *)*puVar3;
      }
      puVar11 = (uint *)unaff_ESI[0x33];
      iVar10 = iVar10 + -1;
      bVar1 = *pbVar8;
      pbVar8 = pbVar8 + 1;
      iVar7 = 0;
      if (0 < unaff_ESI[0xb]) {
        do {
          if (uVar6 == *puVar11) goto LAB_1004e1ae;
          iVar7 = iVar7 + 1;
          puVar11 = puVar11 + 0x15;
        } while (iVar7 < unaff_ESI[0xb]);
      }
      *(undefined4 *)(*unaff_ESI + 0x14) = 5;
      *(uint *)(*unaff_ESI + 0x18) = uVar6;
      (**(code **)*unaff_ESI)();
LAB_1004e1ae:
      *piStack_10 = (int)puVar11;
      puVar11[5] = (int)(uint)bVar1 >> 4;
      puVar11[6] = bVar1 & 0xf;
      iVar7 = *unaff_ESI;
      *(uint *)(iVar7 + 0x18) = uVar6;
      *(uint *)(iVar7 + 0x1c) = puVar11[5];
      *(uint *)(iVar7 + 0x20) = puVar11[6];
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x68;
      (**(code **)(*unaff_ESI + 4))();
      iStack_8 = iStack_8 + 1;
      piStack_10 = piStack_10 + 1;
    } while (iStack_8 < (int)uVar5);
  }
  if (iVar10 == 0) {
    uVar4 = (*(code *)puVar3[3])();
    if ((char)uVar4 == '\0') goto LAB_1004e271;
    iVar10 = puVar3[1];
    pbVar8 = (byte *)*puVar3;
  }
  iVar10 = iVar10 + -1;
  pbVar9 = pbVar8 + 1;
  unaff_ESI[0x5d] = (uint)*pbVar8;
  if (iVar10 == 0) {
    uVar4 = (*(code *)puVar3[3])();
    if ((char)uVar4 == '\0') goto LAB_1004e271;
    iVar10 = puVar3[1];
    pbVar9 = (byte *)*puVar3;
  }
  iVar10 = iVar10 + -1;
  pbVar8 = pbVar9 + 1;
  unaff_ESI[0x5e] = (uint)*pbVar9;
  if (iVar10 == 0) {
    uVar4 = (*(code *)puVar3[3])();
    if ((char)uVar4 == '\0') {
LAB_1004e271:
      return uVar4 & 0xffffff00;
    }
    iVar10 = puVar3[1];
    pbVar8 = (byte *)*puVar3;
  }
  bVar1 = *pbVar8;
  unaff_ESI[0x60] = bVar1 & 0xf;
  iVar7 = *unaff_ESI;
  unaff_ESI[0x5f] = (int)(uint)bVar1 >> 4;
  *(int *)(iVar7 + 0x18) = unaff_ESI[0x5d];
  *(int *)(iVar7 + 0x1c) = unaff_ESI[0x5e];
  *(int *)(iVar7 + 0x20) = unaff_ESI[0x5f];
  *(int *)(iVar7 + 0x24) = unaff_ESI[0x60];
  *(undefined4 *)(*unaff_ESI + 0x14) = 0x69;
  (**(code **)(*unaff_ESI + 4))();
  *(undefined4 *)(unaff_ESI[0x67] + 0x10) = 0;
  iVar7 = unaff_ESI[0x21];
  unaff_ESI[0x21] = iVar7 + 1;
  *puVar3 = pbVar8 + 1;
  puVar3[1] = iVar10 + -1;
  return CONCAT31((int3)((uint)(iVar7 + 1) >> 8),1);
}


