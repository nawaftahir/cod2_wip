// 10002e80 size=72 FUN_10002e80

float10 FUN_10002e80(char *param_1,float param_2)

{
  char *_String;
  int iVar1;
  int unaff_EBX;
  int iVar2;
  int unaff_EDI;
  double dVar3;
  
  iVar2 = 1;
  if (1 < unaff_EBX) {
    while( true ) {
      iVar1 = __stricmp(*(char **)(unaff_EDI + iVar2 * 8),param_1);
      if (iVar1 == 0) break;
      iVar2 = iVar2 + 1;
      if (unaff_EBX <= iVar2) {
        return (float10)param_2;
      }
    }
    _String = *(char **)(unaff_EDI + 4 + iVar2 * 8);
    if (_String != (char *)0x0) {
      dVar3 = _atof(_String);
      return (float10)dVar3;
    }
  }
  return (float10)param_2;
}


