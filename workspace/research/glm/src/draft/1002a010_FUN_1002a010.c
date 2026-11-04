


void FUN_1002a010(int param_1,float *param_2,int param_3)

{
  float fVar1;
  unsigned int *puVar2;
  unsigned int uVar3;
  int iVar4;
  float *pfVar5;
  int iVar6;
  unsigned int *puVar7;
  unsigned int *puVar8;
  
LAB_1002a018:
  do {
    pfVar5 = param_2;
    fVar1 = pfVar5[8];
    if (((unsigned int)fVar1 & (int)fVar1 - 1U) == 0) {
      if (fVar1 == 0.0) {
        iVar4 = 1;
      }
      else {
        iVar4 = (int)fVar1 * 2;
      }
      puVar2 = (unsigned int *)(*(void *)RI_Hunk_AllocateTempMemoryInternal)(iVar4 * 4);
      puVar7 = (unsigned int *)pfVar5[9];
      puVar8 = puVar2;
      for (uVar3 = (unsigned int)pfVar5[8] & 0x3fffffff; uVar3 != 0; uVar3 = uVar3 - 1) {
        *puVar8 = *puVar7;
        puVar7 = puVar7 + 1;
        puVar8 = puVar8 + 1;
      }
      for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
        *(unsigned char *)puVar8 = *(unsigned char *)puVar7;
        puVar7 = (unsigned int *)((int)puVar7 + 1);
        puVar8 = (unsigned int *)((int)puVar8 + 1);
      }
      pfVar5[9] = (float)puVar2;
    }
    *(int *)((int)pfVar5[9] + (int)pfVar5[8] * 4) = param_3;
    fVar1 = pfVar5[10];
    pfVar5[8] = (float)((int)pfVar5[8] + 1);
    if (fVar1 == 0.0) {
      return;
    }
    iVar4 = param_3 * 0x60 + *(int *)(param_1 + 0xf8);
    iVar6 = 0;
    if (0 < (int)fVar1) {
      param_2 = (float *)pfVar5[0xb];
      do {
        if ((((*param_2 <= *(float *)(iVar4 + 0x14)) && (param_2[1] <= *(float *)(iVar4 + 0x18))) &&
            (param_2[2] <= *(float *)(iVar4 + 0x1c))) &&
           (((*(float *)(iVar4 + 0x20) <= param_2[3] && (*(float *)(iVar4 + 0x24) <= param_2[4])) &&
            (*(float *)(iVar4 + 0x28) <= param_2[5])))) goto LAB_1002a018;
        iVar6 = iVar6 + 1;
        param_2 = param_2 + 0xc;
      } while (iVar6 < (int)pfVar5[10]);
    }
    iVar6 = 0;
    if (0 < (int)fVar1) {
      param_2 = (float *)pfVar5[0xb];
      do {
        if (param_2[6] == 0.0) {
          if (*(float *)(iVar4 + 0x14) < *param_2) {
            *param_2 = *(float *)(iVar4 + 0x14);
          }
          if (param_2[3] < *(float *)(iVar4 + 0x20)) {
            param_2[3] = *(float *)(iVar4 + 0x20);
          }
          if (*(float *)(iVar4 + 0x18) < param_2[1]) {
            param_2[1] = *(float *)(iVar4 + 0x18);
          }
          if (param_2[4] < *(float *)(iVar4 + 0x24)) {
            param_2[4] = *(float *)(iVar4 + 0x24);
          }
          if (*(float *)(iVar4 + 0x1c) < param_2[2]) {
            param_2[2] = *(float *)(iVar4 + 0x1c);
          }
          if (param_2[5] < *(float *)(iVar4 + 0x28)) {
            param_2[5] = *(float *)(iVar4 + 0x28);
          }
          goto LAB_1002a018;
        }
        iVar6 = iVar6 + 1;
        param_2 = param_2 + 0xc;
      } while (iVar6 < (int)pfVar5[10]);
    }
    puVar2 = (unsigned int *)(*(void *)RI_Hunk_AllocAlignInternal)(((int)fVar1 * 3 + 3) * 0x10,4);
    puVar7 = (unsigned int *)pfVar5[0xb];
    puVar8 = puVar2;
    for (iVar6 = ((int)pfVar5[10] * 3 & 0xfffffffU) << 2; iVar6 != 0; iVar6 = iVar6 + -1) {
      *puVar8 = *puVar7;
      puVar7 = puVar7 + 1;
      puVar8 = puVar8 + 1;
    }
    for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
      *(unsigned char *)puVar8 = *(unsigned char *)puVar7;
      puVar7 = (unsigned int *)((int)puVar7 + 1);
      puVar8 = (unsigned int *)((int)puVar8 + 1);
    }
    pfVar5[0xb] = (float)puVar2;
    param_2 = (float *)(puVar2 + (int)pfVar5[10] * 0xc);
    pfVar5[10] = (float)((int)pfVar5[10] + 1);
    *param_2 = *(float *)(iVar4 + 0x14);
    param_2[1] = *(float *)(iVar4 + 0x18);
    param_2[2] = *(float *)(iVar4 + 0x1c);
    param_2[3] = *(float *)(iVar4 + 0x20);
    param_2[4] = *(float *)(iVar4 + 0x24);
    param_2[5] = *(float *)(iVar4 + 0x28);
  } while( true );
}


