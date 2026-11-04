
__declspec(naked) void __clrfp(void)
{
    __asm {
    push ecx
    fnstsw word ptr [esp]
    fnclex
    movsx eax, word ptr [esp]
    pop ecx
    ret
    }
}
