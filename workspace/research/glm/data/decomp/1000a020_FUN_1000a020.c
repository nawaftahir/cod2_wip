// 1000a020 size=919 FUN_1000a020

/* WARNING: Type propagation algorithm not settling */

void FUN_1000a020(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  float fVar1;
  byte bVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  undefined4 uVar6;
  int iVar7;
  int iVar8;
  float *pfVar9;
  undefined4 uVar10;
  int *piVar11;
  int iVar12;
  int iVar13;
  float afStack_e48 [129];
  undefined1 auStack_c44 [320];
  undefined1 auStack_b04 [8];
  float afStack_afc [190];
  undefined1 auStack_804 [2052];
  
  uVar6 = (*(code *)RI_HiAlloc)(0x20000);
  DAT_101ce5e8 = (int *)(*(code *)RI_HiOffToPtr)(uVar6);
  iVar13 = 0xff;
  piVar11 = DAT_101ce5e8;
  do {
    iVar13 = iVar13 + -1;
    *piVar11 = (int)(piVar11 + 0x80);
    piVar11 = piVar11 + 0x80;
  } while (iVar13 != 0);
  DAT_101ce5e8[0x7f80] = 0;
  DAT_101ce5e4 = auStack_804;
  DAT_101ce5e0 = 0;
  FUN_10009df0(param_1,0,param_2,param_3,param_4,1);
  iVar13 = 0;
  while( true ) {
    do {
      if (DAT_101ce5e0 == 0) {
        (*(code *)RI_HiSetOffset)(uVar6);
        return;
      }
      iVar7 = FUN_10009820();
      bVar2 = *(byte *)(iVar7 + 0x25);
      FUN_10057a40((uint)bVar2,afStack_e48 + 1);
      iVar8 = FUN_10057f10(bVar2 - 2,afStack_e48 + 1);
      piVar11 = *(int **)(iVar7 + 0x28);
      *piVar11 = (int)DAT_101ce5e8;
      DAT_101ce5e8 = piVar11;
      *(undefined4 *)(iVar7 + 0x28) = 0;
    } while (iVar8 == 0);
    iVar13 = iVar13 + 1;
    if (iVar13 == *(int *)(DAT_101ce68c + 8)) break;
    fVar3 = -*(float *)(iVar7 + 0x14);
    iVar12 = 0;
    fVar5 = fVar3 * *(float *)(iVar7 + 8);
    fVar4 = fVar3 * *(float *)(iVar7 + 0xc);
    fVar3 = fVar3 * *(float *)(iVar7 + 0x10);
    if (3 < iVar8) {
      pfVar9 = afStack_afc;
      do {
        fVar1 = afStack_e48[iVar12 * 2U + 1];
        pfVar9[-2] = fVar1 * *(float *)(iVar7 + 0x2c) + fVar5;
        pfVar9[-1] = fVar1 * *(float *)(iVar7 + 0x30) + fVar4;
        *pfVar9 = fVar1 * *(float *)(iVar7 + 0x34) + fVar3;
        fVar1 = afStack_e48[iVar12 * 2U + 2];
        pfVar9[-2] = fVar1 * *(float *)(iVar7 + 0x38) + pfVar9[-2];
        pfVar9[-1] = fVar1 * *(float *)(iVar7 + 0x3c) + pfVar9[-1];
        *pfVar9 = fVar1 * *(float *)(iVar7 + 0x40) + *pfVar9;
        fVar1 = afStack_e48[iVar12 * 2U + 3];
        pfVar9[1] = fVar1 * *(float *)(iVar7 + 0x2c) + fVar5;
        pfVar9[2] = fVar1 * *(float *)(iVar7 + 0x30) + fVar4;
        pfVar9[3] = fVar1 * *(float *)(iVar7 + 0x34) + fVar3;
        fVar1 = afStack_e48[iVar12 * 2U + 4];
        pfVar9[1] = fVar1 * *(float *)(iVar7 + 0x38) + pfVar9[1];
        pfVar9[2] = fVar1 * *(float *)(iVar7 + 0x3c) + pfVar9[2];
        pfVar9[3] = fVar1 * *(float *)(iVar7 + 0x40) + pfVar9[3];
        fVar1 = afStack_e48[iVar12 * 2U + 5];
        pfVar9[4] = fVar1 * *(float *)(iVar7 + 0x2c) + fVar5;
        pfVar9[5] = fVar1 * *(float *)(iVar7 + 0x30) + fVar4;
        pfVar9[6] = fVar1 * *(float *)(iVar7 + 0x34) + fVar3;
        fVar1 = afStack_e48[iVar12 * 2U + 6];
        pfVar9[4] = fVar1 * *(float *)(iVar7 + 0x38) + pfVar9[4];
        pfVar9[5] = fVar1 * *(float *)(iVar7 + 0x3c) + pfVar9[5];
        pfVar9[6] = fVar1 * *(float *)(iVar7 + 0x40) + pfVar9[6];
        fVar1 = afStack_e48[iVar12 * 2U + 7];
        pfVar9[7] = fVar1 * *(float *)(iVar7 + 0x2c) + fVar5;
        pfVar9[8] = fVar1 * *(float *)(iVar7 + 0x30) + fVar4;
        iVar12 = iVar12 + 4;
        pfVar9[9] = fVar1 * *(float *)(iVar7 + 0x34) + fVar3;
        fVar1 = afStack_e48[iVar12 * 2];
        pfVar9[7] = fVar1 * *(float *)(iVar7 + 0x38) + pfVar9[7];
        pfVar9[8] = fVar1 * *(float *)(iVar7 + 0x3c) + pfVar9[8];
        pfVar9[9] = fVar1 * *(float *)(iVar7 + 0x40) + pfVar9[9];
        pfVar9 = pfVar9 + 0xc;
      } while (iVar12 < iVar8 + -3);
    }
    if (iVar12 < iVar8) {
      pfVar9 = afStack_afc + iVar12 * 3;
      do {
        fVar1 = afStack_e48[iVar12 * 2U + 1];
        iVar12 = iVar12 + 1;
        pfVar9[-2] = fVar1 * *(float *)(iVar7 + 0x2c) + fVar5;
        pfVar9[-1] = fVar1 * *(float *)(iVar7 + 0x30) + fVar4;
        *pfVar9 = fVar1 * *(float *)(iVar7 + 0x34) + fVar3;
        fVar1 = afStack_e48[iVar12 * 2];
        pfVar9[-2] = fVar1 * *(float *)(iVar7 + 0x38) + pfVar9[-2];
        pfVar9[-1] = fVar1 * *(float *)(iVar7 + 0x3c) + pfVar9[-1];
        *pfVar9 = fVar1 * *(float *)(iVar7 + 0x40) + *pfVar9;
        pfVar9 = pfVar9 + 3;
      } while (iVar12 < iVar8);
    }
    if ((*(int *)(DAT_101ce6e0 + 8) != 0) && (*(char *)(DAT_101ce80c + 8) == '\0')) {
      FUN_10005440(iVar8,auStack_b04);
    }
    uVar10 = FUN_10007430(auStack_c44,iVar8);
    FUN_10009df0(*(undefined4 *)(iVar7 + 0x1c),iVar7,(float *)(iVar7 + 8),auStack_c44,uVar10,
                 afStack_e48[0]);
  }
  while (DAT_101ce5e0 != 0) {
    iVar13 = FUN_10009820();
    piVar11 = *(int **)(iVar13 + 0x28);
    *piVar11 = (int)DAT_101ce5e8;
    DAT_101ce5e8 = piVar11;
    *(undefined4 *)(iVar13 + 0x28) = 0;
  }
  (*(code *)RI_HiSetOffset)(uVar6);
  return;
}


