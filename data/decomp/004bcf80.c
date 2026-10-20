
undefined4 FUN_004bcf80(void)

{
  char cVar1;
  char *in_EAX;
  int iVar2;
  
  cVar1 = *in_EAX;
  while( true ) {
    if (cVar1 == '\0') {
      return 1;
    }
    if ((*in_EAX != '.') && (iVar2 = _isdigit((int)*in_EAX), iVar2 == 0)) break;
    cVar1 = in_EAX[1];
    in_EAX = in_EAX + 1;
  }
  return 0;
}

