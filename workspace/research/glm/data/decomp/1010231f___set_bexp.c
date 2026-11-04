// 1010231f size=37 __set_bexp

/* Library Function - Single Match
    __set_bexp
   
   Libraries: Visual Studio 2003 Release, Visual Studio 2005 Release */

float10 __set_bexp(undefined8 param_1,short param_2)

{
  undefined8 local_c;
  
  local_c = (double)CONCAT26(param_2 << 4 | param_1._6_2_ & 0x800f,(undefined6)param_1);
  return (float10)local_c;
}


