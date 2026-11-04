// 10004430 size=568 FUN_10004430

void FUN_10004430(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int *in_EAX;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int *piVar9;
  undefined4 *puVar10;
  int iVar11;
  byte *pbVar12;
  int iVar13;
  undefined4 *puVar14;
  int iVar15;
  int *piVar16;
  int iStack_14;
  
  iStack_14 = FUN_10001940();
  iVar13 = in_EAX[1];
  iVar15 = *(int *)(*in_EAX + 0x9c);
  iVar5 = (*(code *)RI_Hunk_AllocInternal)(iStack_14 * 0x24);
  iVar6 = FUN_10001940();
  iVar1 = *(int *)(*in_EAX + 0xa4);
  iVar2 = in_EAX[1];
  iVar7 = (*(code *)RI_Hunk_AllocInternal)(iVar6 * 0x14);
  iVar8 = FUN_10001940();
  iVar6 = *(int *)(*in_EAX + 0xac);
  iVar3 = in_EAX[1];
  iVar8 = (*(code *)RI_Hunk_AllocInternal)(iVar8 << 4);
  DAT_101ae498 = iVar5;
  if (0 < iStack_14) {
    piVar9 = (int *)(iVar15 + iVar13 + 0xc);
    piVar16 = (int *)(iVar5 + 4);
    do {
      piVar16[-1] = (int)(short)piVar9[-2];
      iVar13 = piVar9[-3];
      *piVar16 = iVar7 + iVar13 * 0x14;
      iVar15 = 0;
      if (0 < piVar16[-1]) {
        iVar5 = 0;
        puVar14 = (undefined4 *)(iVar1 + iVar2 + iVar13 * 4);
        do {
          puVar10 = (undefined4 *)(*(code *)RI_DObjSetModel)(*puVar14);
          iVar13 = *piVar16;
          *(undefined4 *)(iVar13 + iVar5) = *puVar10;
          iVar13 = iVar13 + iVar5;
          *(undefined4 *)(iVar13 + 4) = puVar10[1];
          *(undefined4 *)(iVar13 + 8) = puVar10[2];
          *(float *)(iVar5 + 0xc + *piVar16) = -(float)puVar10[3];
          iVar13 = *piVar16;
          iVar4 = *(int *)(iVar13 + 4 + iVar5);
          iVar11 = iVar13 + iVar5;
          *(byte *)(iVar11 + 0x10) = (*(int *)(iVar13 + iVar5) < 1) - 1U & 0xc;
          *(byte *)(iVar11 + 0x11) = ((iVar4 < 1) - 1U & 0xc) + 4;
          *(byte *)(iVar11 + 0x12) = ((*(int *)(iVar11 + 8) < 1) - 1U & 0xc) + 8;
          iVar15 = iVar15 + 1;
          puVar14 = puVar14 + 1;
          iVar5 = iVar5 + 0x14;
        } while (iVar15 < piVar16[-1]);
      }
      piVar16[4] = DAT_101ae49c + *piVar9 * 0xc;
      piVar16[3] = (int)(short)piVar9[1];
      piVar16[1] = (int)*(short *)((int)piVar9 + -6);
      piVar16[2] = piVar9[-1] * 0x10 + iVar8;
      iVar13 = 0;
      if (0 < piVar16[1]) {
        iVar15 = 0;
        pbVar12 = (byte *)(iVar6 + iVar3 + 2);
        do {
          *(uint *)(iVar15 + piVar16[2]) = *piVar16 + (uint)pbVar12[-2] * 0x14;
          *(uint *)(iVar15 + 4 + piVar16[2]) = *piVar16 + (uint)pbVar12[-1] * 0x14;
          *(uint *)(iVar15 + 8 + piVar16[2]) = piVar16[4] + (uint)*pbVar12 * 0xc;
          *(uint *)(iVar15 + 0xc + piVar16[2]) = piVar16[4] + (uint)pbVar12[1] * 0xc;
          iVar13 = iVar13 + 1;
          pbVar12 = pbVar12 + 4;
          iVar15 = iVar15 + 0x10;
        } while (iVar13 < piVar16[1]);
      }
      piVar16[6] = 0;
      piVar16[7] = 0;
      piVar9 = piVar9 + 5;
      piVar16 = piVar16 + 9;
      iStack_14 = iStack_14 + -1;
    } while (iStack_14 != 0);
  }
  return;
}


