// 100fa28b size=149 __fltin2

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    __fltin2
   
   Library: Visual Studio 2003 Release */

FLT __cdecl __fltin2(FLT _Flt,char *_Str,_locale_t _Locale)

{
  uint uVar1;
  INTRNCVT_STATUS IVar2;
  uint uVar3;
  char *local_20;
  _CRT_DOUBLE local_1c;
  _LDBL12 local_14;
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  uVar3 = 0;
  uVar1 = ___strgtold12(&local_14,&local_20,_Str,0,0,0,0);
  if ((uVar1 & 4) == 0) {
    IVar2 = __ld12tod(&local_14,&local_1c);
    if (((uVar1 & 2) != 0) || (IVar2 == INTRNCVT_OVERFLOW)) {
      uVar3 = 0x80;
    }
    if (((uVar1 & 1) != 0) || (IVar2 == INTRNCVT_UNDERFLOW)) {
      uVar3 = uVar3 | 0x100;
    }
  }
  else {
    uVar3 = 0x200;
    local_1c.x._0_4_ = 0;
    local_1c.x._4_4_ = 0;
  }
  _Flt->flags = uVar3;
  _Flt->nbytes = (int)local_20 - (int)_Str;
  *(undefined4 *)&_Flt->dval = local_1c.x._0_4_;
  *(undefined4 *)((int)&_Flt->dval + 4) = local_1c.x._4_4_;
  return _Flt;
}


