


void R_DrawTextWithCursor(unsigned int param_1,char param_2,unsigned int *param_3)

{
  int iVar1;
  unsigned int uVar2;
  unsigned int uVar3;
  int iVar4;
  unsigned int uVar5;
  char *pcVar6;
  int iVar7;
  int iStack_11c;
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
  iStack_11c = (*(void *)RI_RI_unk118)(param_1,asStack_100,auStack_110,acStack_118);
  if (0 < iStack_11c) {
    iVar1 = -(int)param_3;
    do {
      iVar7 = (int)*(short *)((int)asStack_100 + iVar1 + (int)param_3);
      uVar3 = (*(void *)RI_RI_unk123)(param_1,iVar7);
      iVar4 = (*(void *)RI_XModelNumBones)(uVar3);
      if (iVar4 == 0) {
        *param_3 = 0;
      }
      else {
        *param_3 = *(unsigned int *)
                    (*(int *)(iVar4 + acStack_118[iVar7] * 4) +
                    *(short *)((int)asStack_100 + iVar1 + 2 + (int)param_3) * 4);
      }
      param_3 = param_3 + 1;
      iStack_11c = iStack_11c + -1;
    } while (iStack_11c != 0);
  }
  return;
}


