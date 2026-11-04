extern int g_101a4684;
extern void sub_100f7ccf(void);
extern void sub_100fb11b(void);
extern void sub_100fd534(void);

__declspec(naked) void _atol(void)
{
    __asm {
    push esi
    push edi
    call sub_100fb11b
    mov edi, dword ptr [eax + 0x64]
    cmp edi, dword ptr g_101a4684
    je L12
    call sub_100f7ccf
    mov edi, eax
    mov esi, dword ptr [esp + 0xc]
    cmp dword ptr [edi + 0x28], 1
    movzx eax, byte ptr [esi]
    jle L12
    push 8
    push eax
    push edi
    call sub_100fd534
    add esp, 0xc
    jmp L12
    mov ecx, dword ptr [edi + 0x48]
    movzx eax, byte ptr [ecx + eax*2]
    and eax, 8
    test eax, eax
    je L12
    inc esi
    jmp L12
    movzx ecx, byte ptr [esi]
    inc esi
    cmp ecx, 0x2d
    mov edx, ecx
    je L12
    cmp ecx, 0x2b
    jne L12
    movzx ecx, byte ptr [esi]
    inc esi
    xor eax, eax
    cmp ecx, 0x30
    jl L12
    cmp ecx, 0x39
    jg L12
    sub ecx, 0x30
    jmp L12
    or ecx, 0xffffffff
    cmp ecx, -1
    je L12
    lea eax, [eax + eax*4]
    lea eax, [ecx + eax*2]
    movzx ecx, byte ptr [esi]
    inc esi
    jmp L12
    cmp edx, 0x2d
    pop edi
    pop esi
    jne L12
    neg eax
    ret
    }
}
