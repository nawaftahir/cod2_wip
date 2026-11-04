// 1003ee10 size=62 FUN_1003ee10

undefined4 FUN_1003ee10(void)

{
  float fVar1;
  int in_EAX;
  float *in_ECX;
  int iVar2;
  int iVar3;
  
  iVar2 = 0;
  iVar3 = in_EAX - (int)in_ECX;
  do {
    fVar1 = *(float *)((int)in_ECX + iVar3) - *in_ECX;
    if (1.0000001e-06 < fVar1 * fVar1) {
      return 0;
    }
    iVar2 = iVar2 + 1;
    in_ECX = in_ECX + 1;
  } while (iVar2 < 3);
  return 1;
}


