// 10108732 size=39 __ltoa

/* Library Function - Single Match
    __ltoa
   
   Library: Visual Studio 2003 Release */

char * __cdecl __ltoa(long _Value,char *_Dest,int _Radix)

{
  undefined4 uVar1;
  
  uVar1 = 0;
  if ((_Radix == 10) && (_Value < 0)) {
    uVar1 = 1;
  }
  xtoa(_Radix,uVar1);
  return _Dest;
}


