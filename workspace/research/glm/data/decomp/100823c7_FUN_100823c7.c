// 100823c7 size=318 FUN_100823c7

undefined4 FUN_100823c7(LPCWSTR param_1,int param_2)

{
  uint cbMultiByte;
  HANDLE pvVar1;
  DWORD DVar2;
  LPVOID pvVar3;
  undefined4 *in_ECX;
  _OSVERSIONINFOA local_9c;
  LPCWSTR local_8;
  
  local_8 = (LPCWSTR)0x0;
  if (param_1 == (LPCWSTR)0x0) {
    return 0x8876086c;
  }
  if (param_2 == 0) {
LAB_10082482:
    pvVar1 = CreateFileA((LPCSTR)param_1,0x80000000,1,(LPSECURITY_ATTRIBUTES)0x0,3,0x10000000,
                         (HANDLE)0x0);
  }
  else {
    local_9c.dwOSVersionInfoSize = 0x94;
    GetVersionExA(&local_9c);
    if (local_9c.dwPlatformId != 2) {
      cbMultiByte = WideCharToMultiByte(0xfde9,0,param_1,-1,(LPSTR)0x0,0,(LPCSTR)0x0,(LPBOOL)0x0);
      local_8 = operator_new(cbMultiByte);
      if (local_8 == (LPCWSTR)0x0) {
        return 0x8007000e;
      }
      WideCharToMultiByte(0xfde9,0,param_1,-1,(LPSTR)local_8,cbMultiByte,(LPCSTR)0x0,(LPBOOL)0x0);
      param_1 = local_8;
      param_2 = 0;
    }
    if (param_2 == 0) goto LAB_10082482;
    pvVar1 = CreateFileW(param_1,0x80000000,1,(LPSECURITY_ATTRIBUTES)0x0,3,0x10000000,(HANDLE)0x0);
  }
  *in_ECX = pvVar1;
  _free(local_8);
  if ((HANDLE)*in_ECX != (HANDLE)0xffffffff) {
    pvVar1 = CreateFileMappingA((HANDLE)*in_ECX,(LPSECURITY_ATTRIBUTES)0x0,2,0,0,(LPCSTR)0x0);
    in_ECX[1] = pvVar1;
    if (pvVar1 != (HANDLE)0xffffffff) {
      DVar2 = GetFileSize((HANDLE)*in_ECX,(LPDWORD)0x0);
      in_ECX[3] = DVar2;
      if (DVar2 != 0xffffffff) {
        if (DVar2 == 0) {
          in_ECX[2] = 0;
        }
        else {
          pvVar3 = MapViewOfFile((HANDLE)in_ECX[1],4,0,0,0);
          in_ECX[2] = pvVar3;
          if (pvVar3 == (LPVOID)0x0) goto LAB_100824ec;
        }
        return 0;
      }
    }
  }
LAB_100824ec:
  GetLastError();
  return 0x88760b59;
}


