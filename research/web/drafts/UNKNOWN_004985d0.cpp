/* Retail 0x004985d0..0x004986f0 experimental TU; only bodies with directly supported return behavior. 
 * No executable address casts, forced ABI, wrappers, or fabricated calls.
 */
extern "C" void FUN_004985d0() {}
extern "C" void FUN_004985e0() {}
extern "C" void FUN_004985f0() {}
extern "C" void FUN_00498600() {}
extern "C" void FUN_00498650() {}
extern "C" bool FUN_00498660() { return false; }
extern "C" bool FUN_00498670() { return true; }
extern "C" bool FUN_004986a0() { return false; }
extern "C" bool FUN_004986b0() { return false; }
extern "C" void FUN_004986e0() {}

/* Source hypothesis for the original indexed 32-bit value store; no
 * hardcoded executable address and no fabricated caller is required.
 */
static void *s_sysValues[4];
extern "C" void *FUN_00498690(int index) { return s_sysValues[index]; }
extern "C" void FUN_00498680(int index, void *value) { s_sysValues[index] = value; }
