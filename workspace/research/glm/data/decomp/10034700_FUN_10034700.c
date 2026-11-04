// 10034700 size=297 FUN_10034700

void FUN_10034700(int param_1)

{
  int iVar1;
  float *pfVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  float10 fVar7;
  int local_14;
  float local_c;
  float local_8;
  float local_4;
  
  iVar6 = 0;
  local_14 = 0;
  iVar4 = DAT_106d3194;
  if (0 < *(int *)(DAT_106d3194 + 0x249d64)) {
    do {
      iVar5 = DAT_1072ddb8 - *(int *)(iVar6 + 0x20 + *(int *)(iVar4 + 0x249d60));
      if ((-1 < iVar5) && (iVar5 <= *(int *)(iVar6 + *(int *)(iVar4 + 0x249d60) + 0x24))) {
        *(undefined4 *)(iVar6 + 0x18 + *(int *)(iVar4 + 0x249d60)) = 0x3f800000;
        if (*(int *)(iVar6 + 0x24 + *(int *)(iVar4 + 0x249d60)) < iVar5 * 2) {
          iVar1 = iVar6 + *(int *)(iVar4 + 0x249d60);
          *(float *)(iVar1 + 0x18) =
               2.0 - ((float)iVar5 + (float)iVar5) / (float)*(int *)(iVar1 + 0x24);
        }
        pfVar2 = (float *)(*(int *)(iVar4 + 0x249d60) + iVar6);
        fVar7 = (float10)fsin((float10)0.012566371 * (float10)iVar5 + (float10)local_14);
        fVar7 = fVar7 * (float10)4.0;
        local_c = (float)(fVar7 * (float10)*(float *)(param_1 + 0x18) + (float10)*pfVar2);
        local_8 = (float)(fVar7 * (float10)*(float *)(param_1 + 0x1c) + (float10)pfVar2[1]);
        local_4 = (float)((float10)iVar5 * (float10)0.064 +
                         fVar7 * (float10)*(float *)(param_1 + 0x20) + (float10)pfVar2[2]);
        uVar3 = FUN_10060c70(&DAT_10196ccc,pfVar2[7]);
        FUN_10005680(&local_c,0x3f000000,uVar3);
        iVar4 = DAT_106d3194;
      }
      local_14 = local_14 + 1;
      iVar6 = iVar6 + 0x28;
    } while (local_14 < *(int *)(iVar4 + 0x249d64));
  }
  return;
}


