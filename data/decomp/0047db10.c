
uint FUN_0047db10(int param_1)

{
  char *pcVar1;
  char *in_EAX;
  int iVar2;
  int iVar3;
  uint uVar4;
  
  uVar4 = 0;
  if (*in_EAX != '\0') {
    iVar3 = 0x77 - (int)in_EAX;
    do {
      iVar2 = _tolower((int)*in_EAX);
      if (iVar2 == 0x2e) break;
      if (iVar2 == 0x5c) {
        iVar2 = 0x2f;
      }
      pcVar1 = in_EAX + 1;
      uVar4 = uVar4 + (int)(in_EAX + iVar3) * iVar2;
      in_EAX = in_EAX + 1;
    } while (*pcVar1 != '\0');
  }
  return ((int)((int)uVar4 >> 10 ^ uVar4) >> 10 ^ uVar4) & param_1 - 1U;
}

