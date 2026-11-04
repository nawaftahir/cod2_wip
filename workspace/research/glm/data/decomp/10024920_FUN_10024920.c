// 10024920 size=156 FUN_10024920

void FUN_10024920(void)

{
  byte bVar1;
  int iVar2;
  float *in_EAX;
  uint uVar3;
  
  iVar2 = DAT_101ce798;
  if (DAT_101d61c8 != '\0') {
    *in_EAX = (float)DAT_101d61ba * 0.003921569;
    in_EAX[1] = (float)DAT_101d61b9 * 0.003921569;
    uVar3 = (uint)DAT_101d61b8;
    in_EAX[3] = 1.0;
    in_EAX[2] = (float)uVar3 * 0.003921569;
    return;
  }
  *in_EAX = (float)*(byte *)(DAT_101ce798 + 8) * 0.003921569;
  in_EAX[1] = (float)*(byte *)(iVar2 + 9) * 0.003921569;
  bVar1 = *(byte *)(iVar2 + 10);
  in_EAX[3] = 1.0;
  in_EAX[2] = (float)bVar1 * 0.003921569;
  return;
}


