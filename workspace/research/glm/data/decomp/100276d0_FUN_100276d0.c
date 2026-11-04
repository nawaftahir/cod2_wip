// 100276d0 size=499 FUN_100276d0

void FUN_100276d0(undefined4 param_1,undefined4 param_2,int param_3,undefined4 param_4,int param_5)

{
  float *pfVar1;
  int iVar2;
  undefined4 *puVar3;
  int iVar4;
  undefined *puVar5;
  int *piVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  
  iVar4 = param_3 * 0x34;
  puVar5 = &DAT_10678ac4 + iVar4;
  piVar6 = (int *)(param_3 * 0x74 + DAT_10678510);
  (*(code *)RI_DObjCalcAnim)(*(undefined4 *)(&DAT_10678acc + iVar4));
  FUN_1001ffc0(puVar5);
  if ((*(float *)(&DAT_10678ae4 + iVar4) - *(float *)(&DAT_10678ad8 + iVar4)) *
      (*(float *)(&DAT_10678ae4 + iVar4) - *(float *)(&DAT_10678ad8 + iVar4)) +
      (*(float *)(&DAT_10678ae8 + iVar4) - *(float *)(&DAT_10678adc + iVar4)) *
      (*(float *)(&DAT_10678ae8 + iVar4) - *(float *)(&DAT_10678adc + iVar4)) +
      (*(float *)(&DAT_10678aec + iVar4) - *(float *)(&DAT_10678ae0 + iVar4)) *
      (*(float *)(&DAT_10678aec + iVar4) - *(float *)(&DAT_10678ae0 + iVar4)) != 0.0) {
    puVar3 = (undefined4 *)(*(int *)(param_5 + 0xa20) * 0x6c + param_5);
    *(int *)(param_5 + 0xa20) = *(int *)(param_5 + 0xa20) + 1;
    iVar2 = *(int *)(DAT_101da9c8 + 0x217c7c) * 0x14c + 0x217c80 + DAT_101da9c8;
    *(int *)(DAT_101da9c8 + 0x217c7c) = *(int *)(DAT_101da9c8 + 0x217c7c) + 1;
    puVar3[0x19] = iVar2;
    FUN_10027290(&DAT_10678ad8 + iVar4,&DAT_10678ae4 + iVar4);
    puVar3[0x1a] = param_4;
    puVar7 = (undefined4 *)(puVar3[0x19] + 200);
    puVar8 = puVar3 + 3;
    for (iVar2 = 0x10; iVar2 != 0; iVar2 = iVar2 + -1) {
      *puVar8 = *puVar7;
      puVar7 = puVar7 + 1;
      puVar8 = puVar8 + 1;
    }
    puVar3[4] = (float)puVar3[4] * -1.0;
    puVar3[8] = (float)puVar3[8] * -1.0;
    iVar2 = 2;
    puVar3[0xc] = (float)puVar3[0xc] * -1.0;
    puVar3[0x10] = (float)puVar3[0x10] * -1.0;
    pfVar1 = (float *)(puVar3 + 7);
    do {
      iVar2 = iVar2 + -1;
      pfVar1[-4] = pfVar1[-4] * 0.5;
      *pfVar1 = *pfVar1 * 0.5;
      pfVar1[4] = pfVar1[4] * 0.5;
      pfVar1[8] = (pfVar1[8] + 1.0) * 0.5;
      pfVar1 = pfVar1 + 1;
    } while (iVar2 != 0);
    puVar3[0x13] = *(undefined4 *)(&DAT_10678ad8 + iVar4);
    puVar3[0x14] = *(undefined4 *)(&DAT_10678adc + iVar4);
    puVar3[0x15] = *(undefined4 *)(&DAT_10678ae0 + iVar4);
    puVar3[0x16] = *(undefined4 *)(&DAT_10678ae4 + iVar4);
    puVar3[0x17] = *(undefined4 *)(&DAT_10678ae8 + iVar4);
    puVar3[0x18] = *(undefined4 *)(&DAT_10678aec + iVar4);
    *puVar3 = DAT_10678ab8;
    if (*(int *)(param_5 + 0xa20) <= *(int *)(DAT_101ce810 + 8)) {
      DAT_101d7e90 = param_1;
      (*(code *)RI_DObjCalcSkel)(*(undefined4 *)(&DAT_10678acc + iVar4));
      if (*piVar6 == 1) {
        FUN_1001f6f0(puVar5,piVar6,0xffffffff);
      }
      else {
        FUN_1001fa70(puVar5,piVar6);
      }
      FUN_10024680(param_3);
    }
    FUN_10027590(param_2,param_3);
  }
  return;
}


