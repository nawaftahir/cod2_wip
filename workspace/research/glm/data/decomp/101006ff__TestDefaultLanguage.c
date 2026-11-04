// 101006ff size=113 _TestDefaultLanguage

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    _TestDefaultLanguage
   
   Library: Visual Studio 2003 Release */

undefined4 _TestDefaultLanguage(uint param_1,int param_2)

{
  int iVar1;
  uint uVar2;
  size_t sVar3;
  size_t sVar4;
  undefined4 uVar5;
  undefined1 local_80 [120];
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  iVar1 = (*DAT_101ae18c)(param_1 & 0x3ff | 0x400,1,local_80,0x78);
  if (iVar1 == 0) {
LAB_1010075f:
    uVar5 = 0;
  }
  else {
    uVar2 = _LcidFromHexString();
    if ((param_1 != uVar2) && (param_2 != 0)) {
      sVar3 = _strlen(DAT_101ae188);
      sVar4 = _GetPrimaryLen();
      if (sVar4 == sVar3) goto LAB_1010075f;
    }
    uVar5 = 1;
  }
  return uVar5;
}


