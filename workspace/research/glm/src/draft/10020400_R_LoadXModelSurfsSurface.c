extern unsigned int DAT_101d1b2c;
extern int FUN_10017100();


int * R_LoadXModelSurfsSurface(unsigned int param_1)

{
  char cVar1;
  int iVar2;
  int iVar3;
  char *pcVar4;
  unsigned int uVar5;
  char *pcVar6;
  int iVar7;
  int *piVar8;
  int iVar9;
  int *piStack_58;
  unsigned char auStack_50 [4];
  unsigned char auStack_4c [4];
  int *piStack_48;
  int *piStack_44;
  char acStack_40 [64];
  
  iVar2 = (*(void *)RI_Hunk_OverrideDataForFile)(param_1);
  iVar9 = 0;
  iVar7 = 0;
  if (0 < iVar2) {
    do {
      iVar3 = (*(void *)RI_XModelPrecache)(param_1,auStack_4c,iVar7,auStack_50);
      iVar9 = iVar9 + iVar3;
      iVar7 = iVar7 + 1;
    } while (iVar7 < iVar2);
  }
  piStack_44 = (int *)(*(void *)RI_Hunk_AllocInternal)((iVar9 + iVar2) * 4);
  iVar7 = 0;
  piVar8 = piStack_44 + iVar2;
  piStack_58 = piStack_44;
  if (0 < iVar2) {
    do {
      iVar9 = (*(void *)RI_XModelPrecache)(param_1,auStack_4c,iVar7,auStack_50);
      piStack_48 = piVar8 + iVar9;
      *piStack_58 = (int)piVar8;
      iVar3 = 0;
      if (0 < iVar9) {
        do {
          pcVar4 = (char *)(*(void *)RI_XModelGetLodOutDist)(param_1,iVar3,iVar7);
          pcVar6 = acStack_40;
          do {
            cVar1 = *pcVar4;
            pcVar4 = pcVar4 + 1;
            *pcVar6 = cVar1;
            pcVar6 = pcVar6 + 1;
          } while (cVar1 != '\0');
          __strlwr(acStack_40);
          uVar5 = DAT_101d1b2c;
          if (acStack_40[0] != '\0') {
            uVar5 = FUN_10017100(8);
          }
          *(unsigned int *)(*piStack_58 + iVar3 * 4) = uVar5;
          iVar3 = iVar3 + 1;
        } while (iVar3 < iVar9);
      }
      iVar7 = iVar7 + 1;
      piStack_58 = piStack_58 + 1;
      piVar8 = piStack_48;
    } while (iVar7 < iVar2);
  }
  return piStack_44;
}


