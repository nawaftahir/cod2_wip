// 100cc75e size=77 _StringVPrintfWorkerW@16

/* Library Function - Single Match
    _StringVPrintfWorkerW@16
   
   Library: Visual Studio 2005 Release */

undefined4 _StringVPrintfWorkerW_16(wchar_t *param_1,int param_2,wchar_t *param_3,va_list param_4)

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
    uVar1 = FID_conflict_vswprintf(param_1,_Count,param_3,param_4);
    if (((int)uVar1 < 0) || (_Count < uVar1)) {
      uVar2 = 0x8007007a;
    }
    else if (uVar1 != _Count) {
      return 0;
    }
    param_1[_Count] = L'\0';
  }
  return uVar2;
}


