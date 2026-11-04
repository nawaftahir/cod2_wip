// 1005c8c0 size=167 FUN_1005c8c0

void FUN_1005c8c0(void)

{
  float *in_EAX;
  float *pfVar1;
  int in_ECX;
  float *pfVar2;
  int in_EDX;
  uint uVar3;
  int iVar4;
  int unaff_ESI;
  
  iVar4 = 3;
  pfVar1 = in_EAX;
  pfVar2 = (float *)(in_ECX + 0x18);
  do {
    *pfVar1 = *(float *)((in_EDX - (int)in_EAX) + (int)pfVar1);
    pfVar1[3] = *(float *)((in_EDX - (int)in_EAX) + (int)pfVar1);
    uVar3 = (-1 < (int)pfVar2[-6]) - 1 & 0xc;
    *pfVar1 = *(float *)(uVar3 + unaff_ESI) * pfVar2[-6] + *pfVar1;
    pfVar1[3] = *(float *)((unaff_ESI - uVar3) + 0xc) * pfVar2[-6] + pfVar1[3];
    uVar3 = (-1 < (int)pfVar2[-3]) - 1 & 0xc;
    *pfVar1 = *(float *)(unaff_ESI + 4 + uVar3) * pfVar2[-3] + *pfVar1;
    pfVar1[3] = *(float *)((unaff_ESI - uVar3) + 0x10) * pfVar2[-3] + pfVar1[3];
    uVar3 = (-1 < (int)*pfVar2) - 1 & 0xc;
    iVar4 = iVar4 + -1;
    *pfVar1 = *(float *)(unaff_ESI + 8 + uVar3) * *pfVar2 + *pfVar1;
    pfVar1[3] = *(float *)((unaff_ESI - uVar3) + 0x14) * *pfVar2 + pfVar1[3];
    pfVar1 = pfVar1 + 1;
    pfVar2 = pfVar2 + 1;
  } while (iVar4 != 0);
  return;
}


