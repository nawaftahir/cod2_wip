// 10007430 size=1439 FUN_10007430

int FUN_10007430(int param_1,int param_2)

{
  undefined4 *puVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  bool bVar5;
  undefined4 *puVar6;
  undefined4 *in_EAX;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  int iVar13;
  int in_ECX;
  float *pfVar14;
  float *pfVar15;
  float *pfVar16;
  int iVar17;
  int iVar18;
  float10 fVar19;
  int local_62c;
  float local_600 [384];
  
  if ((param_2 < 0xb) && (*(char *)(DAT_101ce80c + 8) == '\0')) {
    local_62c = 0;
    bVar5 = false;
    if (*(float *)(DAT_101ce6a0 + 8) <= 0.0) goto LAB_10007487;
  }
  else {
    local_62c = 1;
  }
  bVar5 = true;
LAB_10007487:
  FUN_10005ee0(param_2,local_600);
  iVar17 = 0;
  if ((bVar5) || (0.0 < *(float *)(DAT_101ce788 + 8))) {
    FUN_10006da0(param_2);
    if (bVar5) {
      iVar17 = FUN_10007000(param_1,param_2,local_600,local_62c);
    }
  }
  else {
    *in_EAX = 1;
  }
  if (param_2 < 0xb) {
    local_62c = 0;
    if (3 < param_2) {
      pfVar14 = (float *)(param_1 + iVar17 * 0x14);
      iVar7 = (int)local_600 + (4 - in_ECX);
      iVar8 = (int)local_600 + (0xc - in_ECX);
      iVar9 = (int)local_600 + (0x10 - in_ECX);
      iVar10 = (int)local_600 + (0x18 - in_ECX);
      iVar11 = (int)local_600 + (0x1c - in_ECX);
      pfVar16 = local_600 + 2;
      iVar12 = (int)pfVar16 - in_ECX;
      iVar13 = (int)local_600 + (0x14 - in_ECX);
      iVar18 = (param_2 - 4U >> 2) + 1;
      local_62c = iVar18 * 4;
      pfVar15 = (float *)(in_ECX + 0x10);
      do {
        if (pfVar16[-1] * pfVar16[-1] + pfVar16[-2] * pfVar16[-2] + *pfVar16 * *pfVar16 != 0.0) {
          *pfVar14 = pfVar16[-2];
          pfVar14[1] = pfVar16[-1];
          pfVar14[2] = *pfVar16;
          fVar2 = pfVar15[-4];
          fVar3 = pfVar15[-3];
          fVar4 = pfVar15[-2];
          *(byte *)(pfVar14 + 4) = ((int)*pfVar14 < 1) - 1U & 0xc;
          pfVar14[3] = 0.001 - (fVar4 * pfVar14[2] + fVar3 * pfVar14[1] + fVar2 * *pfVar14);
          *(byte *)((int)pfVar14 + 0x11) = (((int)pfVar14[1] < 1) - 1U & 0xc) + 4;
          *(byte *)((int)pfVar14 + 0x12) = (((int)pfVar14[2] < 1) - 1U & 0xc) + 8;
          *(undefined1 *)((int)pfVar14 + 0x13) = 0xff;
          iVar17 = iVar17 + 1;
          pfVar14 = pfVar14 + 5;
        }
        fVar2 = *(float *)(iVar7 + (int)pfVar15);
        fVar3 = *(float *)(((int)local_600 - in_ECX) + (int)pfVar15);
        if (pfVar16[1] * pfVar16[1] + fVar3 * fVar3 + fVar2 * fVar2 != 0.0) {
          *pfVar14 = pfVar16[1];
          pfVar14[1] = *(float *)(((int)local_600 - in_ECX) + (int)pfVar15);
          pfVar14[2] = *(float *)(iVar7 + (int)pfVar15);
          fVar2 = pfVar15[-1];
          fVar3 = pfVar15[1];
          fVar4 = *pfVar15;
          *(byte *)(pfVar14 + 4) = ((int)*pfVar14 < 1) - 1U & 0xc;
          pfVar14[3] = 0.001 - (fVar4 * pfVar14[1] + fVar3 * pfVar14[2] + fVar2 * *pfVar14);
          *(byte *)((int)pfVar14 + 0x11) = (((int)pfVar14[1] < 1) - 1U & 0xc) + 4;
          *(byte *)((int)pfVar14 + 0x12) = (((int)pfVar14[2] < 1) - 1U & 0xc) + 8;
          *(undefined1 *)((int)pfVar14 + 0x13) = 0xff;
          iVar17 = iVar17 + 1;
          pfVar14 = pfVar14 + 5;
        }
        fVar2 = *(float *)(iVar9 + (int)pfVar15);
        fVar3 = *(float *)(iVar8 + (int)pfVar15);
        fVar4 = *(float *)((int)pfVar15 + iVar12);
        if (fVar4 * fVar4 + fVar3 * fVar3 + fVar2 * fVar2 != 0.0) {
          *pfVar14 = *(float *)((int)pfVar15 + iVar12);
          pfVar14[1] = *(float *)(iVar8 + (int)pfVar15);
          pfVar14[2] = *(float *)(iVar9 + (int)pfVar15);
          fVar2 = pfVar15[4];
          fVar3 = pfVar15[3];
          fVar4 = pfVar15[2];
          *(byte *)(pfVar14 + 4) = ((int)*pfVar14 < 1) - 1U & 0xc;
          pfVar14[3] = 0.001 - (fVar4 * *pfVar14 + fVar3 * pfVar14[1] + fVar2 * pfVar14[2]);
          *(byte *)((int)pfVar14 + 0x11) = (((int)pfVar14[1] < 1) - 1U & 0xc) + 4;
          *(byte *)((int)pfVar14 + 0x12) = (((int)pfVar14[2] < 1) - 1U & 0xc) + 8;
          *(undefined1 *)((int)pfVar14 + 0x13) = 0xff;
          iVar17 = iVar17 + 1;
          pfVar14 = pfVar14 + 5;
        }
        fVar2 = *(float *)((int)pfVar15 + iVar11);
        fVar3 = *(float *)((int)pfVar15 + iVar10);
        fVar4 = *(float *)((int)pfVar15 + iVar13);
        if (fVar3 * fVar3 + fVar2 * fVar2 + fVar4 * fVar4 != 0.0) {
          *pfVar14 = *(float *)((int)pfVar15 + iVar13);
          pfVar14[1] = *(float *)((int)pfVar15 + iVar10);
          pfVar14[2] = *(float *)((int)pfVar15 + iVar11);
          fVar2 = pfVar15[7];
          fVar3 = pfVar15[6];
          fVar4 = pfVar15[5];
          *(byte *)(pfVar14 + 4) = ((int)*pfVar14 < 1) - 1U & 0xc;
          pfVar14[3] = 0.001 - (fVar4 * *pfVar14 + fVar3 * pfVar14[1] + fVar2 * pfVar14[2]);
          *(byte *)((int)pfVar14 + 0x11) = (((int)pfVar14[1] < 1) - 1U & 0xc) + 4;
          *(byte *)((int)pfVar14 + 0x12) = (((int)pfVar14[2] < 1) - 1U & 0xc) + 8;
          *(undefined1 *)((int)pfVar14 + 0x13) = 0xff;
          iVar17 = iVar17 + 1;
          pfVar14 = pfVar14 + 5;
        }
        pfVar16 = pfVar16 + 0xc;
        pfVar15 = pfVar15 + 0xc;
        iVar18 = iVar18 + -1;
      } while (iVar18 != 0);
    }
    if (local_62c < param_2) {
      pfVar15 = (float *)(local_62c * 0xc + 4 + in_ECX);
      pfVar14 = (float *)(param_1 + 4 + iVar17 * 0x14);
      pfVar16 = local_600 + local_62c * 3 + 2;
      param_2 = param_2 - local_62c;
      do {
        if (*pfVar16 * *pfVar16 + pfVar16[-1] * pfVar16[-1] + pfVar16[-2] * pfVar16[-2] != 0.0) {
          pfVar14[-1] = pfVar16[-2];
          *pfVar14 = pfVar16[-1];
          pfVar14[1] = *pfVar16;
          fVar2 = *(float *)((in_ECX - (int)(local_600 + 2)) + (int)pfVar16);
          fVar3 = pfVar15[1];
          fVar4 = *pfVar15;
          *(byte *)(pfVar14 + 3) = ((int)pfVar14[-1] < 1) - 1U & 0xc;
          pfVar14[2] = 0.001 - (fVar4 * *pfVar14 + fVar3 * pfVar14[1] + fVar2 * pfVar14[-1]);
          *(byte *)((int)pfVar14 + 0xd) = (((int)*pfVar14 < 1) - 1U & 0xc) + 4;
          *(byte *)((int)pfVar14 + 0xe) = (((int)pfVar14[1] < 1) - 1U & 0xc) + 8;
          *(undefined1 *)((int)pfVar14 + 0xf) = 0xff;
          iVar17 = iVar17 + 1;
          pfVar14 = pfVar14 + 5;
        }
        pfVar16 = pfVar16 + 3;
        pfVar15 = pfVar15 + 3;
        param_2 = param_2 + -1;
      } while (param_2 != 0);
    }
  }
  puVar6 = DAT_101ce5b0;
  if (DAT_101ce5b0 != (undefined4 *)0x0) {
    puVar1 = (undefined4 *)(param_1 + iVar17 * 0x14);
    *puVar1 = *DAT_101ce5b0;
    puVar1[1] = puVar6[1];
    puVar1[2] = puVar6[2];
    puVar1[3] = puVar6[3];
    puVar1[4] = puVar6[4];
    fVar19 = (float10)FUN_10006900();
    if ((float10)0.0 < fVar19) {
      puVar1[3] = (float)((float10)(float)puVar1[3] - fVar19);
    }
    iVar17 = iVar17 + 1;
  }
  puVar6 = DAT_101ce5b4;
  if (DAT_101ce5b4 != (undefined4 *)0x0) {
    puVar1 = (undefined4 *)(param_1 + iVar17 * 0x14);
    *puVar1 = *DAT_101ce5b4;
    puVar1[1] = puVar6[1];
    puVar1[2] = puVar6[2];
    puVar1[3] = puVar6[3];
    puVar1[4] = puVar6[4];
    iVar17 = iVar17 + 1;
  }
  return iVar17;
}


