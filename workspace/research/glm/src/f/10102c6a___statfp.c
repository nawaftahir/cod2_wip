
__declspec(naked) void __statfp(void)
{
    __asm {
    push ecx
    wait
    fnstsw word ptr [esp]
    movsx eax, word ptr [esp]
    pop ecx
    ret
    }
}
