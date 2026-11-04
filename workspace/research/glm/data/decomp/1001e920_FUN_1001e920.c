// 1001e920 size=337 FUN_1001e920

void FUN_1001e920(int param_1)

{
  float fVar1;
  int in_EAX;
  float *pfVar2;
  float *in_ECX;
  uint uVar3;
  int iVar4;
  float *pfVar5;
  float *pfVar6;
  float *local_58;
  int local_54;
  float local_50 [7];
  float local_34;
  float local_30;
  float local_2c;
  
  pfVar6 = *(float **)(in_EAX + 0xc);
  local_54 = (int)*(short *)(in_EAX + 2);
  local_58 = in_ECX;
  if (0 < local_54) {
    do {
      FUN_1001e260(pfVar6 + 0xc,pfVar6 + 8);
      local_2c = pfVar6[0xb];
      uVar3 = (uint)*(byte *)(pfVar6 + 0xf);
      local_34 = pfVar6[3];
      local_30 = pfVar6[7];
      if (uVar3 == 0) {
        pfVar6 = pfVar6 + 0x10;
      }
      else {
        fVar1 = (float)*(byte *)((int)pfVar6 + 0x3d) * 0.00390625;
        local_50[0] = local_50[0] * fVar1;
        local_50[1] = local_50[1] * fVar1;
        local_50[2] = local_50[2] * fVar1;
        pfVar5 = pfVar6 + 0x10;
        do {
          pfVar2 = (float *)(*(short *)(pfVar5 + 3) + param_1);
          uVar3 = uVar3 - 1;
          pfVar6 = pfVar5 + 4;
          fVar1 = (float)*(ushort *)((int)pfVar5 + 0xe) * 1.5258789e-05;
          local_50[0] = (*pfVar5 * *pfVar2 + pfVar2[4] * pfVar5[1] + pfVar2[8] * pfVar5[2] +
                        pfVar2[0xc]) * fVar1 + local_50[0];
          local_50[1] = (pfVar2[1] * *pfVar5 + pfVar2[5] * pfVar5[1] + pfVar2[9] * pfVar5[2] +
                        pfVar2[0xd]) * fVar1 + local_50[1];
          local_50[2] = (pfVar2[2] * *pfVar5 + pfVar2[6] * pfVar5[1] + pfVar2[10] * pfVar5[2] +
                        pfVar2[0xe]) * fVar1 + local_50[2];
          pfVar5 = pfVar6;
        } while (uVar3 != 0);
      }
      local_54 = local_54 + -1;
      pfVar5 = local_50;
      pfVar2 = local_58;
      for (iVar4 = 0x10; iVar4 != 0; iVar4 = iVar4 + -1) {
        *pfVar2 = *pfVar5;
        pfVar5 = pfVar5 + 1;
        pfVar2 = pfVar2 + 1;
      }
      local_58 = local_58 + 0x10;
    } while (local_54 != 0);
  }
  return;
}


