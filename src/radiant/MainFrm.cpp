#include <windows.h>

// Retail no-op functions: individual single-byte bodies verified against CoD2Radiant.exe.
// Original member ownership/signatures remain unproved.

// One-byte RET functions; provisional names/signatures.
extern "C" void FUN_00411240() {}
extern "C" void FUN_00414c70() {}
extern "C" void FUN_00414d80() {}
extern "C" void FUN_00414d90() {}
extern "C" void FUN_00415690() {}
extern "C" void FUN_00415ba0() {}
extern "C" void FUN_00417f00() {}
extern "C" void FUN_00417f10() {}
extern "C" void FUN_00419c70() {}
extern "C" void FUN_00419c80() {}
extern "C" void FUN_0041ac10() {}
extern "C" void FUN_0041ac20() {}
extern "C" void FUN_0041b0f0() {}
extern "C" void FUN_0041c0b0() {}
extern "C" void FUN_0041c0c0() {}
extern "C" void FUN_0041c0d0() {}

// Additional retail-matched short accessors and returns. Signatures are provisional.
extern "C" int __stdcall FUN_00411230(int a0, int a1) { return 0; }
extern "C" void __stdcall FUN_004115a0(int a0, int a1) {  }
extern "C" int __fastcall FUN_0041e740(const int *value) { return value[1]; }
extern "C" int __fastcall FUN_0041e750(const int *value) { return *value; }
extern "C" void __stdcall FUN_0041eaa0(int a0) {  }
extern "C" void __stdcall FUN_0041f150(int a0) {  }
extern "C" float __fastcall FUN_0041f200(const float *value) { return value[24]; }
extern "C" unsigned char __fastcall FUN_0041f210(const unsigned char *value) { return value[80]; }

bool MouseDown()
{
  if (::GetAsyncKeyState(VK_LBUTTON))
    return true;
  if (::GetAsyncKeyState(VK_RBUTTON))
    return true;
  if (::GetAsyncKeyState(VK_MBUTTON))
    return true;
  return false;
}
