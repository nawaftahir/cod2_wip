// 1010098a size=203 _LanguageEnumProc@4

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    _LanguageEnumProc@4
   
   Library: Visual Studio 2003 Release */

uint _LanguageEnumProc_4(void)

{
  undefined4 uVar1;
  int iVar2;
  undefined4 uVar3;
  char local_80 [120];
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  uVar1 = _LcidFromHexString();
  iVar2 = (*DAT_101ae18c)(uVar1,(-(uint)(DAT_101ae178 != 0) & 0xfffff002) + 0x1001,local_80,0x78);
  if (iVar2 == 0) {
    DAT_101ae16c = 0;
    return 1;
  }
  iVar2 = __stricmp(DAT_101ae188,local_80);
  if (iVar2 == 0) {
    if (DAT_101ae178 == 0) {
      uVar3 = 1;
      goto LAB_10100a1c;
    }
  }
  else {
    if (((DAT_101ae178 != 0) || (DAT_101ae184 == 0)) ||
       (iVar2 = __strnicmp(DAT_101ae188,local_80,DAT_101ae184), iVar2 != 0)) goto LAB_10100a3b;
    uVar3 = 0;
LAB_10100a1c:
    iVar2 = _TestDefaultLanguage(uVar1,uVar3);
    if (iVar2 == 0) goto LAB_10100a3b;
  }
  DAT_101ae16c = DAT_101ae16c | 4;
  DAT_101ae170 = uVar1;
  DAT_101ae174 = uVar1;
LAB_10100a3b:
  return ~(DAT_101ae16c >> 2) & 1;
}


