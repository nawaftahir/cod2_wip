// 10082505 size=240 FUN_10082505

undefined4 FUN_10082505(LPCWSTR param_1,int param_2)

{
  uint cbMultiByte;
  HANDLE pvVar1;
  undefined4 uVar2;
  int *in_ECX;
  _OSVERSIONINFOA local_a0;
  int *local_c;
  LPCWSTR local_8;
  
  local_8 = (LPCWSTR)0x0;
  if (param_1 == (LPCWSTR)0x0) {
    return 0x8876086c;
  }
  if (param_2 != 0) {
    local_a0.dwOSVersionInfoSize = 0x94;
    local_c = in_ECX;
    GetVersionExA(&local_a0);
    if (local_a0.dwPlatformId != 2) {
      cbMultiByte = WideCharToMultiByte(0xfde9,0,param_1,-1,(LPSTR)0x0,0,(LPCSTR)0x0,(LPBOOL)0x0);
      local_8 = operator_new(cbMultiByte);
      if (local_8 == (LPCWSTR)0x0) {
        return 0x8007000e;
      }
      WideCharToMultiByte(0xfde9,0,param_1,-1,(LPSTR)local_8,cbMultiByte,(LPCSTR)0x0,(LPBOOL)0x0);
      param_1 = local_8;
      param_2 = 0;
      in_ECX = local_c;
    }
    if (param_2 != 0) {
      pvVar1 = CreateFileW(param_1,0x40000000,0,(LPSECURITY_ATTRIBUTES)0x0,2,0,(HANDLE)0x0);
      goto LAB_100825cf;
    }
  }
  pvVar1 = CreateFileA((LPCSTR)param_1,0x40000000,0,(LPSECURITY_ATTRIBUTES)0x0,2,0,(HANDLE)0x0);
LAB_100825cf:
  *in_ECX = (int)pvVar1;
  _free(local_8);
  if (*in_ECX == -1) {
    GetLastError();
    uVar2 = 0x88760b59;
  }
  else {
    uVar2 = 0;
  }
  return uVar2;
}


