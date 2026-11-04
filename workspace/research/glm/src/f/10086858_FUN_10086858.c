
__declspec(naked) void FUN_10086858(void)
{
    __asm {
    mov eax, dword ptr [eax + 0xbc]
    mov eax, dword ptr [eax + 0x58]
    lea ecx, [ecx + ecx*2]
    lea edx, [edx + edx*2]
    lea ecx, [eax + ecx*4]
    lea eax, [eax + edx*4]
    mov edx, dword ptr [ecx + 4]
    push esi
    mov esi, dword ptr [eax + 4]
    cmp edx, esi
    jae L3
    or eax, 0xffffffff
    pop esi
    ret
    jbe L3
    xor eax, eax
    inc eax
    pop esi
    ret
    mov ecx, dword ptr [ecx + 8]
    mov eax, dword ptr [eax + 8]
    cmp ecx, eax
    jl L3
    xor edx, edx
    cmp ecx, eax
    setg dl
    pop esi
    mov eax, edx
    ret
    }
}
