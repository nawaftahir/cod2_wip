// 10106468 size=61 FID_conflict:__atodbl

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Multiple Matches With Different Base Names
    __atodbl
    __atoflt
   
   Library: Visual Studio 2003 Release */

int __cdecl FID_conflict___atodbl(_CRT_FLOAT *_Result,char *_Str)

{
  INTRNCVT_STATUS IVar1;
  char *local_18;
  _LDBL12 local_14;
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  ___strgtold12(&local_14,&local_18,_Str,0,0,0,0);
  IVar1 = __ld12tod(&local_14,(_CRT_DOUBLE *)_Result);
  return IVar1;
}


