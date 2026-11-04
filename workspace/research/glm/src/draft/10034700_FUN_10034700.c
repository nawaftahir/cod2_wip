extern unsigned int DAT_10196ccc;
extern unsigned int DAT_106d3194;
extern unsigned int DAT_1072ddb8;
extern int FUN_10005680();
extern int FUN_10060c70();


void FUN_10034700(int param_1)

{
  int iVar1;
  float *pfVar2;
  unsigned int uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  float fVar7;
  int local_14;
  float local_c;
  float local_8;
  float local_4;
  
  iVar6 = 0;
  local_14 = 0;
  iVar4 = g_106d3194;
 
	int g_106d3194 = DAT_106d3194; if (0 < *(int *)(g_106d3194 + 0x249d64)) {
    do {
      iVar5 = DAT_1072ddb8 - *(int *)(iVar6 + 0x20 + *(int *)(iVar4 + 0x249d60));
      if ((-1 < iVar5) && (iVar5 <= *(int *)(iVar6 + *(int *)(iVar4 + 0x249d60) + 0x24))) {
        *(unsigned int *)(iVar6 + 0x18 + *(int *)(iVar4 + 0x249d60)) = 0x3f800000;
        if (*(int *)(iVar6 + 0x24 + *(int *)(iVar4 + 0x249d60)) < iVar5 * 2) {
          iVar1 = iVar6 + *(int *)(iVar4 + 0x249d60);
          *(float *)(iVar1 + 0x18) =
               2.0 - ((float)iVar5 + (float)iVar5) / (float)*(int *)(iVar1 + 0x24);
        }
        pfVar2 = (float *)(*(int *)(iVar4 + 0x249d60) + iVar6);
        fVar7 = (float)fsin((float)0.012566371 * (float)iVar5 + (float)local_14);
        fVar7 = fVar7 * (float)4.0;
        local_c = (float)(fVar7 * (float)*(float *)(param_1 + 0x18) + (float)*pfVar2);
        local_8 = (float)(fVar7 * (float)*(float *)(param_1 + 0x1c) + (float)pfVar2[1]);
        local_4 = (float)((float)iVar5 * (float)0.064 +
                         fVar7 * (float)*(float *)(param_1 + 0x20) + (float)pfVar2[2]);
        uVar3 = FUN_10060c70(&DAT_10196ccc,pfVar2[7]);
        FUN_10005680(&local_c,0x3f000000,uVar3);
        iVar4 = g_106d3194;
      }
      local_14 = local_14 + 1;
      iVar6 = iVar6 + 0x28;
    } while (local_14 < *(int *)(iVar4 + 0x249d64));
  }
  return;
}


