
// One-byte RET functions verified against retail; ownership/signatures provisional.
extern "C" void FUN_00409de0() {}
extern "C" void FUN_00409df0() {}
extern "C" void FUN_00409e00() {}
extern "C" void FUN_00409f70() {}
extern "C" void FUN_00409f80() {}
extern "C" void FUN_0040a9b0() {}
extern "C" void FUN_0040a9c0() {}
extern "C" void FUN_0040a9d0() {}
extern "C" void FUN_0040b850() {}

// Additional retail-matched short accessors and returns. Signatures are provisional.
extern "C" int __fastcall FUN_0040abb0(const int *value) { return *value; }
extern "C" int __fastcall FUN_0040ac50(const int *value) { return *value; }
extern "C" int __fastcall FUN_0040b1b0(const int *value) { return value[11]; }
extern "C" float __fastcall FUN_0040b1e0(const float *value) { return value[23]; }
extern "C" float __fastcall FUN_0040b320(const float *value) { return value[22]; }
extern "C" int FUN_0040b500() {return 0;}
extern "C" void __stdcall FUN_0040b510(int a0) {  }
extern "C" void __stdcall FUN_0040b520(int a0, int a1, int a2) {  }
extern "C" void __stdcall FUN_0040b530(int a0) {  }
extern "C" int __stdcall FUN_0040b540(int a0) { return 0; }
extern "C" int __fastcall FUN_0040b770(const int *value) { return *value; }
extern "C" int __stdcall FUN_0040b840(int a0) { return 0; }
extern "C" void __stdcall FUN_0040b860(int a0) {  }
extern "C" void __stdcall FUN_0040b870(int a0) {  }
extern "C" void __stdcall FUN_0040bae0(int a0) {  }
extern "C" int __fastcall FUN_0040bc50(const int *value) { return value[7]; }
