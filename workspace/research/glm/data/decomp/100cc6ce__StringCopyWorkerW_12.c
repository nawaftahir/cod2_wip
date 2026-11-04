// 100cc6ce size=68 _StringCopyWorkerW@12

/* Library Function - Single Match
    _StringCopyWorkerW@12
   
   Library: Visual Studio 2005 Release */

undefined4 _StringCopyWorkerW_12(short *param_1,int param_2,short *param_3)

{
  undefined4 uVar1;
  
  uVar1 = 0;
  if (param_2 == 0) {
    uVar1 = 0x80070057;
  }
  else {
    do {
      if (*param_3 == 0) break;
      *param_1 = *param_3;
      param_1 = param_1 + 1;
      param_3 = param_3 + 1;
      param_2 = param_2 + -1;
    } while (param_2 != 0);
    if (param_2 == 0) {
      param_1 = param_1 + -1;
      uVar1 = 0x8007007a;
    }
    *param_1 = 0;
  }
  return uVar1;
}


