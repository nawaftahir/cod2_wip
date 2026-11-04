// 100fb2cc size=47 __freeptd

/* Library Function - Single Match
    __freeptd
   
   Library: Visual Studio 2003 Release */

void __cdecl __freeptd(_ptiddata _Ptd)

{
  if (DAT_101a4898 != -1) {
    if (_Ptd == (_ptiddata)0x0) {
      _Ptd = (_ptiddata)(*DAT_101addbc)(DAT_101a4898);
    }
    __freefls_4(_Ptd);
    (*DAT_101addc0)(DAT_101a4898,0);
  }
  return;
}


