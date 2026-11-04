extern int g_1010f780;
extern int g_1019be20;
extern void sub_100f91ba(void);

__declspec(naked) void FUN_1009ca51(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi]
    sub eax, 0
    je L9
    dec eax
    je L9
    dec eax
    je L9
    dec eax
    je L9
    mov eax, 0x80004005
    jmp L9
    fld qword ptr [ebp + 0xc]
    fstp qword ptr [esi + 8]
    jmp L9
    fld qword ptr [ebp + 0xc]
    fcomp qword ptr g_1019be20
    fld qword ptr [ebp + 0xc]
    fnstsw ax
    test ah, 1
    jne L9
    fadd qword ptr g_1010f780
    jmp L9
    fsub qword ptr g_1010f780
    call sub_100f91ba
    jmp L9
    fld qword ptr [ebp + 0xc]
    fld qword ptr g_1019be20
    fucompp
    fnstsw ax
    test ah, 0x44
    jnp L9
    xor eax, eax
    inc eax
    jmp L9
    xor eax, eax
    mov dword ptr [esi + 8], eax
    xor eax, eax
    pop esi
    pop ebp
    ret 0x10
    }
}
