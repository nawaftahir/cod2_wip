


void R_DObjGetSurfMaterials(unsigned int param_1,char param_2,int param_3,unsigned int param_4)

{
  short sVar1;
  unsigned int uVar2;
  unsigned int uVar3;
  int iVar4;
  unsigned int uVar5;
  char *pcVar6;
  char acStack_118 [8];
  unsigned char auStack_110 [16];
  short asStack_100 [128];
  
  uVar2 = (*(void *)RI_InitWorker)(param_1);
  if (0 < (int)uVar2) {
    pcVar6 = acStack_118;
    for (uVar5 = uVar2 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
      *(unsigned int *)pcVar6 = CONCAT22(CONCAT11(param_2,param_2),CONCAT11(param_2,param_2));
      pcVar6 = pcVar6 + 4;
    }
    for (uVar2 = uVar2 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
      *pcVar6 = param_2;
      pcVar6 = pcVar6 + 1;
    }
  }
  (*(void *)RI_RI_unk118)(param_1,asStack_100,auStack_110,acStack_118);
  sVar1 = asStack_100[param_3 * 2];
  uVar3 = (*(void *)RI_RI_unk123)(param_1,(int)sVar1);
  iVar4 = (*(void *)RI_XModelNumBones)(uVar3);
  if (iVar4 != 0) {
    *(unsigned int *)(*(int *)(iVar4 + acStack_118[sVar1] * 4) + asStack_100[param_3 * 2 + 1] * 4) =
         param_4;
  }
  return;
}


