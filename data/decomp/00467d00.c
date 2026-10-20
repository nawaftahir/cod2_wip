
void FUN_00467d00(void)

{
  char cVar1;
  int iVar2;
  char *_Src;
  int unaff_ESI;
  char *_Format;
  float local_10;
  float local_c;
  float local_8;
  
  if ((*(int *)(*(int *)(unaff_ESI + 0x50) + 8) == 0) && (DAT_0124a2d6 == '\0')) {
    iVar2 = FUN_0047d980();
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a2d6 = '\x01';
    }
  }
  cVar1 = FUN_00465d80();
  if (cVar1 == '\0') {
    local_10 = 0.0;
    local_c = 0.0;
    local_8 = 0.0;
  }
  else {
    _Format = "%f %f %f";
    _Src = (char *)FUN_00464bb0("%f %f %f",&local_10,&local_c,&local_8);
    _sscanf(_Src,_Format);
  }
  FUN_00467be0();
  FUN_004969e0("%g %g %g",(double)local_10,(double)local_c,(double)local_8);
  FUN_00465bf0();
  return;
}

