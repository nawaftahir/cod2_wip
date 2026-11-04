extern void sub_100fa460(void);

__declspec(naked) void write_string(void)
{
    __asm {
    test byte ptr [edi + 0xc], 0x40
    push ebx
    push esi
    mov esi, eax
    mov ebx, ecx
    je L3
    cmp dword ptr [edi + 8], 0
    jne L3
    mov eax, dword ptr [esp + 0xc]
    add dword ptr [esi], eax
    jmp L3
    mov al, byte ptr [ebx]
    dec dword ptr [esp + 0xc]
    mov ecx, edi
    call sub_100fa460
    inc ebx
    cmp dword ptr [esi], -1
    je L3
    cmp dword ptr [esp + 0xc], 0
    jg L3
    pop esi
    pop ebx
    ret
    }
}
