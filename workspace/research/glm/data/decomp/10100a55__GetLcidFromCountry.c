// 10100a55 size=55 _GetLcidFromCountry

/* Library Function - Single Match
    _GetLcidFromCountry
   
   Library: Visual Studio 2003 Release */

void _GetLcidFromCountry(void)

{
  size_t sVar1;
  
  sVar1 = _strlen(DAT_101ae180);
  DAT_101ae17c = (uint)(sVar1 == 3);
  EnumSystemLocalesA(_CountryEnumProc_4,1);
  if ((DAT_101ae16c & 4) == 0) {
    DAT_101ae16c = 0;
  }
  return;
}


