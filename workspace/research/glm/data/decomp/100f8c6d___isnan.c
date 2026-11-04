// 100f8c6d size=46 __isnan

/* Library Function - Single Match
    __isnan
   
   Libraries: Visual Studio 2003 Release, Visual Studio 2005 Release */

int __cdecl __isnan(double _X)

{
  if ((((_X._6_2_ & 0x7ff8) != 0x7ff0) ||
      ((((ulonglong)_X & 0x7ffff00000000) == 0 && (_X._0_4_ == 0)))) &&
     ((_X._6_2_ & 0x7ff8) != 0x7ff8)) {
    return 0;
  }
  return 1;
}


