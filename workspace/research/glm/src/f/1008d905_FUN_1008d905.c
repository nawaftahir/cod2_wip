extern void sub_1008d8a4(void);

__declspec(naked) void FUN_1008d905(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0x14]
    mov edx, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [eax + edx*4]
    push edi
    mov edi, dword ptr [ebp + 0xc]
    mov edi, dword ptr [eax + edi*4]
    push edi
    push esi
    mov dword ptr [edi + 0x30], edx
    call sub_1008d8a4
    test eax, eax
    jl L3
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [edi]
    push ebx
    mov ebx, 0xe000000
    mov edx, ecx
    and edx, ebx
    and eax, ebx
    and ecx, 0xf1ffffff
    cmp edx, eax
    mov dword ptr [esi], ecx
    pop ebx
    jbe L3
    mov eax, edx
    or ecx, eax
    cmp dword ptr [esi + 0x60], 0
    mov dword ptr [esi], ecx
    jne L3
    mov eax, dword ptr [edi + 0x60]
    mov dword ptr [esi + 0x60], eax
    mov eax, dword ptr [edi + 0x64]
    mov dword ptr [esi + 0x64], eax
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 8
    }
}
