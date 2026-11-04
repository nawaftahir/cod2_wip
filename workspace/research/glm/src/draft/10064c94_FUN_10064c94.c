


unsigned int FUN_10064c94(char *param_1)

{
  unsigned int uVar1;
  char cVar2;
  
  uVar1 = 0x632d80f;
  if ((param_1 == (char *)0x0) || (cVar2 = *param_1, cVar2 == '\0')) {
    uVar1 = 0;
  }
  else {
    do {
      uVar1 = uVar1 * 0x13 + (int)cVar2;
      param_1 = param_1 + 1;
      cVar2 = *param_1;
    } while (cVar2 != '\0');
    uVar1 = uVar1 % 0x7f;
  }
  return uVar1;
}


