// 1002c060 size=71 FUN_1002c060

undefined4 FUN_1002c060(float param_1)

{
  int in_ECX;
  float *pfVar1;
  int iVar2;
  int unaff_ESI;
  float *unaff_EDI;
  
  iVar2 = 0;
  if (0 < unaff_ESI) {
    pfVar1 = (float *)(in_ECX + 4);
    do {
      if (unaff_EDI[1] * *pfVar1 + pfVar1[1] * unaff_EDI[2] + pfVar1[-1] * *unaff_EDI + pfVar1[2] <
          -param_1) {
        return 2;
      }
      iVar2 = iVar2 + 1;
      pfVar1 = pfVar1 + 5;
    } while (iVar2 < unaff_ESI);
  }
  return 0;
}


