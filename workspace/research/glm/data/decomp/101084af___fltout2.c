// 101084af size=108 __fltout2

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    __fltout2
   
   Library: Visual Studio 2003 Release */

STRFLT __cdecl __fltout2(_CRT_DOUBLE _Dbl,STRFLT _Flt,char *_ResultStr,size_t _SizeInBytes)

{
  int iVar1;
  short local_30;
  char local_2e;
  undefined1 local_2c [24];
  undefined4 local_14;
  undefined4 uStack_10;
  undefined2 uStack_c;
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  ___dtold(&local_14,&_Dbl);
  iVar1 = _I10_OUTPUT(local_14,uStack_10,uStack_c,0x11,0,&local_30);
  _Flt->flag = iVar1;
  _Flt->sign = (int)local_2e;
  _Flt->decpt = (int)local_30;
  FUN_100fe890(_ResultStr,local_2c);
  _Flt->mantissa = _ResultStr;
  return _Flt;
}


