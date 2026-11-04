extern void sub_100674c2(void);

__declspec(naked) void FUN_10067bd4(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    lea eax, [ebp + 8]
    push eax
    push dword ptr [ebp + 8]
    mov esi, ecx
    call sub_100674c2
    test eax, eax
    jl L3
    mov ecx, dword ptr [ebp + 0xc]
    cmp ecx, 0xff
    jne L3
    mov ecx, dword ptr [ebp + 8]
    mov edx, dword ptr [esi + 0x1c]
    shl ecx, 2
    add edx, ecx
    and dword ptr [edx], 0x20
    mov edx, dword ptr [esi + 0x1c]
    add ecx, edx
    or dword ptr [ecx], 1
    jmp L3
    cmp ecx, 0x10
    mov edx, dword ptr [ebp + 8]
    jne L3
    mov ecx, dword ptr [esi + 0x1c]
    lea ecx, [ecx + edx*4]
    or dword ptr [ecx], 0x10
    jmp L3
    push edi
    mov edi, dword ptr [esi + 0x1c]
    shl edx, 2
    add edi, edx
    and dword ptr [edi], 0xfffffff0
    mov esi, dword ptr [esi + 0x1c]
    add edx, esi
    and ecx, 0xf
    or dword ptr [edx], ecx
    pop edi
    pop esi
    pop ebp
    ret 8
    }
}
