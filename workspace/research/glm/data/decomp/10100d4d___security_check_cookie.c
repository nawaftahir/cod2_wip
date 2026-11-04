// 10100d4d size=14 __security_check_cookie

/* WARNING: This is an inlined function */

void __fastcall __security_check_cookie(uintptr_t _StackCookie)

{
  if (_StackCookie == DAT_101a50d0) {
    return;
  }
  report_failure();
  return;
}


