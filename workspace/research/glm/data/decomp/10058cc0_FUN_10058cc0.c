// 10058cc0 size=85 FUN_10058cc0

undefined4 FUN_10058cc0(float param_1)

{
  float fVar1;
  int in_EAX;
  float *in_ECX;
  int iVar2;
  int unaff_ESI;
  int iVar3;
  
  iVar2 = 0;
  if (0 < unaff_ESI) {
    iVar3 = in_EAX - (int)in_ECX;
    do {
      fVar1 = *(float *)((int)in_ECX + iVar3) - *in_ECX;
      if (param_1 * param_1 < fVar1 * fVar1) {
        return 0;
      }
      iVar2 = iVar2 + 1;
      in_ECX = in_ECX + 1;
    } while (iVar2 < unaff_ESI);
  }
  return 1;
}


