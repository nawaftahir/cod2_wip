// 100207f0 size=141 FUN_100207f0

void FUN_100207f0(void)

{
  float fVar1;
  float fVar2;
  int iVar3;
  int iVar4;
  int in_EDX;
  float *pfVar5;
  float *pfVar6;
  float local_18 [6];
  
  iVar4 = 0;
  do {
    iVar3 = iVar4 + 4;
    fVar2 = 1.0 / (*(float *)((int)&DAT_101da98c + iVar4) - *(float *)((int)&DAT_101da980 + iVar4));
    fVar1 = *(float *)((int)&DAT_101da980 + iVar4);
    *(float *)((int)local_18 + iVar4) = fVar2;
    *(float *)((int)local_18 + iVar4 + 0xc) = -(fVar2 * fVar1);
    iVar4 = iVar3;
  } while (iVar3 != 0xc);
  pfVar5 = (float *)&DAT_10191368;
  pfVar6 = (float *)(in_EDX + 0x1c0);
  for (iVar4 = 0x10; iVar4 != 0; iVar4 = iVar4 + -1) {
    *pfVar6 = *pfVar5;
    pfVar5 = pfVar5 + 1;
    pfVar6 = pfVar6 + 1;
  }
  *(float *)(in_EDX + 0x1c0) = local_18[0];
  *(float *)(in_EDX + 0x1d4) = local_18[1];
  *(float *)(in_EDX + 0x1e8) = local_18[2];
  *(float *)(in_EDX + 0x1f0) = local_18[3];
  *(float *)(in_EDX + 500) = local_18[4];
  *(float *)(in_EDX + 0x1f8) = local_18[5];
  return;
}


