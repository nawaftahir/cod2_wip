extern void sub_100ad50b(void);

__declspec(naked) void FUN_100ad87a(void)
{
    __asm {
    mov edi, edi
    push ebx
    push esi
    mov esi, ecx
    xor ebx, ebx
    cmp dword ptr [esi + 0x4c], ebx
    push edi
    jbe L5
    mov edi, 0xfff00000
    mov eax, dword ptr [esi + 0x230]
    mov edx, dword ptr [eax + ebx*4]
    test edx, edx
    je L5
    mov eax, dword ptr [eax + ebx*4]
    mov eax, dword ptr [eax]
    mov ecx, eax
    and eax, edi
    and ecx, 0xfffff
    cmp eax, 0x60500000
    je L5
    mov eax, dword ptr [edx]
    and eax, edi
    cmp eax, 0x60000000
    jne L5
    mov eax, dword ptr [edx + 8]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [esi + 0x14]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 4]
    cmp ecx, dword ptr [esi + 0x88]
    jne L5
    push dword ptr [eax + 0xc]
    mov ecx, esi
    push dword ptr [esi + 0x220]
    push dword ptr [esi + 0x22c]
    call sub_100ad50b
    test eax, eax
    jl L5
    inc ebx
    cmp ebx, dword ptr [esi + 0x4c]
    jb L5
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    ret
    }
}
