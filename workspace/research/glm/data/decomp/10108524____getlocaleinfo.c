// 10108524 size=295 ___getlocaleinfo

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    ___getlocaleinfo
   
   Library: Visual Studio 2003 Release */

int __cdecl
___getlocaleinfo(_locale_t _Locale,int _Lc_type,LPCWSTR _LocaleName,LCTYPE _FieldType,void *_Address
                )

{
  byte bVar1;
  bool bVar2;
  size_t _Size;
  DWORD DVar3;
  LPSTR _LpLCData;
  char *_Source;
  char *_Dest;
  int iVar4;
  byte *pbVar5;
  char local_88 [128];
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  if (_Locale != (_locale_t)0x1) {
    if (_Locale != (_locale_t)0x0) {
      return -1;
    }
    pbVar5 = &DAT_101ae250;
    iVar4 = ___crtGetLocaleInfoW(_Lc_type,_LocaleName,&DAT_101ae250,4,0);
    if (iVar4 != 0) {
      *(undefined1 *)_FieldType = 0;
      do {
        bVar1 = *pbVar5;
        iVar4 = _isdigit((uint)bVar1);
        if (iVar4 == 0) {
          return 0;
        }
        pbVar5 = pbVar5 + 2;
        *(byte *)_FieldType = *(char *)_FieldType * '\n' + bVar1 + -0x30;
      } while ((int)pbVar5 < 0x101ae258);
      return 0;
    }
    return -1;
  }
  _Source = local_88;
  bVar2 = false;
  _Size = ___crtGetLocaleInfoA((_locale_t)_Lc_type,_LocaleName,(LCTYPE)_Source,(LPSTR)0x80,0);
  if (_Size == 0) {
    DVar3 = GetLastError();
    if (DVar3 != 0x7a) {
      return -1;
    }
    _LpLCData = (LPSTR)___crtGetLocaleInfoA((_locale_t)_Lc_type,_LocaleName,0,(LPSTR)0x0,0);
    if (_LpLCData == (LPSTR)0x0) {
      return -1;
    }
    _Source = _malloc((size_t)_LpLCData);
    if (_Source == (char *)0x0) {
      return -1;
    }
    bVar2 = true;
    _Size = ___crtGetLocaleInfoA((_locale_t)_Lc_type,_LocaleName,(LCTYPE)_Source,_LpLCData,0);
    if (_Size == 0) goto LAB_101085cc;
  }
  _Dest = _malloc(_Size);
  *(char **)_FieldType = _Dest;
  if (_Dest != (char *)0x0) {
    _strncpy(_Dest,_Source,_Size);
    if (bVar2) {
      _free(_Source);
    }
    return 0;
  }
  if (!bVar2) {
    return -1;
  }
LAB_101085cc:
  _free(_Source);
  return -1;
}


