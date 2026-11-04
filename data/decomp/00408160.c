
long FUN_00408160(void)

{
  long _Offset;
  long lVar1;
  FILE *unaff_ESI;
  
  _Offset = _ftell(unaff_ESI);
  _fseek(unaff_ESI,0,2);
  lVar1 = _ftell(unaff_ESI);
  _fseek(unaff_ESI,_Offset,0);
  return lVar1;
}

