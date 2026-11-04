// 10007a20 size=113 FUN_10007a20

undefined4 FUN_10007a20(int param_1)

{
  char cVar1;
  int in_EAX;
  float *in_ECX;
  float *pfVar2;
  int iVar3;
  
  if ((DAT_101ce5b0 != 0) && (cVar1 = FUN_100079d0(), cVar1 != '\0')) {
    return 1;
  }
  if (in_EAX != 0) {
    do {
      iVar3 = 0;
      if (*(int *)(param_1 + 0x10) < 1) {
        return 1;
      }
      pfVar2 = *(float **)(param_1 + 0x14);
      while (*in_ECX * *pfVar2 + pfVar2[1] * in_ECX[1] + pfVar2[2] * in_ECX[2] + in_ECX[3] <= 0.0) {
        iVar3 = iVar3 + 1;
        pfVar2 = pfVar2 + 3;
        if (*(int *)(param_1 + 0x10) <= iVar3) {
          return 1;
        }
      }
      in_ECX = in_ECX + 5;
      in_EAX = in_EAX + -1;
    } while (in_EAX != 0);
  }
  return 0;
}


