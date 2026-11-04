extern void sub_100b86a0(void);
extern void sub_100c7b82(void);

__declspec(naked) void FUN_100b895e(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    push esi
    push edi
    mov edi, ecx
    mov eax, dword ptr [edi + 0x14]
    mov ecx, dword ptr [ebp + 8]
    mov esi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [esi + 8]
    cmp eax, -1
    je L5
    push ebx
    push eax
    mov ecx, edi
    call L5
    test eax, eax
    jl L5
    push esi
    mov ecx, edi
    call sub_100b86a0
    test eax, eax
    jl L5
    mov ecx, dword ptr [esi + 0x10]
    mov eax, dword ptr [esi + 0xc]
    lea eax, [ecx + eax*4]
    push eax
    mov ecx, edi
    call sub_100c7b82
    test eax, eax
    jge L5
    mov eax, 0x8007000e
    jmp L5
    mov eax, dword ptr [edi + 0x10c]
    lea eax, [eax + ebx*4]
    inc dword ptr [eax]
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
    }
}
