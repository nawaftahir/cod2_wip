/* 0x101063c0 / 0x101063d6: __ld12tod/__ld12tof - x87 80-bit to binary
 * converters forwarding to the shared worker with a rounding tag. */
extern unsigned char fmt_101a5490[];
extern unsigned char fmt_101a54a8[];
extern int __cdecl P_10106268(int a, int b, unsigned int tag);

int __cdecl ld12tod(int a, int b)
{
    return P_10106268(a, b, (unsigned int)fmt_101a5490);
}

int __cdecl ld12tof(int a, int b)
{
    return P_10106268(a, b, (unsigned int)fmt_101a54a8);
}
