
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00489260(float *param_1)

{
  int iVar1;
  int iVar2;
  float10 fVar3;
  float fVar4;
  float *in_EAX;
  int iVar5;
  int unaff_EBX;
  float10 fVar6;
  int local_58 [6];
  float local_40 [4];
  float local_30;
  float local_2c;
  double local_28;
  double local_20;
  double local_18;
  double *local_10;
  double *local_c;
  
  local_30 = in_EAX[1];
  local_40[3] = *in_EAX;
  local_2c = in_EAX[2];
  local_58[1] = 2;
  local_58[2] = 2;
  iVar5 = 0;
  local_40[0] = local_40[3];
  local_58[0] = 1;
  local_58[3] = 0;
  local_58[4] = 0;
  local_58[5] = 1;
  local_40[1] = local_30;
  local_40[2] = local_2c;
  do {
    if (*(float *)(unaff_EBX + iVar5 * 4) != _DAT_00556a70) {
      local_10 = &local_18;
      local_c = &local_20;
      fVar4 = (*(float *)(unaff_EBX + iVar5 * 4) * _DAT_00556b74) / (float)_DAT_00556b80;
      local_28 = (double)fVar4;
      fVar6 = (float10)fVar4;
      fVar3 = (float10)fcos(fVar6);
      fVar6 = (float10)fsin(fVar6);
      local_18 = (double)fVar3;
      local_20 = (double)fVar6;
      iVar1 = local_58[iVar5 * 2];
      iVar2 = local_58[iVar5 * 2 + 1];
      local_40[iVar1] = local_40[iVar1 + 3] * (float)fVar3 - local_40[iVar2 + 3] * (float)fVar6;
      local_40[iVar2] =
           local_40[iVar1 + 3] * (float)local_20 + local_40[iVar2 + 3] * (float)local_18;
      local_40[3] = local_40[0];
      local_30 = local_40[1];
      local_2c = local_40[2];
    }
    iVar5 = iVar5 + 1;
  } while (iVar5 < 3);
  param_1[2] = local_2c;
  param_1[1] = local_30;
  *param_1 = local_40[3];
  return;
}

