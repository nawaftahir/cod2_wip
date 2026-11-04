extern unsigned int DAT_101ae29c;
extern unsigned int DAT_101ae4a0;


int FUN_10003d40(float *param_1,int param_2)

{
  float *pfVar1;
  float fVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  int iVar6;
  
  *param_1 = 131072.0;
  param_1[1] = 131072.0;
  param_1[2] = 131072.0;
  param_1[3] = -131072.0;
  param_1[4] = -131072.0;
  param_1[5] = -131072.0;
  fVar2 = param_1[10];
  if (fVar2 == 0.0) {
    iVar3 = 0;
    if (0 < (int)param_1[6]) {
      piVar5 = (int *)(DAT_101ae29c + (int)param_1[7] * 0xc + 8);
      do {
        iVar4 = *piVar5;
        if (*(float *)(iVar4 + 4) < *param_1) {
          *param_1 = *(float *)(iVar4 + 4);
        }
        if (param_1[3] < *(float *)(iVar4 + 0x10)) {
          param_1[3] = *(float *)(iVar4 + 0x10);
        }
        if (*(float *)(iVar4 + 8) < param_1[1]) {
          param_1[1] = *(float *)(iVar4 + 8);
        }
        if (param_1[4] < *(float *)(iVar4 + 0x14)) {
          param_1[4] = *(float *)(iVar4 + 0x14);
        }
        if (*(float *)(iVar4 + 0xc) < param_1[2]) {
          param_1[2] = *(float *)(iVar4 + 0xc);
        }
        if (param_1[5] < *(float *)(iVar4 + 0x18)) {
          param_1[5] = *(float *)(iVar4 + 0x18);
        }
        iVar3 = iVar3 + 1;
        piVar5 = piVar5 + 3;
      } while (iVar3 < (int)param_1[6]);
    }
    return param_2;
  }
  iVar3 = param_2 + (int)fVar2;
  iVar4 = 0;
  param_1[0xb] = (float)(param_2 * 0x30 + DAT_101ae4a0);
  if (0 < (int)fVar2) {
    iVar6 = 0;
    do {
      iVar3 = FUN_10003d40((int)param_1[0xb] + iVar6,iVar3);
      pfVar1 = (float *)(iVar6 + (int)param_1[0xb]);
      if (*(float *)(iVar6 + (int)param_1[0xb]) < *param_1) {
        *param_1 = *pfVar1;
      }
      if (param_1[3] < pfVar1[3]) {
        param_1[3] = pfVar1[3];
      }
      if (pfVar1[1] < param_1[1]) {
        param_1[1] = pfVar1[1];
      }
      if (param_1[4] < pfVar1[4]) {
        param_1[4] = pfVar1[4];
      }
      if (pfVar1[2] < param_1[2]) {
        param_1[2] = pfVar1[2];
      }
      if (param_1[5] < pfVar1[5]) {
        param_1[5] = pfVar1[5];
      }
      iVar4 = iVar4 + 1;
      iVar6 = iVar6 + 0x30;
    } while (iVar4 < (int)param_1[10]);
  }
  return iVar3;
}


