// 10025b10 size=503 FUN_10025b10

void FUN_10025b10(int param_1,int param_2,byte *param_3)

{
  int iVar1;
  float fVar2;
  int in_EAX;
  int iVar3;
  byte *pbVar4;
  int in_ECX;
  int in_EDX;
  int iVar5;
  undefined1 *puVar6;
  int local_2c;
  undefined1 local_24;
  undefined1 local_20;
  undefined1 local_1c;
  undefined1 local_18;
  undefined1 local_14;
  undefined1 local_10;
  
  param_2 = in_ECX * param_2;
  fVar2 = 0.5 / (float)param_1;
  iVar3 = (in_EDX + -1) * param_2;
  pbVar4 = param_3 + iVar3;
  pbVar4[param_2] = param_3[iVar3];
  pbVar4[param_2 + 1] = pbVar4[1];
  puVar6 = (undefined1 *)(in_EAX + (param_1 + -1) * param_2);
  pbVar4[param_2 + 2] = pbVar4[2];
  iVar5 = param_1 - in_EDX;
  iVar3 = param_1 + in_EDX;
  if (-1 < param_1 + -1) {
    local_2c = param_1;
    do {
      if (pbVar4 < param_3) {
        iVar1 = iVar5 + iVar3;
        local_18 = (undefined1)
                   (int)ROUND((float)(int)((uint)*param_3 * iVar1) * fVar2 + 9.313226e-10);
        *puVar6 = local_18;
        local_14 = (undefined1)
                   (int)ROUND((float)(int)((uint)param_3[1] * iVar1) * fVar2 + 9.313226e-10);
        puVar6[1] = local_14;
        local_10 = (undefined1)
                   (int)ROUND((float)(int)((uint)param_3[2] * iVar1) * fVar2 + 9.313226e-10);
        local_1c = local_10;
      }
      else {
        local_24 = (undefined1)
                   (int)ROUND((float)(int)((uint)pbVar4[param_2] * iVar5 + (uint)*pbVar4 * iVar3) *
                              fVar2 + 9.313226e-10);
        *puVar6 = local_24;
        local_20 = (undefined1)
                   (int)ROUND((float)(int)((uint)pbVar4[param_2 + 1] * iVar5 +
                                          (uint)pbVar4[1] * iVar3) * fVar2 + 9.313226e-10);
        puVar6[1] = local_20;
        local_1c = (undefined1)
                   (int)ROUND((float)(int)((uint)pbVar4[param_2 + 2] * iVar5 +
                                          (uint)pbVar4[2] * iVar3) * fVar2 + 9.313226e-10);
      }
      puVar6[2] = local_1c;
      puVar6 = puVar6 + -param_2;
      iVar3 = iVar3 + in_EDX * 2;
      iVar5 = iVar5 + in_EDX * -2;
      if (iVar5 < 0) {
        iVar3 = iVar3 + param_1 * -2;
        iVar5 = iVar5 + param_1 * 2;
        pbVar4 = pbVar4 + -param_2;
      }
      local_2c = local_2c + -1;
    } while (local_2c != 0);
  }
  return;
}


