// 100fe5c8 size=108 __cftoe

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    __cftoe
   
   Library: Visual Studio 2003 Release */

errno_t __cdecl __cftoe(double *_Value,char *_Buf,size_t _SizeInBytes,int _Dec,int _Caps)

{
  size_t unaff_ESI;
  STRFLT _PtFlt;
  _strflt local_30;
  char local_20 [24];
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  _PtFlt = *(STRFLT *)_Value;
  __fltout2((_CRT_DOUBLE)*_Value,&local_30,local_20,unaff_ESI);
  __fptostr(_Buf + (uint)(0 < (int)_SizeInBytes) + (uint)(local_30.sign == 0x2d),_SizeInBytes + 1,
            (int)&local_30,_PtFlt);
  __cftoe2(_SizeInBytes,_Dec,0);
  return (errno_t)_Buf;
}


