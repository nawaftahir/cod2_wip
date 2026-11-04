// 1004dd00 size=777 FUN_1004dd00

uint FUN_1004dd00(void)

{
  byte bVar1;
  byte bVar2;
  undefined4 *puVar3;
  undefined1 in_AL;
  uint uVar4;
  int iVar5;
  undefined1 in_CL;
  int iVar6;
  uint *puVar7;
  int *unaff_ESI;
  byte *pbVar8;
  byte *pbVar9;
  uint local_8;
  
  puVar3 = (undefined4 *)unaff_ESI[8];
  iVar6 = puVar3[1];
  pbVar8 = (byte *)*puVar3;
  *(undefined1 *)(unaff_ESI + 0x34) = in_AL;
  *(undefined1 *)((int)unaff_ESI + 0xd1) = in_CL;
  if (iVar6 == 0) {
    uVar4 = (*(code *)puVar3[3])();
    if ((char)uVar4 == '\0') goto LAB_1004e000;
    pbVar8 = (byte *)*puVar3;
    iVar6 = puVar3[1];
  }
  bVar1 = *pbVar8;
  iVar6 = iVar6 + -1;
  pbVar8 = pbVar8 + 1;
  if (iVar6 == 0) {
    uVar4 = (*(code *)puVar3[3])();
    if ((char)uVar4 == '\0') goto LAB_1004e000;
    pbVar8 = (byte *)*puVar3;
    iVar6 = puVar3[1];
  }
  bVar2 = *pbVar8;
  iVar6 = iVar6 + -1;
  pbVar8 = pbVar8 + 1;
  if (iVar6 == 0) {
    uVar4 = (*(code *)puVar3[3])();
    if ((char)uVar4 == '\0') goto LAB_1004e000;
    pbVar8 = (byte *)*puVar3;
    iVar6 = puVar3[1];
  }
  iVar6 = iVar6 + -1;
  pbVar9 = pbVar8 + 1;
  unaff_ESI[0x32] = (uint)*pbVar8;
  if (iVar6 == 0) {
    uVar4 = (*(code *)puVar3[3])();
    if ((char)uVar4 == '\0') goto LAB_1004e000;
    pbVar9 = (byte *)*puVar3;
    iVar6 = puVar3[1];
  }
  iVar6 = iVar6 + -1;
  pbVar8 = pbVar9 + 1;
  unaff_ESI[10] = (uint)*pbVar9 << 8;
  if (iVar6 == 0) {
    uVar4 = (*(code *)puVar3[3])();
    if ((char)uVar4 == '\0') goto LAB_1004e000;
    pbVar8 = (byte *)*puVar3;
    iVar6 = puVar3[1];
  }
  iVar6 = iVar6 + -1;
  pbVar9 = pbVar8 + 1;
  unaff_ESI[10] = unaff_ESI[10] + (uint)*pbVar8;
  if (iVar6 == 0) {
    uVar4 = (*(code *)puVar3[3])();
    if ((char)uVar4 == '\0') goto LAB_1004e000;
    pbVar9 = (byte *)*puVar3;
    iVar6 = puVar3[1];
  }
  iVar6 = iVar6 + -1;
  pbVar8 = pbVar9 + 1;
  unaff_ESI[9] = (uint)*pbVar9 << 8;
  if (iVar6 == 0) {
    uVar4 = (*(code *)puVar3[3])();
    if ((char)uVar4 == '\0') goto LAB_1004e000;
    pbVar8 = (byte *)*puVar3;
    iVar6 = puVar3[1];
  }
  iVar6 = iVar6 + -1;
  pbVar9 = pbVar8 + 1;
  unaff_ESI[9] = unaff_ESI[9] + (uint)*pbVar8;
  if (iVar6 == 0) {
    uVar4 = (*(code *)puVar3[3])();
    if ((char)uVar4 == '\0') {
LAB_1004e000:
      return uVar4 & 0xffffff00;
    }
    pbVar9 = (byte *)*puVar3;
    iVar6 = puVar3[1];
  }
  unaff_ESI[0xb] = (uint)*pbVar9;
  iVar5 = *unaff_ESI;
  *(int *)(iVar5 + 0x18) = unaff_ESI[0x61];
  *(int *)(iVar5 + 0x1c) = unaff_ESI[9];
  *(int *)(iVar5 + 0x20) = unaff_ESI[10];
  *(int *)(iVar5 + 0x24) = unaff_ESI[0xb];
  *(undefined4 *)(*unaff_ESI + 0x14) = 100;
  iVar6 = iVar6 + -1;
  pbVar9 = pbVar9 + 1;
  (**(code **)(*unaff_ESI + 4))();
  if (*(char *)(unaff_ESI[0x67] + 0xd) != '\0') {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x3a;
    (**(code **)*unaff_ESI)();
  }
  if (((unaff_ESI[10] == 0) || (unaff_ESI[9] == 0)) || (unaff_ESI[0xb] < 1)) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x20;
    (**(code **)*unaff_ESI)();
  }
  if ((uint)bVar1 * 0x100 + (uint)bVar2 + -8 != unaff_ESI[0xb] * 3) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0xb;
    (**(code **)*unaff_ESI)();
  }
  if (unaff_ESI[0x33] == 0) {
    iVar5 = (**(code **)unaff_ESI[1])();
    unaff_ESI[0x33] = iVar5;
  }
  puVar7 = (uint *)unaff_ESI[0x33];
  local_8 = 0;
  if (0 < unaff_ESI[0xb]) {
    do {
      puVar7[1] = local_8;
      if (iVar6 == 0) {
        uVar4 = (*(code *)puVar3[3])();
        if ((char)uVar4 == '\0') goto LAB_1004e000;
        pbVar9 = (byte *)*puVar3;
        iVar6 = puVar3[1];
      }
      iVar6 = iVar6 + -1;
      pbVar8 = pbVar9 + 1;
      *puVar7 = (uint)*pbVar9;
      if (iVar6 == 0) {
        uVar4 = (*(code *)puVar3[3])();
        if ((char)uVar4 == '\0') goto LAB_1004e000;
        pbVar8 = (byte *)*puVar3;
        iVar6 = puVar3[1];
      }
      bVar1 = *pbVar8;
      iVar6 = iVar6 + -1;
      pbVar8 = pbVar8 + 1;
      puVar7[2] = (int)(uint)bVar1 >> 4;
      puVar7[3] = bVar1 & 0xf;
      if (iVar6 == 0) {
        uVar4 = (*(code *)puVar3[3])();
        if ((char)uVar4 == '\0') goto LAB_1004e000;
        pbVar8 = (byte *)*puVar3;
        iVar6 = puVar3[1];
      }
      puVar7[4] = (uint)*pbVar8;
      iVar5 = *unaff_ESI;
      *(uint *)(iVar5 + 0x18) = *puVar7;
      *(uint *)(iVar5 + 0x1c) = puVar7[2];
      *(uint *)(iVar5 + 0x20) = puVar7[3];
      *(uint *)(iVar5 + 0x24) = puVar7[4];
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x65;
      iVar6 = iVar6 + -1;
      pbVar9 = pbVar8 + 1;
      (**(code **)(*unaff_ESI + 4))();
      local_8 = local_8 + 1;
      puVar7 = puVar7 + 0x15;
    } while ((int)local_8 < unaff_ESI[0xb]);
  }
  *(undefined1 *)(unaff_ESI[0x67] + 0xd) = 1;
  *puVar3 = pbVar9;
  puVar3[1] = iVar6;
  return CONCAT31((int3)((uint)puVar3 >> 8),1);
}


