
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_00407b30(void)

{
  code *Value;
  _OSVERSIONINFOA local_98;
  undefined4 local_4;
  
  local_4 = DAT_0058ea68;
  local_98.dwOSVersionInfoSize = 0x94;
  GetVersionExA(&local_98);
  if ((local_98.dwPlatformId != 2) || (Value = (code *)&LAB_00407ba0, local_98.dwMajorVersion < 5))
  {
    Value = FUN_00407bb0;
  }
  InterlockedExchange((LONG *)&PTR_FUN_005984fc,(LONG)Value);
  (*(code *)PTR_FUN_005984fc)();
  return;
}

