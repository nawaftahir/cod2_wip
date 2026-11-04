
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00465ae0(void)

{
  int iVar1;
  char *_String;
  int unaff_ESI;
  char *unaff_EDI;
  double dVar2;
  undefined4 extraout_var;
  
  iVar1 = __stricmp(unaff_EDI,"height");
  if ((iVar1 == 0) && ((*(byte *)(*(int *)(unaff_ESI + 0x50) + 0x160) & 0x40) != 0)) {
    _String = (char *)FUN_00464bb0(extraout_var);
    dVar2 = _atof(_String);
    if ((float)dVar2 < _DAT_00556a70 != ((float)dVar2 == _DAT_00556a70)) {
      FUN_00465bf0();
      return;
    }
    FUN_00465920();
  }
  return;
}

