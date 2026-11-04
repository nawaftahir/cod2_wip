// 10100b67 size=437 ___get_qualified_locale

/* Library Function - Single Match
    ___get_qualified_locale
   
   Library: Visual Studio 2003 Release */

BOOL __cdecl ___get_qualified_locale(LPLC_STRINGS _LpInStr,UINT *_LpCodePage,LPLC_STRINGS _LpOutStr)

{
  LCID LVar1;
  undefined2 uVar2;
  int iVar3;
  uint _Value;
  BOOL BVar4;
  
  if (DAT_101ae18c == (code *)0x0) {
    if (DAT_101ae00c == 2) {
      DAT_101ae18c = GetLocaleInfoA_exref;
    }
    else {
      DAT_101ae18c = crtGetLocaleInfoA;
    }
  }
  if (_LpInStr == (LPLC_STRINGS)0x0) {
LAB_10100c41:
    _GetLcidFromDefault();
LAB_10100c46:
    if (DAT_101ae16c == 0) {
      return 0;
    }
  }
  else {
    DAT_101ae180 = _LpInStr->szLanguage + 0x20;
    DAT_101ae188 = _LpInStr;
    if ((DAT_101ae180 != (wchar_t *)0x0) && ((char)*DAT_101ae180 != '\0')) {
      _TranslateName(&PTR_s_america_1017dab8,0x16,&DAT_101ae180);
    }
    DAT_101ae16c = 0;
    if ((DAT_101ae188 == (LPLC_STRINGS)0x0) || ((char)DAT_101ae188->szLanguage[0] == '\0')) {
      if ((DAT_101ae180 == (wchar_t *)0x0) || ((char)*DAT_101ae180 == '\0')) goto LAB_10100c41;
      _GetLcidFromCountry();
      goto LAB_10100c46;
    }
    if ((DAT_101ae180 == (wchar_t *)0x0) || ((char)*DAT_101ae180 == '\0')) {
      _GetLcidFromLanguage();
    }
    else {
      _GetLcidFromLangCountry();
    }
    if (DAT_101ae16c == 0) {
      iVar3 = _TranslateName(&PTR_s_american_1017dc68,0x40,&DAT_101ae188);
      if (iVar3 != 0) {
        if ((DAT_101ae180 == (wchar_t *)0x0) || ((char)*DAT_101ae180 == '\0')) {
          _GetLcidFromLanguage();
        }
        else {
          _GetLcidFromLangCountry();
        }
      }
      goto LAB_10100c46;
    }
  }
  _Value = _ProcessCodePage();
  if (((_Value == 0) || (BVar4 = IsValidCodePage(_Value & 0xffff), BVar4 == 0)) ||
     (BVar4 = IsValidLocale(DAT_101ae170,1), LVar1 = DAT_101ae170, BVar4 == 0)) {
LAB_10100d16:
    BVar4 = 0;
  }
  else {
    if (_LpCodePage != (UINT *)0x0) {
      uVar2 = (undefined2)DAT_101ae174;
      *(short *)_LpCodePage = (short)DAT_101ae170;
      *(undefined2 *)((int)_LpCodePage + 2) = uVar2;
      *(short *)(_LpCodePage + 1) = (short)_Value;
    }
    if (_LpOutStr != (LPLC_STRINGS)0x0) {
      if ((short)*_LpCodePage == 0x814) {
        FUN_100fe890(_LpOutStr,"Norwegian-Nynorsk");
      }
      else {
        iVar3 = (*DAT_101ae18c)(LVar1,0x1001,_LpOutStr,0x40);
        if (iVar3 == 0) goto LAB_10100d16;
      }
      iVar3 = (*DAT_101ae18c)(DAT_101ae174,0x1002,_LpOutStr->szLanguage + 0x20,0x40);
      if (iVar3 == 0) goto LAB_10100d16;
      __itoa(_Value,(char *)_LpOutStr->szCountry,10);
    }
    BVar4 = 1;
  }
  return BVar4;
}


