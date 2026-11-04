// 10100770 size=538 _LangCountryEnumProc@4

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    _LangCountryEnumProc@4
   
   Library: Visual Studio 2003 Release */

uint _LangCountryEnumProc_4(void)

{
  int iVar1;
  int iVar2;
  size_t sVar3;
  undefined4 uVar4;
  char local_80 [120];
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  iVar1 = _LcidFromHexString();
  iVar2 = (*DAT_101ae18c)(iVar1,(-(uint)(DAT_101ae17c != 0) & 0xfffff005) + 0x1002,local_80,0x78);
  if (iVar2 == 0) {
    DAT_101ae16c = 0;
    return 1;
  }
  iVar2 = __stricmp(DAT_101ae180,local_80);
  if (iVar2 == 0) {
    iVar2 = (*DAT_101ae18c)(iVar1,(-(uint)(DAT_101ae178 != 0) & 0xfffff002) + 0x1001,local_80,0x78);
    if (iVar2 == 0) {
      DAT_101ae16c = 0;
      return 1;
    }
    iVar2 = __stricmp(DAT_101ae188,local_80);
    if (iVar2 == 0) {
      DAT_101ae16c = DAT_101ae16c | 0x304;
      DAT_101ae170 = iVar1;
      DAT_101ae174 = iVar1;
    }
    else if ((DAT_101ae16c & 2) == 0) {
      if ((DAT_101ae184 == 0) ||
         (iVar2 = __strnicmp(DAT_101ae188,local_80,DAT_101ae184), iVar2 != 0)) {
        if (((DAT_101ae16c & 1) == 0) && (iVar2 = _TestDefaultCountry(iVar1), iVar2 != 0)) {
          DAT_101ae16c = DAT_101ae16c | 1;
          DAT_101ae174 = iVar1;
        }
      }
      else {
        DAT_101ae16c = DAT_101ae16c | 2;
        DAT_101ae174 = iVar1;
        sVar3 = _strlen(DAT_101ae188);
        if (sVar3 == DAT_101ae184) {
          DAT_101ae170 = iVar1;
        }
      }
    }
  }
  if ((DAT_101ae16c & 0x300) == 0x300) goto LAB_1010096e;
  iVar2 = (*DAT_101ae18c)(iVar1,(-(uint)(DAT_101ae178 != 0) & 0xfffff002) + 0x1001,local_80,0x78);
  if (iVar2 == 0) {
    DAT_101ae16c = 0;
    return 1;
  }
  iVar2 = __stricmp(DAT_101ae188,local_80);
  if (iVar2 == 0) {
    DAT_101ae16c = DAT_101ae16c | 0x200;
    if (((DAT_101ae178 == 0) && (DAT_101ae184 != 0)) &&
       (sVar3 = _strlen(DAT_101ae188), sVar3 == DAT_101ae184)) {
      uVar4 = 1;
      goto LAB_1010094d;
    }
  }
  else {
    if (((DAT_101ae178 != 0) || (DAT_101ae184 == 0)) ||
       (iVar2 = __strnicmp(DAT_101ae188,local_80,DAT_101ae184), iVar2 != 0)) goto LAB_1010096e;
    uVar4 = 0;
LAB_1010094d:
    iVar2 = _TestDefaultLanguage(iVar1,uVar4);
    if (iVar2 == 0) goto LAB_1010096e;
  }
  DAT_101ae16c = DAT_101ae16c | 0x100;
  if (DAT_101ae170 == 0) {
    DAT_101ae170 = iVar1;
  }
LAB_1010096e:
  return ~(DAT_101ae16c >> 2) & 1;
}


