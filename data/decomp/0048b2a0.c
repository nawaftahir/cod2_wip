
uint FUN_0048b2a0(int param_1)

{
  char *in_EAX;
  int iVar1;
  uint uVar2;
  int iVar3;
  
  uVar2 = 0;
  iVar1 = 0;
  if (0 < param_1) {
    iVar3 = 0x77 - (int)in_EAX;
    do {
      if (*in_EAX == '\0') break;
      uVar2 = uVar2 + (int)(in_EAX + iVar3) * (int)*in_EAX;
      iVar1 = iVar1 + 1;
      in_EAX = in_EAX + 1;
    } while (iVar1 < param_1);
  }
  return (int)((int)uVar2 >> 10 ^ uVar2) >> 10 ^ uVar2;
}

