// 1010066b size=148 _CountryEnumProc@4

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    _CountryEnumProc@4
   
   Library: Visual Studio 2003 Release */

uint _CountryEnumProc_4(void)

{
  undefined4 uVar1;
  int iVar2;
  uint uVar3;
  char local_80 [120];
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  uVar1 = _LcidFromHexString();
  iVar2 = (*DAT_101ae18c)(uVar1,(-(uint)(DAT_101ae17c != 0) & 0xfffff005) + 0x1002,local_80,0x78);
  if (iVar2 == 0) {
    DAT_101ae16c = 0;
    uVar3 = 1;
  }
  else {
    iVar2 = __stricmp(DAT_101ae180,local_80);
    if (iVar2 == 0) {
      iVar2 = _TestDefaultCountry(uVar1);
      if (iVar2 != 0) {
        DAT_101ae16c = DAT_101ae16c | 4;
        DAT_101ae170 = uVar1;
        DAT_101ae174 = uVar1;
      }
    }
    uVar3 = ~(DAT_101ae16c >> 2) & 1;
  }
  return uVar3;
}


