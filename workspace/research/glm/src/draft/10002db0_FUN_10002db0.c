extern int FUN_10001940();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10002db0(int *param_1)

{
  int iVar1;
  int iVar2;
  unsigned int *puVar3;
  unsigned int uVar4;
  unsigned int *puVar5;
  
  iVar2 = FUN_10001940();
  puVar5 = (unsigned int *)(*(int *)(*param_1 + 0x124) + param_1[1]);
  puVar3 = (unsigned int *)(*(void *)RI_Hunk_AllocInternal)(iVar2 << 5);
  _DAT_101ae3bc = iVar2;
  _DAT_101ae3c0 = puVar3;
  if (0 < iVar2) {
    do {
      *puVar3 = *puVar5;
      puVar3[3] = puVar5[3];
      puVar3[1] = puVar5[1];
      puVar3[4] = puVar5[4];
      puVar3[2] = puVar5[2];
      puVar3[5] = puVar5[5];
      iVar1 = puVar5[7];
      puVar3[6] = iVar1;
      if (iVar1 == 0) {
        uVar4 = 0xffffffff;
      }
      else {
        uVar4 = puVar5[6];
      }
      puVar3[7] = uVar4;
      puVar5 = puVar5 + 0xc;
      puVar3 = puVar3 + 8;
      iVar2 = iVar2 + -1;
    } while (iVar2 != 0);
  }
  return;
}


