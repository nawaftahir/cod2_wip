
void FUN_00467640(void)

{
  char cVar1;
  char *_Src;
  undefined4 *unaff_ESI;
  char *_Format;
  
  cVar1 = FUN_00465d80();
  if (cVar1 != '\0') {
    _Format = "%f %f %f";
    _Src = (char *)FUN_00464bb0();
    _sscanf(_Src,_Format);
    return;
  }
  *unaff_ESI = 0;
  unaff_ESI[1] = 0;
  unaff_ESI[2] = 0;
  return;
}

