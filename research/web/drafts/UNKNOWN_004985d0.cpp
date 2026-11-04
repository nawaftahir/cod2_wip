/* Recovered functions from the 0x004985d0 group.
 *
 * Each authored body below matches the retail MSVC 7.1 instruction span.
 * The TU boundary and original names are still hypotheses; the unassigned
 * filesystem wrappers at 0x00498610/0x00498630 and 0x004986c0..0x0049874e
 * require separate reconstruction/header-code accounting.
 *
 * Empty functions here really emit RET in the retail image. They are not
 * stand-ins for routines with non-empty implementations.
 */
extern "C" void FUN_004985d0() {}
extern "C" void FUN_004985e0() {}
extern "C" void FUN_004985f0() {}
extern "C" void FUN_00498600() {}

/* The retail entry at 0x00498610 forwards a byte count to FS_Read.
 * 0x00498630 is still unresolved and remains out of canonical source.
 */
extern int FS_Read(void *buffer, int len, int handle);
extern "C" void FUN_00498610(void *buffer, int length, int elementSize, int handle)
{
    FS_Read(buffer, elementSize * length, handle);
}


extern "C" void FUN_0047f770();
extern "C" void FUN_00498630()
{
    FUN_0047f770();
}

extern "C" void FUN_00498650() {}
extern "C" bool FUN_00498660() { return false; }
extern "C" bool FUN_00498670() { return true; }

/* The retail bodies index a 32-bit pointer table. Its original name,
 * size and other users remain to be verified before FILE VERIFIED.
 */
static void *s_sysValues[4];
extern "C" void FUN_00498680(int index, void *value)
{
    s_sysValues[index] = value;
}
extern "C" void *FUN_00498690(int index)
{
    return s_sysValues[index];
}
extern "C" bool FUN_004986a0() { return false; }
extern "C" bool FUN_004986b0() { return false; }

extern "C" void FUN_004986c0(unsigned *dst, unsigned x, unsigned y, unsigned z)
{
    dst[0] = x;
    dst[1] = y;
    dst[2] = z;
}

extern "C" void FUN_004986e0() {}
