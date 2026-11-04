__declspec(naked) void __cdecl FUN_10102ec3(void) {
    __asm {
        or cl, cl
        jz skip
        fchs
    skip:
        ret
    }
}
