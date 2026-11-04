extern void sub_100c99cc(void);
extern void sub_100c9a1a(void);

__declspec(naked) void FUN_100c9a14(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    or esi, dword ptr [ebp + 0xc]
    push edi
    push esi
    mov edi, ecx
    call sub_100c99cc
    test eax, eax
    jl L5
    test esi, 0x2000
    je L5
    mov eax, dword ptr [edi + 0x14]
    mov ecx, dword ptr [ebp + 0x10]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ecx + 0xc]
    mov ecx, dword ptr [ecx + 0x10]
    and eax, 0x7ff
    or eax, 0xb0000000
    sub ecx, 0
    je L5
    dec ecx
    je L5
    dec ecx
    je L5
    dec ecx
    jne L5
    or eax, 0xff0000
    jmp L5
    or eax, 0xaa0000
    jmp L5
    or eax, 0x550000
    push eax
    mov ecx, edi
    call sub_100c9a1a
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 0xc
    }
}
