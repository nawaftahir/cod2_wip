extern void sub_10054d92(void);
extern void sub_10054f17(void);

__declspec(naked) void FUN_10055000(void)
{
    __asm {
    push ebx
    mov ebx, dword ptr [esp + 0x10]
    shl ebx, 7
    xor edx, edx
    mov eax, 0x3b9ac9f0
    div ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 0x10]
    mov ebp, dword ptr [esi + 4]
    push edi
    mov edi, eax
    test edi, edi
    jg L7
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 0x14], 0x46
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
    mov eax, dword ptr [esp + 0x20]
    cmp edi, eax
    jl L7
    mov edi, eax
    lea edx, [eax*4]
    mov eax, dword ptr [esp + 0x18]
    push edx
    push eax
    push esi
    mov dword ptr [ebp + 0x50], edi
    call sub_10054d92
    mov ebp, eax
    mov eax, dword ptr [esp + 0x2c]
    add esp, 0xc
    xor esi, esi
    test eax, eax
    jbe L7
    mov eax, dword ptr [esp + 0x20]
    sub eax, esi
    cmp edi, eax
    jb L7
    mov edi, eax
    mov edx, dword ptr [esp + 0x18]
    mov eax, dword ptr [esp + 0x14]
    mov ecx, edi
    imul ecx, dword ptr [esp + 0x1c]
    shl ecx, 7
    push ecx
    push edx
    push eax
    call sub_10054f17
    add esp, 0xc
    test edi, edi
    jbe L7
    mov ecx, edi
    mov dword ptr [ebp + esi*4], eax
    inc esi
    add eax, ebx
    dec ecx
    jne L7
    cmp esi, dword ptr [esp + 0x20]
    jb L7
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    pop ebx
    ret
    }
}
