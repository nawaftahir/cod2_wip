// 100029c0 size=1000 FUN_100029c0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_100029c0(int *param_1)

{
  ushort uVar1;
  short sVar2;
  undefined2 uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  uint uVar7;
  undefined4 *puVar8;
  undefined4 *puVar9;
  short *psVar10;
  int iVar11;
  int iVar12;
  int iVar13;
  undefined2 *puVar14;
  int iStack_28;
  int iStack_24;
  undefined4 *puStack_20;
  int iStack_14;
  
  iVar4 = FUN_10001940();
  iVar5 = *(int *)(*param_1 + 0x44) + param_1[1];
  if (iVar4 == 0) {
    FUN_100138c0(1,&DAT_101919a8,DAT_101ae288);
  }
  iVar6 = FUN_10001940();
  if (iVar6 == 0) {
    FUN_100138c0(1,&DAT_1019198c,DAT_101ae288);
  }
  iVar13 = *(int *)(*param_1 + 0x4c) + param_1[1];
  DAT_101ae2b0 = iVar6;
  DAT_101ae2b4 = (*(code *)RI_Hunk_AllocInternal)(iVar6 * 0x44);
  if (0 < iVar6) {
    puVar8 = (undefined4 *)(DAT_101ae2b4 + 0x40);
    puVar9 = (undefined4 *)(iVar13 + 0x34);
    iVar11 = DAT_101ae2b4 - iVar13;
    do {
      puVar8[-0x10] = puVar9[-0xd];
      puVar8[-0xf] = puVar9[-0xc];
      puVar8[-0xe] = puVar9[-0xb];
      puVar8[-10] = puVar9[-7];
      puVar8[-9] = puVar9[-6];
      puVar8[-8] = puVar9[-5];
      puVar8[-7] = puVar9[-4];
      puVar8[-6] = puVar9[-3];
      puVar8[-2] = puVar9[-2];
      puVar8[-1] = puVar9[-1];
      *puVar8 = *puVar9;
      puVar8[-5] = puVar9[1];
      puVar8[-4] = puVar9[2];
      *(undefined4 *)(iVar11 + (int)puVar9) = puVar9[3];
      puVar8[-0xd] = puVar9[-10];
      puVar8[-0xc] = puVar9[-9];
      puVar8[-0xb] = puVar9[-8];
      puVar8 = puVar8 + 0x11;
      puVar9 = puVar9 + 0x11;
      iVar6 = iVar6 + -1;
    } while (iVar6 != 0);
  }
  iVar6 = *param_1;
  if (param_1[2] < *(int *)(iVar6 + 0x54) + *(int *)(iVar6 + 0x50)) {
    FUN_100138c0(1,&DAT_10191ac4,DAT_101ae288);
  }
  if (*(int *)(iVar6 + 0x54) < 4) {
    FUN_100138c0(1,&DAT_10191aa0,DAT_101ae288);
  }
  iVar6 = *(int *)(iVar6 + 0x50);
  if ((iVar6 < 0) || ((iVar6 / 2) * 2 - iVar6 != 0)) {
    FUN_100138c0(1,&DAT_10191a80,DAT_101ae288);
  }
  iVar6 = *(int *)(*param_1 + 0x54);
  iVar11 = param_1[1];
  DAT_101ae298 = iVar4;
  DAT_101ae29c = (*(code *)RI_Hunk_AllocInternal)(iVar4 * 0xc);
  uVar7 = 0;
  if (0 < iVar4) {
    psVar10 = (short *)(iVar5 + 10);
    iVar12 = iVar4;
    do {
      uVar7 = uVar7 + 0x1f + *psVar10 * 2 & 0xffffffe0;
      psVar10 = psVar10 + 8;
      iVar12 = iVar12 + -1;
    } while (iVar12 != 0);
  }
  iStack_28 = (*(code *)RI_Hunk_AllocInternal)(uVar7);
  puVar8 = (undefined4 *)(*(code *)RI_Hunk_AllocInternal)(iVar4 * 0x28);
  puStack_20 = (undefined4 *)0x0;
  DAT_101ae2a0 = 0;
  iStack_24 = 0;
  if (0 < iVar4) {
    iStack_14 = 0;
    puVar14 = (undefined2 *)(iVar5 + 8);
    do {
      puVar8[7] = *(undefined4 *)(puVar14 + -2);
      *(undefined2 *)(puVar8 + 8) = *puVar14;
      *puVar8 = 6;
      uVar1 = puVar14[1];
      *(ushort *)((int)puVar8 + 0x22) = uVar1;
      puVar8[9] = iStack_28;
      FUN_1005eaf0(iStack_28,iVar6 + iVar11 + *(int *)(puVar14 + 2) * 2,(uint)uVar1 << 1);
      sVar2 = puVar14[-3];
      FUN_100026c0(iVar13);
      puVar9 = (undefined4 *)FUN_10017100(9);
      *(undefined4 **)(iStack_14 + DAT_101ae29c) = puVar9;
      uVar3 = FUN_100027c0(*(undefined4 *)(iStack_14 + DAT_101ae29c));
      *(undefined2 *)(iStack_14 + 6 + DAT_101ae29c) = uVar3;
      *(undefined4 **)(iStack_14 + 8 + DAT_101ae29c) = puVar8;
      *(short *)(iStack_14 + 4 + DAT_101ae29c) = (short)param_1[sVar2 * 5 + 5];
      iStack_28 = iStack_28 + ((uint)*(ushort *)((int)puVar8 + 0x22) * 2 + 0x1f & 0xffffffe0);
      if ((*(byte *)(puVar9 + 3) & 8) != 0) {
        if ((puStack_20 != (undefined4 *)0x0) && (puStack_20 != puVar9)) {
          FUN_10061cd0(1,
                       "map has at least two different skies: %s and %s\nOnly one sky per map is supported\n"
                       ,*puVar9,*puStack_20);
        }
        DAT_101ae2a0 = DAT_101ae2a0 + 1;
        puStack_20 = puVar9;
      }
      iStack_24 = iStack_24 + 1;
      iStack_14 = iStack_14 + 0xc;
      puVar14 = puVar14 + 8;
      puVar8 = puVar8 + 10;
    } while (iStack_24 < iVar4);
    if (DAT_101ae2a0 != 0) {
      FUN_10002940();
      DAT_101ae2a4 = (*(code *)RI_Hunk_AllocInternal)(DAT_101ae2a0 << 2);
      iVar6 = 0;
      DAT_101ae2a0 = 0;
      iVar5 = 0;
      do {
        if (*(undefined4 **)(iVar6 + DAT_101ae29c) == puStack_20) {
          *(int *)(DAT_101ae2a4 + DAT_101ae2a0 * 4) = iVar5;
          DAT_101ae2a0 = DAT_101ae2a0 + 1;
        }
        iVar5 = iVar5 + 1;
        iVar6 = iVar6 + 0xc;
      } while (iVar5 < iVar4);
      goto LAB_10002d7c;
    }
  }
  _DAT_101ae2a8 = 0;
  DAT_101ae2a4 = 0;
LAB_10002d7c:
  FUN_10002840();
  _DAT_101ae2b8 = FUN_10001050(DAT_101ae2b4);
  return;
}


