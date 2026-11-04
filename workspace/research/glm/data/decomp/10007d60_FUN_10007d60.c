// 10007d60 size=93 FUN_10007d60

int FUN_10007d60(void)

{
  int iVar1;
  float *pfVar2;
  int *piVar3;
  float *unaff_ESI;
  
  if (DAT_101d1b9c == 0) {
    FUN_100138c0(1,&DAT_101925cc);
  }
  piVar3 = *(int **)(DAT_101d1b9c + 0xc);
  iVar1 = *piVar3;
  while (iVar1 == -1) {
    pfVar2 = (float *)piVar3[3];
    if ((*pfVar2 * *unaff_ESI + pfVar2[1] * unaff_ESI[1] + pfVar2[2] * unaff_ESI[2]) - pfVar2[3] <=
        0.0) {
      piVar3 = (int *)piVar3[5];
    }
    else {
      piVar3 = (int *)piVar3[4];
    }
    iVar1 = *piVar3;
  }
  return piVar3[2];
}


