// 100f886d size=33 __copysign

/* Library Function - Single Match
    __copysign
   
   Library: Visual Studio 2003 Release */

double __cdecl __copysign(double _Number,double _Sign)

{
  return (double)CONCAT44((_Sign._4_4_ ^ _Number._4_4_) & 0x7fffffff ^ _Sign._4_4_,_Number._0_4_);
}


