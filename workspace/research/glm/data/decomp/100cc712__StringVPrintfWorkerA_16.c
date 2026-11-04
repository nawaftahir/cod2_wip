// 100cc712 size=76 _StringVPrintfWorkerA@16

/* Library Function - Single Match
    _StringVPrintfWorkerA@16
   
   Library: Visual Studio 2005 Release */

undefined4 _StringVPrintfWorkerA_16(char *param_1,int param_2,char *param_3,va_list param_4)

{
  uint _Count;
  uint uVar1;
  undefined4 uVar2;
  
  uVar2 = 0;
  if (param_2 == 0) {
    uVar2 = 0x80070057;
  }
  else {
    _Count = param_2 - 1;
    uVar1 = __vsnprintf(param_1,_Count,param_3,param_4);
    if (((int)uVar1 < 0) || (_Count < uVar1)) {
      uVar2 = 0x8007007a;
    }
    else if (uVar1 != _Count) {
      return 0;
    }
    param_1[_Count] = '\0';
  }
  return uVar2;
}


