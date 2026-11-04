
undefined4 FUN_004bf760(undefined4 *param_1,int param_2,int param_3)

{
  HANDLE pvVar1;
  BOOL BVar2;
  int iVar3;
  LPSTR *ppCVar4;
  _PROCESS_INFORMATION local_54;
  _STARTUPINFOA local_44;
  
  pvVar1 = (HANDLE)__get_osfhandle(param_3);
  ppCVar4 = &local_44.lpReserved;
  for (iVar3 = 0x10; iVar3 != 0; iVar3 = iVar3 + -1) {
    *ppCVar4 = (LPSTR)0x0;
    ppCVar4 = ppCVar4 + 1;
  }
  local_54.hThread = (HANDLE)0x0;
  local_54.dwProcessId = 0;
  local_54.hProcess = (HANDLE)0x0;
  local_54.dwThreadId = 0;
  local_44.cb = 0x44;
  local_44.dwFlags = 0x101;
  local_44.wShowWindow = 5;
  local_44.hStdInput = (HANDLE)__get_osfhandle(param_2);
  local_44.hStdOutput = pvVar1;
  local_44.hStdError = GetStdHandle(0xfffffff4);
  BVar2 = CreateProcessA((LPCSTR)0x0,(LPSTR)*param_1,(LPSECURITY_ATTRIBUTES)0x0,
                         (LPSECURITY_ATTRIBUTES)0x0,1,0x28,(LPVOID)0x0,(LPCSTR)0x0,&local_44,
                         &local_54);
  if (BVar2 == 0) {
    FUN_004c87f0("CreateProcess",*param_1);
    return 0xffffffff;
  }
  CloseHandle(local_54.hProcess);
  CloseHandle(local_54.hThread);
  return 0;
}

