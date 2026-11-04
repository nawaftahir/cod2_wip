// 1005df90 size=273 FUN_1005df90

void FUN_1005df90(float *param_1)

{
  int iVar1;
  int iVar2;
  float10 fVar3;
  float *in_EAX;
  int iVar4;
  int unaff_EBX;
  float10 fVar5;
  float local_38 [4];
  float local_28;
  float local_24;
  int local_20 [7];
  
  local_38[1] = in_EAX[1];
  local_38[0] = *in_EAX;
  local_38[2] = in_EAX[2];
  local_20[1] = 2;
  local_20[2] = 2;
  iVar4 = 0;
  local_38[3] = local_38[0];
  local_28 = local_38[1];
  local_24 = local_38[2];
  local_20[0] = 1;
  local_20[3] = 0;
  local_20[4] = 0;
  local_20[5] = 1;
  do {
    if (*(float *)(unaff_EBX + iVar4 * 4) != 0.0) {
      fVar5 = (float10)((*(float *)(unaff_EBX + iVar4 * 4) * 3.1415927) / 180.0);
      fVar3 = (float10)fcos(fVar5);
      fVar5 = (float10)fsin(fVar5);
      iVar1 = local_20[iVar4 * 2];
      iVar2 = local_20[iVar4 * 2 + 1];
      local_38[iVar1 + 3] = local_38[iVar1] * (float)fVar3 - local_38[iVar2] * (float)fVar5;
      local_38[iVar2 + 3] = local_38[iVar1] * (float)fVar5 + local_38[iVar2] * (float)fVar3;
      local_38[0] = local_38[3];
      local_38[1] = local_28;
      local_38[2] = local_24;
    }
    iVar4 = iVar4 + 1;
  } while (iVar4 < 3);
  param_1[2] = local_38[2];
  param_1[1] = local_38[1];
  *param_1 = local_38[0];
  return;
}


