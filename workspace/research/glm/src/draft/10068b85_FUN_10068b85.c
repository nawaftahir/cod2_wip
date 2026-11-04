


unsigned int FUN_10068b85(char *param_1)

{
  char cVar1;
  int iVar2;
  unsigned int uVar3;
  
  uVar3 = 0;
  if ((param_1 == (char *)0x0) || (cVar1 = *param_1, cVar1 == '\0')) {
    uVar3 = 0;
  }
  else {
    do {
      iVar2 = _toupper((int)cVar1);
      uVar3 = uVar3 * 0x13 + iVar2;
      param_1 = param_1 + 1;
      cVar1 = *param_1;
    } while (cVar1 != '\0');
    uVar3 = uVar3 % 7;
  }
  return uVar3;
}


