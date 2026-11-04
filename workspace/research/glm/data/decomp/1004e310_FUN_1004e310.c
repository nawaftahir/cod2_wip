// 1004e310 size=795 FUN_1004e310

undefined4 FUN_1004e310(int *param_1)

{
  undefined1 uVar1;
  byte bVar2;
  undefined4 *puVar3;
  uint *puVar4;
  char cVar5;
  int iVar6;
  uint uVar7;
  undefined1 *puVar8;
  byte *pbVar9;
  int *piVar10;
  byte *pbVar11;
  int iVar12;
  undefined4 *puVar13;
  int iStack_128;
  int iStack_120;
  undefined4 uStack_11c;
  uint uStack_118;
  uint uStack_114;
  uint uStack_110;
  byte bStack_10c;
  undefined4 *local_108;
  uint uStack_104;
  byte abStack_100 [256];
  
  puVar3 = (undefined4 *)param_1[8];
  iStack_128 = puVar3[1];
  puVar8 = (undefined1 *)*puVar3;
  local_108 = puVar3;
  if (iStack_128 == 0) {
    cVar5 = (*(code *)puVar3[3])(param_1);
    if (cVar5 == '\0') {
      return 0;
    }
    iStack_128 = puVar3[1];
    puVar8 = (undefined1 *)*puVar3;
  }
  uVar1 = *puVar8;
  iStack_128 = iStack_128 + -1;
  puVar8 = puVar8 + 1;
  if (iStack_128 == 0) {
    cVar5 = (*(code *)puVar3[3])(param_1);
    if (cVar5 == '\0') {
      return 0;
    }
    iStack_128 = puVar3[1];
    puVar8 = (undefined1 *)*puVar3;
  }
  iStack_128 = iStack_128 + -1;
  iVar6 = CONCAT11(uVar1,*puVar8) - 2;
  pbVar9 = puVar8 + 1;
  do {
    if (iVar6 < 0x11) {
      if (iVar6 != 0) {
        *(undefined4 *)(*param_1 + 0x14) = 0xb;
        (**(code **)*param_1)(param_1);
      }
      *puVar3 = pbVar9;
      puVar3[1] = iStack_128;
      return 1;
    }
    if (iStack_128 == 0) {
      cVar5 = (*(code *)puVar3[3])(param_1);
      if (cVar5 == '\0') {
        return 0;
      }
      iStack_128 = puVar3[1];
      pbVar9 = (byte *)*puVar3;
    }
    uStack_104 = (uint)*pbVar9;
    *(undefined4 *)(*param_1 + 0x14) = 0x50;
    *(uint *)(*param_1 + 0x18) = uStack_104;
    iStack_128 = iStack_128 + -1;
    pbVar9 = pbVar9 + 1;
    (**(code **)(*param_1 + 4))(param_1,1);
    uStack_11c = uStack_11c & 0xffffff00;
    iStack_120 = 0;
    iVar12 = 1;
    do {
      puVar3 = local_108;
      if (iStack_128 == 0) {
        cVar5 = (*(code *)local_108[3])(param_1);
        if (cVar5 == '\0') {
          return 0;
        }
        iStack_128 = puVar3[1];
        pbVar9 = (byte *)*puVar3;
      }
      bVar2 = *pbVar9;
      *(byte *)((int)&uStack_11c + iVar12) = bVar2;
      iStack_128 = iStack_128 + -1;
      iStack_120 = iStack_120 + (uint)bVar2;
      pbVar9 = pbVar9 + 1;
      iVar12 = iVar12 + 1;
    } while (iVar12 < 0x11);
    iVar12 = *param_1;
    *(uint *)(iVar12 + 0x18) = uStack_11c >> 8 & 0xff;
    *(uint *)(iVar12 + 0x1c) = uStack_11c >> 0x10 & 0xff;
    *(uint *)(iVar12 + 0x20) = uStack_11c >> 0x18;
    *(uint *)(iVar12 + 0x24) = uStack_118 & 0xff;
    *(uint *)(iVar12 + 0x28) = uStack_118 >> 8 & 0xff;
    *(uint *)(iVar12 + 0x2c) = uStack_118 >> 0x10 & 0xff;
    *(uint *)(iVar12 + 0x30) = uStack_118 >> 0x18;
    *(uint *)(iVar12 + 0x34) = uStack_114 & 0xff;
    *(undefined4 *)(*param_1 + 0x14) = 0x56;
    (**(code **)(*param_1 + 4))(param_1,2);
    iVar12 = *param_1;
    *(uint *)(iVar12 + 0x18) = uStack_114 >> 8 & 0xff;
    *(uint *)(iVar12 + 0x1c) = uStack_114 >> 0x10 & 0xff;
    *(uint *)(iVar12 + 0x20) = uStack_114 >> 0x18;
    *(uint *)(iVar12 + 0x24) = uStack_110 & 0xff;
    *(uint *)(iVar12 + 0x28) = uStack_110 >> 8 & 0xff;
    *(uint *)(iVar12 + 0x2c) = uStack_110 >> 0x10 & 0xff;
    *(uint *)(iVar12 + 0x30) = uStack_110 >> 0x18;
    *(uint *)(iVar12 + 0x34) = (uint)bStack_10c;
    *(undefined4 *)(*param_1 + 0x14) = 0x56;
    (**(code **)(*param_1 + 4))(param_1,2);
    if ((0x100 < iStack_120) || (iVar6 + -0x11 < iStack_120)) {
      *(undefined4 *)(*param_1 + 0x14) = 8;
      (**(code **)*param_1)(param_1);
    }
    iVar12 = 0;
    if (0 < iStack_120) {
      do {
        puVar3 = local_108;
        if (iStack_128 == 0) {
          cVar5 = (*(code *)local_108[3])(param_1);
          if (cVar5 == '\0') {
            return 0;
          }
          iStack_128 = puVar3[1];
          pbVar9 = (byte *)*puVar3;
        }
        bVar2 = *pbVar9;
        iStack_128 = iStack_128 + -1;
        pbVar9 = pbVar9 + 1;
        abStack_100[iVar12] = bVar2;
        iVar12 = iVar12 + 1;
      } while (iVar12 < iStack_120);
    }
    iVar6 = (iVar6 + -0x11) - iStack_120;
    if ((uStack_104 & 0x10) == 0) {
      iVar12 = uStack_104 + 0x2a;
      uVar7 = uStack_104;
    }
    else {
      iVar12 = uStack_104 + 0x1e;
      uVar7 = uStack_104 - 0x10;
    }
    piVar10 = param_1 + iVar12;
    if (((int)uVar7 < 0) || (3 < (int)uVar7)) {
      *(undefined4 *)(*param_1 + 0x14) = 0x1e;
      *(uint *)(*param_1 + 0x18) = uVar7;
      (**(code **)*param_1)(param_1);
    }
    if (*piVar10 == 0) {
      iVar12 = (**(code **)param_1[1])(param_1,0,0x112);
      *(undefined1 *)(iVar12 + 0x111) = 0;
      *piVar10 = iVar12;
    }
    puVar4 = (uint *)*piVar10;
    *puVar4 = uStack_11c;
    puVar4[1] = uStack_118;
    puVar4[2] = uStack_114;
    puVar4[3] = uStack_110;
    *(byte *)(puVar4 + 4) = bStack_10c;
    pbVar11 = abStack_100;
    puVar13 = (undefined4 *)(*piVar10 + 0x11);
    for (iVar12 = 0x40; puVar3 = local_108, iVar12 != 0; iVar12 = iVar12 + -1) {
      *puVar13 = *(undefined4 *)pbVar11;
      pbVar11 = pbVar11 + 4;
      puVar13 = puVar13 + 1;
    }
  } while( true );
}


