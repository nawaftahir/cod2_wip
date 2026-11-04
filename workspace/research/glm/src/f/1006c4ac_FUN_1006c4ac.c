extern void sub_100f7899(void);

__declspec(naked) void FUN_1006c4ac(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 8]
    inc ebx
    push esi
    mov esi, ecx
    inc ebx
    cmp dword ptr [esi + 0x8c], ebx
    push edi
    jae L4
    mov eax, 0x2000
    cmp ebx, eax
    mov edi, ebx
    jae L4
    mov edi, eax
    mov eax, edi
    shl eax, 2
    push eax
    call sub_100f7899
    test eax, eax
    pop ecx
    je L4
    mov ecx, dword ptr [esi + 0x88]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esi + 0x8c]
    neg ecx
    mov dword ptr [eax + 4], ecx
    mov dword ptr [esi + 0x88], eax
    mov dword ptr [esi + 0x8c], edi
    jmp L4
    mov eax, dword ptr [esi + 0x88]
    mov dword ptr [eax], eax
    mov ecx, dword ptr [esi + 0x8c]
    mov dword ptr [eax + 4], ecx
    sub dword ptr [esi + 0x8c], ebx
    mov ecx, ebx
    shl ecx, 2
    add dword ptr [esi + 0x88], ecx
    add eax, 8
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 4
    }
}
