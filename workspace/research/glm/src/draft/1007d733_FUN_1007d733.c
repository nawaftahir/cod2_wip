


void FUN_1007d733(int param_1,int param_2,short *param_3,int param_4,int *param_5,int *param_6)

{
  short *psVar1;
  unsigned short uVar2;
  unsigned short uVar3;
  short *psVar4;
  int iVar5;
  unsigned int uVar6;
  int *piVar7;
  
  psVar4 = param_3;
  psVar1 = param_3 + 5;
  if (*psVar1 == 0) {
    if (*(short *)(param_2 + 4) == 0) {
      uVar6 = (unsigned int)(unsigned short)param_3[3];
      uVar2 = param_3[2];
    }
    else {
      if (*param_3 == 3) {
        uVar3 = param_3[2];
        uVar2 = param_3[3];
      }
      else {
        uVar3 = param_3[3];
        uVar2 = param_3[2];
      }
      uVar6 = (int)(uVar3 + 3) >> 2;
    }
    *param_5 = *param_5 + uVar6 * uVar2 * param_4;
    *param_6 = *param_6 + (unsigned int)(unsigned short)param_3[3] * (unsigned int)(unsigned short)param_3[2] * param_4;
  }
  else {
    piVar7 = (int *)(param_3 + 6);
    param_3 = (short *)0x0;
    if (*psVar1 != 0) {
      piVar7 = (int *)(*piVar7 + *(int *)(param_1 + 8) + 4);
      do {
        if (*piVar7 != 0) {
          iVar5 = *(int *)(param_1 + 8) + *piVar7;
          FUN_1007d733(param_1,param_2,iVar5,(unsigned int)*(unsigned short *)(iVar5 + 8) * param_4,param_5,param_6)
          ;
        }
        param_3 = (short *)((int)param_3 + 1);
        piVar7 = piVar7 + 2;
      } while (param_3 < (unsigned int)(unsigned short)psVar4[5]);
    }
  }
  return;
}


