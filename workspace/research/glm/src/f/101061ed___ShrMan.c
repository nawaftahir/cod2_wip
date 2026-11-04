
__declspec(naked) void __ShrMan(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0xc
    mov eax, dword ptr [ebp + 0xc]
    push ebx
    push esi
    push edi
    push 0x20
    pop esi
    cdq
    mov ecx, esi
    idiv ecx
    mov ebx, dword ptr [ebp + 8]
    or edi, 0xffffffff
    mov dword ptr [ebp + 0xc], esi
    mov ecx, edx
    shl edi, cl
    mov dword ptr [ebp - 8], eax
    xor eax, eax
    sub dword ptr [ebp + 0xc], edx
    not edi
    mov dword ptr [ebp - 4], eax
    mov esi, dword ptr [ebx + eax*4]
    mov ecx, esi
    and ecx, edi
    mov dword ptr [ebp - 0xc], ecx
    mov ecx, edx
    shr esi, cl
    mov ecx, dword ptr [ebp + 0xc]
    or esi, dword ptr [ebp - 4]
    mov dword ptr [ebx + eax*4], esi
    mov esi, dword ptr [ebp - 0xc]
    shl esi, cl
    inc eax
    cmp eax, 3
    mov dword ptr [ebp - 4], esi
    jl L4
    push 2
    pop eax
    mov ecx, eax
    sub ecx, dword ptr [ebp - 8]
    lea ecx, [ebx + ecx*4]
    cmp eax, dword ptr [ebp - 8]
    jl L4
    mov edx, dword ptr [ecx]
    mov dword ptr [ebx + eax*4], edx
    jmp L4
    and dword ptr [ebx + eax*4], 0
    dec eax
    sub ecx, 4
    test eax, eax
    jge L4
    pop edi
    pop esi
    pop ebx
    leave
    ret
    }
}
