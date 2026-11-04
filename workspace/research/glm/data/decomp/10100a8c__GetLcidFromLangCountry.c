// 10100a8c size=134 _GetLcidFromLangCountry

/* Library Function - Single Match
    _GetLcidFromLangCountry
   
   Library: Visual Studio 2003 Release */

void _GetLcidFromLangCountry(void)

{
  size_t sVar1;
  
  sVar1 = _strlen(DAT_101ae188);
  DAT_101ae178 = (uint)(sVar1 == 3);
  sVar1 = _strlen(DAT_101ae180);
  DAT_101ae17c = (uint)(sVar1 == 3);
  DAT_101ae170 = 0;
  if (DAT_101ae178 == 0) {
    DAT_101ae184 = _GetPrimaryLen();
  }
  else {
    DAT_101ae184 = 2;
  }
  EnumSystemLocalesA(_LangCountryEnumProc_4,1);
  if ((((DAT_101ae16c & 0x100) == 0) || ((DAT_101ae16c & 0x200) == 0)) || ((DAT_101ae16c & 7) == 0))
  {
    DAT_101ae16c = 0;
  }
  return;
}


