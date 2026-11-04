// 10102924 size=40 __set_errno

/* Library Function - Single Match
    __set_errno
   
   Library: Visual Studio 2003 Release */

errno_t __cdecl __set_errno(int _Value)

{
  undefined4 *puVar1;
  
  if (_Value == 1) {
    _Value = FUN_100fc216();
    *(undefined4 *)_Value = 0x21;
  }
  else if ((1 < _Value) && (_Value < 4)) {
    puVar1 = (undefined4 *)FUN_100fc216();
    *puVar1 = 0x22;
    return (errno_t)puVar1;
  }
  return _Value;
}


