// 101087e0 size=49 __i64toa

/* Library Function - Single Match
    __i64toa
   
   Libraries: Visual Studio 2003 Release, Visual Studio 2005 Release */

char * __cdecl __i64toa(longlong _Val,char *_DstBuf,int _Radix)

{
  undefined4 uVar1;
  
  uVar1 = 0;
  if (((_Radix == 10) && (_Val < 0x100000000)) && (_Val < 0)) {
    uVar1 = 1;
  }
  FID_conflict__x64toa_20(_Val,_Radix,uVar1);
  return _DstBuf;
}


