// 1001ec20 size=324 FUN_1001ec20

void FUN_1001ec20(int param_1)

{
  float fVar1;
  int in_EAX;
  float *pfVar2;
  float *in_ECX;
  uint uVar3;
  int iVar4;
  float *pfVar5;
  float *pfVar6;
  float *local_2c;
  int local_28;
  float local_24 [6];
  float local_c;
  float local_8;
  float local_4;
  
  pfVar6 = *(float **)(in_EAX + 0xc);
  local_28 = (int)*(short *)(in_EAX + 2);
  local_2c = in_ECX;
  if (0 < local_28) {
    do {
      FUN_1001e3a0();
      local_4 = pfVar6[0xb];
      uVar3 = (uint)*(byte *)(pfVar6 + 0xf);
      local_c = pfVar6[3];
      local_8 = pfVar6[7];
      if (uVar3 == 0) {
        pfVar6 = pfVar6 + 0x10;
      }
      else {
        fVar1 = (float)*(byte *)((int)pfVar6 + 0x3d) * 0.00390625;
        local_24[0] = local_24[0] * fVar1;
        local_24[1] = local_24[1] * fVar1;
        local_24[2] = local_24[2] * fVar1;
        pfVar5 = pfVar6 + 0x10;
        do {
          pfVar2 = (float *)(*(short *)(pfVar5 + 3) + param_1);
          uVar3 = uVar3 - 1;
          pfVar6 = pfVar5 + 4;
          fVar1 = (float)*(ushort *)((int)pfVar5 + 0xe) * 1.5258789e-05;
          local_24[0] = (*pfVar5 * *pfVar2 + pfVar2[4] * pfVar5[1] + pfVar2[8] * pfVar5[2] +
                        pfVar2[0xc]) * fVar1 + local_24[0];
          local_24[1] = (pfVar2[1] * *pfVar5 + pfVar2[5] * pfVar5[1] + pfVar2[9] * pfVar5[2] +
                        pfVar2[0xd]) * fVar1 + local_24[1];
          local_24[2] = (pfVar2[2] * *pfVar5 + pfVar2[6] * pfVar5[1] + pfVar2[10] * pfVar5[2] +
                        pfVar2[0xe]) * fVar1 + local_24[2];
          pfVar5 = pfVar6;
        } while (uVar3 != 0);
      }
      pfVar5 = local_24;
      pfVar2 = local_2c;
      for (iVar4 = 9; iVar4 != 0; iVar4 = iVar4 + -1) {
        *pfVar2 = *pfVar5;
        pfVar5 = pfVar5 + 1;
        pfVar2 = pfVar2 + 1;
      }
      local_2c = local_2c + 9;
      local_28 = local_28 + -1;
    } while (local_28 != 0);
  }
  return;
}


