// 1002cee0 size=726 R_RegisterXModelSurfs

void R_RegisterXModelSurfs(int param_1,int param_2,float *param_3,float *param_4,float *param_5)

{
  float fVar1;
  float *pfVar2;
  float *pfVar3;
  float *pfVar4;
  float *pfVar5;
  int iVar6;
  uint uVar7;
  
  iVar6 = (int)*(short *)(param_1 + 6);
  pfVar2 = *(float **)(param_1 + 0xc);
  if (iVar6 == -1) {
    for (iVar6 = (int)*(short *)(param_1 + 2); iVar6 != 0; iVar6 = iVar6 + -1) {
      pfVar3 = param_5;
      if (param_5 != (float *)0x0) {
        pfVar4 = (float *)(*(short *)((int)pfVar2 + 0x3e) + param_2);
        pfVar3 = param_5 + 3;
        *param_5 = *pfVar2 * *pfVar4 +
                   pfVar4[8] * pfVar2[2] +
                   *(float *)(*(short *)((int)pfVar2 + 0x3e) + 0x10 + param_2) * pfVar2[1];
        param_5[1] = pfVar4[9] * pfVar2[2] + pfVar4[1] * *pfVar2 + pfVar4[5] * pfVar2[1];
        param_5[2] = pfVar4[10] * pfVar2[2] + pfVar4[2] * *pfVar2 + pfVar4[6] * pfVar2[1];
      }
      pfVar4 = (float *)(*(short *)((int)pfVar2 + 0x3e) + param_2);
      *param_3 = pfVar2[0xc] * *pfVar4 +
                 pfVar4[4] * pfVar2[0xd] +
                 *(float *)(*(short *)((int)pfVar2 + 0x3e) + 0x20 + param_2) * pfVar2[0xe] +
                 pfVar4[0xc];
      param_3[1] = pfVar4[5] * pfVar2[0xd] + pfVar4[9] * pfVar2[0xe] + pfVar4[1] * pfVar2[0xc] +
                   pfVar4[0xd];
      param_3[2] = pfVar4[6] * pfVar2[0xd] + pfVar4[10] * pfVar2[0xe] + pfVar4[2] * pfVar2[0xc] +
                   pfVar4[0xe];
      uVar7 = (uint)*(byte *)(pfVar2 + 0xf);
      if (uVar7 == 0) {
        pfVar2 = pfVar2 + 0x10;
      }
      else {
        fVar1 = (float)*(byte *)((int)pfVar2 + 0x3d) * 0.00390625;
        *param_3 = fVar1 * *param_3;
        param_3[1] = fVar1 * param_3[1];
        param_3[2] = fVar1 * param_3[2];
        pfVar4 = pfVar2 + 0x10;
        do {
          pfVar5 = (float *)(*(short *)(pfVar4 + 3) + param_2);
          uVar7 = uVar7 - 1;
          pfVar2 = pfVar4 + 4;
          fVar1 = (float)*(ushort *)((int)pfVar4 + 0xe) * 1.5258789e-05;
          *param_3 = (*pfVar4 * *pfVar5 + pfVar5[8] * pfVar4[2] + pfVar5[4] * pfVar4[1] +
                     pfVar5[0xc]) * fVar1 + *param_3;
          param_3[1] = (pfVar5[9] * pfVar4[2] + pfVar5[1] * *pfVar4 + pfVar5[5] * pfVar4[1] +
                       pfVar5[0xd]) * fVar1 + param_3[1];
          param_3[2] = (pfVar5[10] * pfVar4[2] + pfVar5[2] * *pfVar4 + pfVar5[6] * pfVar4[1] +
                       pfVar5[0xe]) * fVar1 + param_3[2];
          pfVar4 = pfVar2;
        } while (uVar7 != 0);
      }
      param_3 = param_3 + 3;
      param_5 = pfVar3;
    }
  }
  else {
    param_1 = (int)*(short *)(param_1 + 2);
    if (param_1 != 0) {
      pfVar3 = pfVar2 + 0xd;
      pfVar4 = param_5;
      do {
        pfVar5 = pfVar4;
        if (pfVar4 != (float *)0x0) {
          pfVar5 = pfVar4 + 3;
          *pfVar4 = *(float *)(iVar6 + 0x10 + param_2) * pfVar3[-0xc] +
                    *pfVar2 * *(float *)(iVar6 + param_2) +
                    *(float *)(iVar6 + 0x20 + param_2) * pfVar3[-0xb];
          pfVar4[1] = pfVar3[-0xc] * *(float *)(iVar6 + 0x14 + param_2) +
                      pfVar3[-0xb] * *(float *)(iVar6 + 0x24 + param_2) +
                      *pfVar2 * *(float *)(iVar6 + 4 + param_2);
          pfVar4[2] = pfVar3[-0xc] * *(float *)(iVar6 + 0x18 + param_2) +
                      pfVar3[-0xb] * *(float *)(iVar6 + 0x28 + param_2) +
                      *pfVar2 * *(float *)(iVar6 + 8 + param_2);
          param_5 = pfVar5;
        }
        pfVar4 = pfVar5;
        if (param_4 != (float *)0x0) {
          *param_4 = pfVar3[-6];
          param_4[1] = pfVar3[-2];
          param_4 = param_4 + 2;
          pfVar4 = param_5;
        }
        pfVar2 = pfVar2 + 0x10;
        param_1 = param_1 + -1;
        *param_3 = pfVar3[-1] * *(float *)(iVar6 + param_2) +
                   *(float *)(iVar6 + 0x20 + param_2) * pfVar3[1] +
                   *pfVar3 * *(float *)(iVar6 + 0x10 + param_2) + *(float *)(iVar6 + 0x30 + param_2)
        ;
        param_3[1] = pfVar3[1] * *(float *)(iVar6 + 0x24 + param_2) +
                     *pfVar3 * *(float *)(iVar6 + 0x14 + param_2) +
                     *(float *)(iVar6 + 4 + param_2) * pfVar3[-1] +
                     *(float *)(iVar6 + 0x34 + param_2);
        param_3[2] = pfVar3[1] * *(float *)(iVar6 + 0x28 + param_2) +
                     *pfVar3 * *(float *)(iVar6 + 0x18 + param_2) +
                     *(float *)(iVar6 + 8 + param_2) * pfVar3[-1] +
                     *(float *)(iVar6 + 0x38 + param_2);
        pfVar3 = pfVar3 + 0x10;
        param_3 = param_3 + 3;
      } while (param_1 != 0);
      return;
    }
  }
  return;
}


