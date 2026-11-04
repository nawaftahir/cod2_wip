// 100fc476 size=666 __tzset_lk

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* WARNING: Function: __SEH_epilog replaced with injection: EH_epilog3 */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* Library Function - Single Match
    __tzset_lk
   
   Library: Visual Studio 2003 Release */

void __tzset_lk(void)

{
  char cVar1;
  char cVar2;
  UINT CodePage;
  char *_Str1;
  int iVar3;
  size_t sVar4;
  long lVar5;
  DWORD DVar6;
  char *_Str;
  int local_20 [3];
  undefined1 local_14 [8];
  undefined4 uStack_c;
  undefined *local_8;
  
  local_8 = &DAT_1017c920;
  uStack_c = 0x100fc482;
  __lock(7);
  CodePage = DAT_101ae1a8;
  local_8 = (undefined *)0x0;
  DAT_101adfd4 = 0;
  DAT_101a4e54 = 0xffffffff;
  DAT_101a4e48 = 0xffffffff;
  _Str1 = (char *)__getenv_lk(&DAT_1017c91c);
  if ((_Str1 == (char *)0x0) || (*_Str1 == '\0')) {
    if (DAT_101adfd8 != (char *)0x0) {
      _free(DAT_101adfd8);
      DAT_101adfd8 = (char *)0x0;
    }
    DVar6 = GetTimeZoneInformation((LPTIME_ZONE_INFORMATION)&DAT_101adf28);
    if (DVar6 != 0xffffffff) {
      DAT_101adfd4 = 1;
      _DAT_101a4db0 = DAT_101adf28 * 0x3c;
      if (DAT_101adf6e != 0) {
        _DAT_101a4db0 = _DAT_101a4db0 + DAT_101adf7c * 0x3c;
      }
      if ((DAT_101adfc2 == 0) || (DAT_101adfd0 == 0)) {
        DAT_101a4db4 = 0;
        DAT_101a4db8 = 0;
      }
      else {
        DAT_101a4db4 = 1;
        DAT_101a4db8 = (DAT_101adfd0 - DAT_101adf7c) * 0x3c;
      }
      iVar3 = WideCharToMultiByte(CodePage,0,(LPCWSTR)&DAT_101adf2c,-1,PTR_DAT_101a4e40,0x3f,
                                  (LPCSTR)0x0,local_20);
      if ((iVar3 == 0) || (local_20[0] != 0)) {
        *PTR_DAT_101a4e40 = 0;
      }
      else {
        PTR_DAT_101a4e40[0x3f] = 0;
      }
      iVar3 = WideCharToMultiByte(CodePage,0,(LPCWSTR)&DAT_101adf80,-1,PTR_DAT_101a4e44,0x3f,
                                  (LPCSTR)0x0,local_20);
      if ((iVar3 == 0) || (local_20[0] != 0)) {
        *PTR_DAT_101a4e44 = 0;
      }
      else {
        PTR_DAT_101a4e44[0x3f] = 0;
      }
    }
  }
  else {
    if (DAT_101adfd8 != (char *)0x0) {
      iVar3 = _strcmp(_Str1,DAT_101adfd8);
      if (iVar3 == 0) goto LAB_100fc67a;
      if (DAT_101adfd8 != (char *)0x0) {
        _free(DAT_101adfd8);
      }
    }
    sVar4 = _strlen(_Str1);
    DAT_101adfd8 = _malloc(sVar4 + 1);
    if (DAT_101adfd8 != (char *)0x0) {
      FUN_100fe890(DAT_101adfd8,_Str1);
      local_8 = (undefined *)0xffffffff;
      FUN_100fc691();
      _strncpy(PTR_DAT_101a4e40,_Str1,3);
      PTR_DAT_101a4e40[3] = 0;
      _Str = _Str1 + 3;
      cVar1 = *_Str;
      if (cVar1 == '-') {
        _Str = _Str1 + 4;
      }
      lVar5 = _atol(_Str);
      _DAT_101a4db0 = lVar5 * 0xe10;
      for (; (cVar2 = *_Str, cVar2 == '+' || (('/' < cVar2 && (cVar2 < ':')))); _Str = _Str + 1) {
      }
      if (*_Str == ':') {
        _Str = _Str + 1;
        lVar5 = _atol(_Str);
        _DAT_101a4db0 = _DAT_101a4db0 + lVar5 * 0x3c;
        for (; ('/' < *_Str && (*_Str < ':')); _Str = _Str + 1) {
        }
        if (*_Str == ':') {
          _Str = _Str + 1;
          lVar5 = _atol(_Str);
          _DAT_101a4db0 = _DAT_101a4db0 + lVar5;
          for (; ('/' < *_Str && (*_Str < ':')); _Str = _Str + 1) {
          }
        }
      }
      if (cVar1 == '-') {
        _DAT_101a4db0 = -_DAT_101a4db0;
      }
      DAT_101a4db4 = (int)*_Str;
      if (DAT_101a4db4 != 0) {
        _strncpy(PTR_DAT_101a4e44,_Str,3);
        PTR_DAT_101a4e44[3] = 0;
        return;
      }
      *PTR_DAT_101a4e44 = 0;
      return;
    }
  }
LAB_100fc67a:
  __local_unwind2(local_14,0xffffffff);
  return;
}


