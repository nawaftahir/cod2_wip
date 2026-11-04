// 10020270 size=160 R_DObjGetSurfMaterials

void R_DObjGetSurfMaterials(undefined4 param_1,char param_2,int param_3,undefined4 param_4)

{
  short sVar1;
  uint uVar2;
  undefined4 uVar3;
  int iVar4;
  uint uVar5;
  char *pcVar6;
  char acStack_118 [8];
  undefined1 auStack_110 [16];
  short asStack_100 [128];
  
  uVar2 = (*(code *)RI_InitWorker)(param_1);
  if (0 < (int)uVar2) {
    pcVar6 = acStack_118;
    for (uVar5 = uVar2 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
      *(uint *)pcVar6 = CONCAT22(CONCAT11(param_2,param_2),CONCAT11(param_2,param_2));
      pcVar6 = pcVar6 + 4;
    }
    for (uVar2 = uVar2 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
      *pcVar6 = param_2;
      pcVar6 = pcVar6 + 1;
    }
  }
  (*(code *)RI_RI_unk118)(param_1,asStack_100,auStack_110,acStack_118);
  sVar1 = asStack_100[param_3 * 2];
  uVar3 = (*(code *)RI_RI_unk123)(param_1,(int)sVar1);
  iVar4 = (*(code *)RI_XModelNumBones)(uVar3);
  if (iVar4 != 0) {
    *(undefined4 *)(*(int *)(iVar4 + acStack_118[sVar1] * 4) + asStack_100[param_3 * 2 + 1] * 4) =
         param_4;
  }
  return;
}


