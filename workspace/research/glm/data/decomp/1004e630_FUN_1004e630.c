// 1004e630 size=618 FUN_1004e630

undefined4 FUN_1004e630(void)

{
  undefined1 uVar1;
  byte bVar2;
  undefined4 *puVar3;
  int iVar4;
  int iVar5;
  char cVar6;
  int iVar7;
  int iVar8;
  ushort uVar9;
  int iVar10;
  undefined1 *puVar11;
  byte *pbVar12;
  uint uVar13;
  ushort *puVar14;
  int *unaff_EDI;
  int *piStack_c;
  
  puVar3 = (undefined4 *)unaff_EDI[8];
  iVar10 = puVar3[1];
  puVar11 = (undefined1 *)*puVar3;
  if (iVar10 == 0) {
    cVar6 = (*(code *)puVar3[3])();
    if (cVar6 == '\0') {
      return 0;
    }
    puVar11 = (undefined1 *)*puVar3;
    iVar10 = puVar3[1];
  }
  uVar1 = *puVar11;
  iVar10 = iVar10 + -1;
  puVar11 = puVar11 + 1;
  if (iVar10 == 0) {
    cVar6 = (*(code *)puVar3[3])();
    if (cVar6 == '\0') {
      return 0;
    }
    puVar11 = (undefined1 *)*puVar3;
    iVar10 = puVar3[1];
  }
  iVar10 = iVar10 + -1;
  pbVar12 = puVar11 + 1;
  iVar8 = CONCAT11(uVar1,*puVar11) - 2;
  do {
    iVar5 = iVar8;
    if (iVar5 < 1) {
      if (iVar5 != 0) {
        *(undefined4 *)(*unaff_EDI + 0x14) = 0xb;
        (**(code **)*unaff_EDI)();
      }
      *puVar3 = pbVar12;
      puVar3[1] = iVar10;
      return 1;
    }
    if (iVar10 == 0) {
      cVar6 = (*(code *)puVar3[3])();
      if (cVar6 == '\0') {
        return 0;
      }
      pbVar12 = (byte *)*puVar3;
      iVar10 = puVar3[1];
    }
    bVar2 = *pbVar12;
    *(undefined4 *)(*unaff_EDI + 0x14) = 0x51;
    iVar7 = (int)(uint)bVar2 >> 4;
    uVar13 = bVar2 & 0xf;
    *(uint *)(*unaff_EDI + 0x18) = uVar13;
    *(int *)(*unaff_EDI + 0x1c) = iVar7;
    iVar10 = iVar10 + -1;
    pbVar12 = pbVar12 + 1;
    (**(code **)(*unaff_EDI + 4))();
    if (3 < uVar13) {
      *(undefined4 *)(*unaff_EDI + 0x14) = 0x1f;
      *(uint *)(*unaff_EDI + 0x18) = uVar13;
      (**(code **)*unaff_EDI)();
    }
    if (unaff_EDI[uVar13 + 0x26] == 0) {
      iVar8 = (**(code **)unaff_EDI[1])();
      *(undefined1 *)(iVar8 + 0x80) = 0;
      unaff_EDI[uVar13 + 0x26] = iVar8;
    }
    iVar8 = unaff_EDI[uVar13 + 0x26];
    piStack_c = &DAT_10191200;
    do {
      if (iVar7 == 0) {
        if (iVar10 == 0) {
          cVar6 = (*(code *)puVar3[3])();
          if (cVar6 == '\0') {
            return 0;
          }
          pbVar12 = (byte *)*puVar3;
          iVar10 = puVar3[1];
        }
        uVar9 = (ushort)*pbVar12;
      }
      else {
        if (iVar10 == 0) {
          cVar6 = (*(code *)puVar3[3])();
          if (cVar6 == '\0') {
            return 0;
          }
          pbVar12 = (byte *)*puVar3;
          iVar10 = puVar3[1];
        }
        bVar2 = *pbVar12;
        iVar10 = iVar10 + -1;
        pbVar12 = pbVar12 + 1;
        if (iVar10 == 0) {
          cVar6 = (*(code *)puVar3[3])();
          if (cVar6 == '\0') {
            return 0;
          }
          pbVar12 = (byte *)*puVar3;
          iVar10 = puVar3[1];
        }
        uVar9 = (ushort)bVar2 * 0x100 + (ushort)*pbVar12;
      }
      iVar4 = *piStack_c;
      iVar10 = iVar10 + -1;
      piStack_c = piStack_c + 1;
      pbVar12 = pbVar12 + 1;
      *(ushort *)(iVar8 + iVar4 * 2) = uVar9;
    } while ((int)piStack_c < 0x10191300);
    if (1 < *(int *)(*unaff_EDI + 0x68)) {
      puVar14 = (ushort *)(iVar8 + 4);
      piStack_c = (int *)0x8;
      do {
        iVar8 = *unaff_EDI;
        *(uint *)(iVar8 + 0x18) = (uint)puVar14[-2];
        *(uint *)(iVar8 + 0x1c) = (uint)puVar14[-1];
        *(uint *)(iVar8 + 0x20) = (uint)*puVar14;
        *(uint *)(iVar8 + 0x24) = (uint)puVar14[1];
        *(uint *)(iVar8 + 0x28) = (uint)puVar14[2];
        *(uint *)(iVar8 + 0x2c) = (uint)puVar14[3];
        *(uint *)(iVar8 + 0x30) = (uint)puVar14[4];
        *(uint *)(iVar8 + 0x34) = (uint)puVar14[5];
        *(undefined4 *)(*unaff_EDI + 0x14) = 0x5d;
        (**(code **)(*unaff_EDI + 4))();
        puVar14 = puVar14 + 8;
        piStack_c = (int *)((int)piStack_c + -1);
      } while (piStack_c != (int *)0x0);
    }
    iVar8 = iVar5 + -0x41;
    if (iVar7 != 0) {
      iVar8 = iVar5 + -0x81;
    }
  } while( true );
}


