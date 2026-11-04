extern int g_1010f780;
extern int g_1019be20;
extern void sub_100f91b1(void);

__declspec(naked) void FUN_1009c9f2(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0xc]
    mov eax, dword ptr [ecx]
    sub eax, 0
    je L7
    dec eax
    je L7
    dec eax
    je L7
    dec eax
    je L7
    mov eax, 0x80004005
    jmp L7
    fld qword ptr [ecx + 8]
    fcomp qword ptr g_1019be20
    fld qword ptr [ecx + 8]
    fnstsw ax
    test ah, 1
    jne L7
    fadd qword ptr g_1010f780
    jmp L7
    fsub qword ptr g_1010f780
    call sub_100f91b1
    jmp L7
    mov eax, dword ptr [ecx + 8]
    jmp L7
    xor eax, eax
    cmp dword ptr [ecx + 8], eax
    setne al
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [ecx], eax
    xor eax, eax
    pop ebp
    ret 0xc
    }
}
