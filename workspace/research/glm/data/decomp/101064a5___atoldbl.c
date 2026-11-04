// 101064a5 size=62 __atoldbl

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    __atoldbl
   
   Library: Visual Studio 2003 Release */

int __cdecl __atoldbl(_LDOUBLE *_Result,char *_Str)

{
  INTRNCVT_STATUS IVar1;
  char *local_18;
  _LDBL12 local_14;
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  ___strgtold12(&local_14,&local_18,_Str,1,0,0,0);
  IVar1 = __ld12told(&local_14,_Result);
  return IVar1;
}


