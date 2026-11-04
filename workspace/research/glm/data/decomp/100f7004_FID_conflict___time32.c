// 100f7004 size=57 FID_conflict:__time32

/* Library Function - Multiple Matches With Different Base Names
    __time32
    _time
   
   Libraries: Visual Studio 2003 Release, Visual Studio 2005 Release */

__time32_t __cdecl FID_conflict___time32(__time32_t *_Time)

{
  __time32_t _Var1;
  _FILETIME local_c;
  
  GetSystemTimeAsFileTime(&local_c);
  _Var1 = __aulldiv(local_c.dwLowDateTime + 0x2ac18000,
                    local_c.dwHighDateTime + 0xfe624e21 + (uint)(0xd53e7fff < local_c.dwLowDateTime)
                    ,10000000,0);
  if (_Time != (__time32_t *)0x0) {
    *_Time = _Var1;
  }
  return _Var1;
}


