
uint FUN_0048b7e0(void)

{
  char cVar1;
  char *in_EAX;
  int iVar2;
  uint uVar3;
  int iVar4;
  
  if (in_EAX == (char *)0x0) {
    FUN_0047ae50(1,"null name in generateHashValue");
  }
  cVar1 = *in_EAX;
  uVar3 = 0;
  if (cVar1 != '\0') {
    iVar4 = 0x77 - (int)in_EAX;
    do {
      iVar2 = _tolower((int)cVar1);
      uVar3 = uVar3 + iVar2 * (int)(in_EAX + iVar4);
      cVar1 = in_EAX[1];
      in_EAX = in_EAX + 1;
    } while (cVar1 != '\0');
  }
  return uVar3 & 0xff;
}

