
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int FUN_0045a150(int param_1,float *param_2,float *param_3,int param_4,int param_5,int param_6)

{
  float *pfVar1;
  int iVar2;
  float fVar3;
  int iVar4;
  
  iVar2 = *(int *)(param_1 + 0x38);
  fVar3 = 0.0;
  if (0 < iVar2) {
    iVar4 = 0;
    do {
      if (((fVar3 != *param_2) && (fVar3 != param_2[1])) && (fVar3 != param_2[2])) {
        pfVar1 = (float *)(*(int *)(param_1 + 0x3c) + 0x80 + iVar4);
        if ((float)_DAT_00556ba8 <
            (*param_3 * *pfVar1 +
            pfVar1[1] * param_3[1] +
            *(float *)(*(int *)(param_1 + 0x3c) + 0x88 + iVar4) * param_3[2]) -
            (float)*(double *)(pfVar1 + 4)) {
          return param_4;
        }
      }
      fVar3 = (float)((int)fVar3 + 1);
      iVar4 = iVar4 + 0xa8;
    } while ((int)fVar3 < iVar2);
  }
  if (param_4 == param_5) {
    FUN_00408020("More than %i points from plane intersections on %i-sided brush\n",param_4,iVar2);
  }
  pfVar1 = (float *)(param_6 + param_4 * 0x18);
  *pfVar1 = *param_3;
  pfVar1[1] = param_3[1];
  pfVar1[2] = param_3[2];
  pfVar1[3] = *param_2;
  pfVar1[4] = param_2[1];
  pfVar1[5] = param_2[2];
  return param_4 + 1;
}

