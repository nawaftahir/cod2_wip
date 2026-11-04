// 100f582b size=29 _StringCchCopyW@12

/* Library Function - Single Match
    _StringCchCopyW@12
   
   Library: Visual Studio 2005 Release */

undefined4 _StringCchCopyW_12(undefined4 param_1,uint param_2)

{
  undefined4 uVar1;
  
  if (0x7fffffff < param_2) {
    return 0x80070057;
  }
  uVar1 = _StringCopyWorkerW_12();
  return uVar1;
}


