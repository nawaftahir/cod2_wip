// 10007ef0 size=468 FUN_10007ef0

float * FUN_10007ef0(float *param_1,int *param_2,float *param_3)

{
  float *pfVar1;
  float fVar2;
  char cVar3;
  float *in_EAX;
  int iVar4;
  int iVar5;
  float *pfVar6;
  float *pfVar7;
  int iVar8;
  int iVar9;
  char local_288 [132];
  float local_204 [129];
  
  iVar9 = 0;
  iVar8 = 0;
  if (0 < *param_2) {
    pfVar7 = param_1 + 1;
    iVar5 = 0;
    do {
      iVar4 = iVar5;
      fVar2 = pfVar7[1];
      local_288[iVar4] = '\x02';
      fVar2 = (in_EAX[1] * *pfVar7 + pfVar7[-1] * *in_EAX + fVar2 * in_EAX[2] + in_EAX[3]) - 0.001;
      local_204[iVar4] = fVar2;
      if (-0.001 <= fVar2) {
        if (0.001 < fVar2) {
          local_288[iVar4] = '\0';
          iVar9 = iVar9 + 1;
        }
      }
      else {
        local_288[iVar4] = '\x01';
        iVar8 = iVar8 + 1;
      }
      iVar5 = iVar4 + 1;
      pfVar7 = pfVar7 + 3;
    } while (iVar5 < *param_2);
    if (iVar9 != 0) {
      if (iVar8 == 0) {
        return param_1;
      }
      local_204[iVar5] = local_204[0];
      local_288[iVar4 + 1] = local_288[0];
      iVar8 = 0;
      iVar9 = 0;
      pfVar6 = param_1 + 2;
      pfVar7 = param_3;
      do {
        if (0x7f < iVar8) break;
        cVar3 = local_288[iVar9];
        if (cVar3 == '\x02') {
          *pfVar7 = pfVar6[-2];
          pfVar7[1] = pfVar6[-1];
          pfVar7[2] = *pfVar6;
          iVar8 = iVar8 + 1;
          pfVar7 = pfVar7 + 3;
        }
        else {
          if (cVar3 == '\0') {
            *pfVar7 = pfVar6[-2];
            pfVar7[1] = pfVar6[-1];
            pfVar7[2] = *pfVar6;
            iVar8 = iVar8 + 1;
            pfVar7 = pfVar7 + 3;
          }
          if ((local_288[iVar9 + 1] != '\x02') && (local_288[iVar9 + 1] != cVar3)) {
            iVar8 = iVar8 + 1;
            fVar2 = local_204[iVar9] / (local_204[iVar9] - local_204[iVar9 + 1]);
            pfVar1 = param_1 + ((iVar9 + 1) % *param_2) * 3;
            *pfVar7 = (*pfVar1 - pfVar6[-2]) * fVar2 + pfVar6[-2];
            pfVar7[1] = (pfVar1[1] - pfVar6[-1]) * fVar2 + pfVar6[-1];
            pfVar7[2] = (pfVar1[2] - *pfVar6) * fVar2 + *pfVar6;
            pfVar7 = pfVar7 + 3;
          }
        }
        iVar9 = iVar9 + 1;
        pfVar6 = pfVar6 + 3;
      } while (iVar9 < *param_2);
      *param_2 = iVar8;
      return param_3;
    }
  }
  *param_2 = 0;
  return (float *)0x0;
}


