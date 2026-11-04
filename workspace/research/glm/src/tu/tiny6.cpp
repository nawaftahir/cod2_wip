/* 0x10086d08 / 0x10086d4e: thiscall ctors (twin bodies).
   Compiled as real C++ member functions -> native thiscall. */
extern const unsigned char vtbl_10110440[];
extern const unsigned char vtbl_10110448[];

struct T86 {
    void *vt;
    unsigned int f4;
    T86(unsigned int a);            // 0x10086d08: vt then f4
    T86(int skip, unsigned int a);  // 0x10086d4e: f4 then vt
};

T86::T86(unsigned int a)
{
    vt = (void *)vtbl_10110440;
    f4 = a;
}

T86::T86(int skip, unsigned int a)
{
    f4 = a;
    vt = (void *)vtbl_10110448;
}
