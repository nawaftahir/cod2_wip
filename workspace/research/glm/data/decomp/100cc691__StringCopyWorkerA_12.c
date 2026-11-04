// 100cc691 size=61 _StringCopyWorkerA@12

/* Library Function - Single Match
    _StringCopyWorkerA@12
   
   Library: Visual Studio 2005 Release */

undefined4 _StringCopyWorkerA_12(char *param_1,int param_2,char *param_3)

{
  undefined4 uVar1;
  
  uVar1 = 0;
  if (param_2 == 0) {
    uVar1 = 0x80070057;
  }
  else {
    do {
      if (*param_3 == '\0') break;
      *param_1 = *param_3;
      param_1 = param_1 + 1;
      param_3 = param_3 + 1;
      param_2 = param_2 + -1;
    } while (param_2 != 0);
    if (param_2 == 0) {
      param_1 = param_1 + -1;
      uVar1 = 0x8007007a;
    }
    *param_1 = '\0';
  }
  return uVar1;
}


