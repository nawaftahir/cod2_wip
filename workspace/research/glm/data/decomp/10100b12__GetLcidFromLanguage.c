// 10100b12 size=85 _GetLcidFromLanguage

/* Library Function - Single Match
    _GetLcidFromLanguage
   
   Library: Visual Studio 2003 Release */

void _GetLcidFromLanguage(void)

{
  size_t sVar1;
  
  sVar1 = _strlen(DAT_101ae188);
  DAT_101ae178 = (uint)(sVar1 == 3);
  if (sVar1 == 3) {
    DAT_101ae184 = 2;
  }
  else {
    DAT_101ae184 = _GetPrimaryLen();
  }
  EnumSystemLocalesA(_LanguageEnumProc_4,1);
  if ((DAT_101ae16c & 4) == 0) {
    DAT_101ae16c = 0;
  }
  return;
}


