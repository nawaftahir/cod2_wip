extern unsigned int DAT_101ae490;
extern unsigned int DAT_101ae498;
extern int FUN_10001940();


void FUN_10004670(int *param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  
  iVar3 = FUN_10001940();
  iVar1 = *(int *)(*param_1 + 0xb4);
  iVar2 = param_1[1];
  iVar4 = (*(void *)RI_Hunk_AllocInternal)(iVar3 * 4);
  iVar5 = 0;
  DAT_101ae490 = iVar4;
  if (0 < iVar3) {
    do {
      *(int *)(iVar4 + iVar5 * 4) = DAT_101ae498 + *(short *)(iVar1 + iVar2 + iVar5 * 2) * 0x24;
      iVar5 = iVar5 + 1;
    } while (iVar5 < iVar3);
  }
  return;
}


