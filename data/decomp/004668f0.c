
void FUN_004668f0(void)

{
  char *pcVar1;
  char cVar2;
  char *in_EAX;
  FILE *unaff_EDI;
  
  _fputc(0x22,unaff_EDI);
  cVar2 = *in_EAX;
  while (cVar2 != '\0') {
    if ((cVar2 == '\\') || (cVar2 == '\"')) {
      _fputc(0x5c,unaff_EDI);
    }
    _fputc((int)*in_EAX,unaff_EDI);
    pcVar1 = in_EAX + 1;
    in_EAX = in_EAX + 1;
    cVar2 = *pcVar1;
  }
  _fputc(0x22,unaff_EDI);
  return;
}

