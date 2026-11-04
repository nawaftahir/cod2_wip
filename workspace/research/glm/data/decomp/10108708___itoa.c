// 10108708 size=42 __itoa

/* Library Function - Single Match
    __itoa
   
   Library: Visual Studio 2003 Release */

char * __cdecl __itoa(int _Value,char *_Dest,int _Radix)

{
  undefined4 uVar1;
  
  if ((_Radix == 10) && (_Value < 0)) {
    uVar1 = 1;
    _Radix = 10;
  }
  else {
    uVar1 = 0;
  }
  xtoa(_Radix,uVar1);
  return _Dest;
}


