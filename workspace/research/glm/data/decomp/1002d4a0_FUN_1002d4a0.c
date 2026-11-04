// 1002d4a0 size=1519 FUN_1002d4a0

undefined1 * FUN_1002d4a0(int param_1,int param_2,int *param_3,code *param_4)

{
  uint *puVar1;
  byte bVar2;
  undefined2 uVar3;
  short sVar4;
  short *psVar5;
  byte *pbVar6;
  int *piVar7;
  undefined1 *puVar8;
  int iVar9;
  undefined4 *puVar10;
  undefined4 uVar11;
  int iVar12;
  uint uVar13;
  undefined4 *puVar14;
  undefined2 *puVar15;
  int iStack_10;
  
  piVar7 = param_3;
  puVar8 = (undefined1 *)(*param_4)(0x18);
  *(int *)(param_1 + 0x84) = *(int *)(param_1 + 0x84) + 0x18;
  *puVar8 = *(undefined1 *)*param_3;
  iVar12 = *param_3;
  puVar15 = (undefined2 *)(iVar12 + 1);
  *param_3 = (int)puVar15;
  uVar3 = *puVar15;
  *param_3 = iVar12 + 3;
  *(undefined2 *)(puVar8 + 2) = uVar3;
  uVar3 = *(undefined2 *)*param_3;
  *param_3 = (int)((undefined2 *)*param_3 + 1);
  *(undefined2 *)(puVar8 + 4) = uVar3;
  psVar5 = (short *)*param_3;
  sVar4 = *psVar5;
  iVar12 = (int)sVar4;
  *param_3 = (int)(psVar5 + 1);
  if (iVar12 == -1) {
    sVar4 = psVar5[1];
    *param_3 = (int)(psVar5 + 2);
    *(undefined2 *)(puVar8 + 6) = 0xffff;
    iVar9 = ((int)sVar4 + *(short *)(puVar8 + 2) * 4) * 0x10;
  }
  else {
    *(short *)(puVar8 + 6) = (short)(iVar12 << 6);
    puVar1 = (uint *)(param_2 + (iVar12 >> 5) * 4);
    *puVar1 = *puVar1 | 1 << ((byte)sVar4 & 0x1f);
    iVar9 = (int)*(short *)(puVar8 + 2) << 6;
  }
  puVar10 = (undefined4 *)(*param_4)(iVar9);
  *(int *)(param_1 + 0x84) = *(int *)(param_1 + 0x84) + iVar9;
  *(undefined4 **)(puVar8 + 0xc) = puVar10;
  iStack_10 = 0;
  if (0 < *(short *)(puVar8 + 2)) {
    do {
      uVar11 = *(undefined4 *)*piVar7;
      *piVar7 = (int)((undefined4 *)*piVar7 + 1);
      *puVar10 = uVar11;
      uVar11 = *(undefined4 *)*piVar7;
      *piVar7 = (int)((undefined4 *)*piVar7 + 1);
      puVar10[1] = uVar11;
      uVar11 = *(undefined4 *)*piVar7;
      *piVar7 = (int)((undefined4 *)*piVar7 + 1);
      puVar10[2] = uVar11;
      *(undefined1 *)(puVar10 + 3) = *(undefined1 *)*piVar7;
      *(undefined1 *)((int)puVar10 + 0xd) = *(undefined1 *)(*piVar7 + 1);
      *(undefined1 *)((int)puVar10 + 0xe) = *(undefined1 *)(*piVar7 + 2);
      *(undefined1 *)((int)puVar10 + 0xf) = *(undefined1 *)(*piVar7 + 3);
      iVar9 = *piVar7;
      puVar14 = (undefined4 *)(iVar9 + 4);
      *piVar7 = (int)puVar14;
      uVar11 = *puVar14;
      *piVar7 = iVar9 + 8;
      puVar10[7] = uVar11;
      uVar11 = *(undefined4 *)*piVar7;
      *piVar7 = (int)((undefined4 *)*piVar7 + 1);
      puVar10[0xb] = uVar11;
      uVar11 = *(undefined4 *)*piVar7;
      *piVar7 = (int)((undefined4 *)*piVar7 + 1);
      puVar10[4] = uVar11;
      uVar11 = *(undefined4 *)*piVar7;
      *piVar7 = (int)((undefined4 *)*piVar7 + 1);
      puVar10[5] = uVar11;
      uVar11 = *(undefined4 *)*piVar7;
      *piVar7 = (int)((undefined4 *)*piVar7 + 1);
      puVar10[6] = uVar11;
      uVar11 = *(undefined4 *)*piVar7;
      *piVar7 = (int)((undefined4 *)*piVar7 + 1);
      puVar10[8] = uVar11;
      uVar11 = *(undefined4 *)*piVar7;
      *piVar7 = (int)((undefined4 *)*piVar7 + 1);
      puVar10[9] = uVar11;
      uVar11 = *(undefined4 *)*piVar7;
      *piVar7 = (int)((undefined4 *)*piVar7 + 1);
      puVar10[10] = uVar11;
      pbVar6 = (byte *)*piVar7;
      if (iVar12 == -1) {
        bVar2 = *pbVar6;
        *piVar7 = (int)(pbVar6 + 1);
        *(byte *)(puVar10 + 0xf) = bVar2;
        sVar4 = *(short *)*piVar7;
        *piVar7 = (int)((short *)*piVar7 + 1);
        puVar1 = (uint *)(param_2 + ((int)sVar4 >> 5) * 4);
        *puVar1 = *puVar1 | 1 << ((byte)sVar4 & 0x1f);
        *(short *)((int)puVar10 + 0x3e) = (short)((int)sVar4 << 6);
        uVar11 = *(undefined4 *)*piVar7;
        *piVar7 = (int)((undefined4 *)*piVar7 + 1);
        puVar10[0xc] = uVar11;
        uVar11 = *(undefined4 *)*piVar7;
        *piVar7 = (int)((undefined4 *)*piVar7 + 1);
        puVar10[0xd] = uVar11;
        uVar11 = *(undefined4 *)*piVar7;
        *piVar7 = (int)((undefined4 *)*piVar7 + 1);
        puVar10[0xe] = uVar11;
        if (bVar2 == 0) goto LAB_1002d9f3;
        *(undefined1 *)((int)puVar10 + 0x3d) = *(undefined1 *)*piVar7;
        uVar13 = (uint)bVar2;
        puVar10 = puVar10 + 0x10;
        iVar9 = 0;
        *piVar7 = *piVar7 + 1;
        if (3 < uVar13) {
          param_3 = (int *)((uVar13 - 4 >> 2) + 1);
          iVar9 = (int)param_3 * 4;
          do {
            sVar4 = *(short *)*piVar7;
            *piVar7 = (int)((short *)*piVar7 + 1);
            puVar1 = (uint *)(param_2 + ((int)sVar4 >> 5) * 4);
            *puVar1 = *puVar1 | 1 << ((byte)sVar4 & 0x1f);
            *(short *)(puVar10 + 3) = (short)((int)sVar4 << 6);
            uVar11 = *(undefined4 *)*piVar7;
            *piVar7 = (int)((undefined4 *)*piVar7 + 1);
            *puVar10 = uVar11;
            uVar11 = *(undefined4 *)*piVar7;
            *piVar7 = (int)((undefined4 *)*piVar7 + 1);
            puVar10[1] = uVar11;
            uVar11 = *(undefined4 *)*piVar7;
            *piVar7 = (int)((undefined4 *)*piVar7 + 1);
            puVar10[2] = uVar11;
            uVar3 = *(undefined2 *)*piVar7;
            *piVar7 = (int)((undefined2 *)*piVar7 + 1);
            *(undefined2 *)((int)puVar10 + 0xe) = uVar3;
            sVar4 = *(short *)*piVar7;
            *piVar7 = (int)((short *)*piVar7 + 1);
            puVar1 = (uint *)(param_2 + ((int)sVar4 >> 5) * 4);
            *puVar1 = *puVar1 | 1 << ((byte)sVar4 & 0x1f);
            *(short *)(puVar10 + 7) = (short)((int)sVar4 << 6);
            uVar11 = *(undefined4 *)*piVar7;
            *piVar7 = (int)((undefined4 *)*piVar7 + 1);
            puVar10[4] = uVar11;
            uVar11 = *(undefined4 *)*piVar7;
            *piVar7 = (int)((undefined4 *)*piVar7 + 1);
            puVar10[5] = uVar11;
            uVar11 = *(undefined4 *)*piVar7;
            *piVar7 = (int)((undefined4 *)*piVar7 + 1);
            puVar10[6] = uVar11;
            uVar3 = *(undefined2 *)*piVar7;
            *piVar7 = (int)((undefined2 *)*piVar7 + 1);
            *(undefined2 *)((int)puVar10 + 0x1e) = uVar3;
            sVar4 = *(short *)*piVar7;
            *piVar7 = (int)((short *)*piVar7 + 1);
            puVar1 = (uint *)(param_2 + ((int)sVar4 >> 5) * 4);
            *puVar1 = *puVar1 | 1 << ((byte)sVar4 & 0x1f);
            *(short *)(puVar10 + 0xb) = (short)((int)sVar4 << 6);
            uVar11 = *(undefined4 *)*piVar7;
            *piVar7 = (int)((undefined4 *)*piVar7 + 1);
            puVar10[8] = uVar11;
            uVar11 = *(undefined4 *)*piVar7;
            *piVar7 = (int)((undefined4 *)*piVar7 + 1);
            puVar10[9] = uVar11;
            uVar11 = *(undefined4 *)*piVar7;
            *piVar7 = (int)((undefined4 *)*piVar7 + 1);
            puVar10[10] = uVar11;
            uVar3 = *(undefined2 *)*piVar7;
            *piVar7 = (int)((undefined2 *)*piVar7 + 1);
            *(undefined2 *)((int)puVar10 + 0x2e) = uVar3;
            sVar4 = *(short *)*piVar7;
            *piVar7 = (int)((short *)*piVar7 + 1);
            puVar1 = (uint *)(param_2 + ((int)sVar4 >> 5) * 4);
            *puVar1 = *puVar1 | 1 << ((byte)sVar4 & 0x1f);
            *(short *)(puVar10 + 0xf) = (short)((int)sVar4 << 6);
            uVar11 = *(undefined4 *)*piVar7;
            *piVar7 = (int)((undefined4 *)*piVar7 + 1);
            puVar10[0xc] = uVar11;
            uVar11 = *(undefined4 *)*piVar7;
            *piVar7 = (int)((undefined4 *)*piVar7 + 1);
            puVar10[0xd] = uVar11;
            uVar11 = *(undefined4 *)*piVar7;
            *piVar7 = (int)((undefined4 *)*piVar7 + 1);
            puVar10[0xe] = uVar11;
            uVar3 = *(undefined2 *)*piVar7;
            *piVar7 = (int)((undefined2 *)*piVar7 + 1);
            *(undefined2 *)((int)puVar10 + 0x3e) = uVar3;
            puVar10 = puVar10 + 0x10;
            param_3 = (int *)((int)param_3 + -1);
          } while (param_3 != (int *)0x0);
        }
        if (iVar9 < (int)uVar13) {
          param_3 = (int *)(uVar13 - iVar9);
          puVar14 = puVar10;
          do {
            sVar4 = *(short *)*piVar7;
            *piVar7 = (int)((short *)*piVar7 + 1);
            puVar1 = (uint *)(param_2 + ((int)sVar4 >> 5) * 4);
            puVar10 = puVar14 + 4;
            *puVar1 = *puVar1 | 1 << ((byte)sVar4 & 0x1f);
            *(short *)(puVar14 + 3) = (short)((int)sVar4 << 6);
            uVar11 = *(undefined4 *)*piVar7;
            *piVar7 = (int)((undefined4 *)*piVar7 + 1);
            *puVar14 = uVar11;
            uVar11 = *(undefined4 *)*piVar7;
            *piVar7 = (int)((undefined4 *)*piVar7 + 1);
            puVar14[1] = uVar11;
            uVar11 = *(undefined4 *)*piVar7;
            *piVar7 = (int)((undefined4 *)*piVar7 + 1);
            puVar14[2] = uVar11;
            uVar3 = *(undefined2 *)*piVar7;
            *piVar7 = (int)((undefined2 *)*piVar7 + 1);
            *(undefined2 *)((int)puVar14 + 0xe) = uVar3;
            param_3 = (int *)((int)param_3 + -1);
            puVar14 = puVar10;
          } while (param_3 != (int *)0x0);
        }
      }
      else {
        uVar11 = *(undefined4 *)pbVar6;
        *piVar7 = (int)(pbVar6 + 4);
        puVar10[0xc] = uVar11;
        uVar11 = *(undefined4 *)*piVar7;
        *piVar7 = (int)((undefined4 *)*piVar7 + 1);
        puVar10[0xd] = uVar11;
        uVar11 = *(undefined4 *)*piVar7;
        *piVar7 = (int)((undefined4 *)*piVar7 + 1);
        puVar10[0xe] = uVar11;
LAB_1002d9f3:
        puVar10 = puVar10 + 0x10;
      }
      iStack_10 = iStack_10 + 1;
    } while (iStack_10 < *(short *)(puVar8 + 2));
  }
  sVar4 = *(short *)(puVar8 + 4);
  uVar11 = (*param_4)((sVar4 * 3 + 3) * 2);
  *(undefined4 *)(puVar8 + 8) = uVar11;
  iVar12 = 0;
  if (0 < *(short *)(puVar8 + 4) * 3) {
    do {
      uVar3 = *(undefined2 *)*piVar7;
      *piVar7 = (int)((undefined2 *)*piVar7 + 1);
      *(undefined2 *)(*(int *)(puVar8 + 8) + iVar12 * 2) = uVar3;
      iVar12 = iVar12 + 1;
    } while (iVar12 < *(short *)(puVar8 + 4) * 3);
  }
  if (((int)sVar4 + 1U & 0xfffffffe) != (int)*(short *)(puVar8 + 4)) {
    puVar15 = (undefined2 *)(*(int *)(puVar8 + 8) + iVar12 * 2);
    *puVar15 = puVar15[-1];
    *(undefined2 *)(*(int *)(puVar8 + 8) + iVar12 * 2 + 2) =
         *(undefined2 *)(*(int *)(puVar8 + 8) + -2 + iVar12 * 2);
    *(undefined2 *)(*(int *)(puVar8 + 8) + 4 + iVar12 * 2) =
         *(undefined2 *)(*(int *)(puVar8 + 8) + -2 + iVar12 * 2);
    *(short *)(puVar8 + 4) = *(short *)(puVar8 + 4) + 1;
  }
  return puVar8;
}


