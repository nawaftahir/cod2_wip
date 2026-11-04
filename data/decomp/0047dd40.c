
long FUN_0047dd40(void)

{
  int in_EAX;
  int iVar1;
  FILE *_File;
  long _Offset;
  long lVar2;
  
  if ((in_EAX == 0) && (DAT_0124a3b7 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_00546b30,"\\trees\\cod2src\\src\\universal\\com_files.cpp",0x249);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a3b7 = '\x01';
    }
  }
  if (DAT_01233508 == 0) {
    FUN_0047ae50(0,"Filesystem call made without initialization\n");
  }
  if (*(int *)(&DAT_011436cc + in_EAX * 0x11c) != 0) {
    return *(long *)(*(int *)(&DAT_011436b8 + in_EAX * 0x11c) + 0x44);
  }
  _File = (FILE *)FUN_0047dc40();
  _Offset = _ftell(_File);
  _fseek(_File,0,2);
  lVar2 = _ftell(_File);
  _fseek(_File,_Offset,0);
  return lVar2;
}

