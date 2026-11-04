// 10011f10 size=148 FUN_10011f10

void FUN_10011f10(void)

{
  float fVar1;
  short sVar2;
  short *in_ECX;
  int iVar3;
  short sVar4;
  float10 fVar5;
  
  fVar1 = *(float *)(DAT_101ce62c + 8);
  sVar4 = 0;
  iVar3 = 0x100;
  do {
    sVar2 = sVar4;
    if (1.0 / fVar1 != 1.0) {
      fVar5 = (float10)FUN_100f8f20();
      sVar2 = (short)(int)ROUND((float)(fVar5 * (float10)65535.0) + 9.313226e-10);
    }
    sVar4 = sVar4 + 0x101;
    *in_ECX = sVar2;
    in_ECX = in_ECX + 1;
    iVar3 = iVar3 + -1;
  } while (iVar3 != 0);
  return;
}


